using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Touri_Server.Models
{
    static class Constants
    {
        public static string LOG_TAG = "ExampleApp";
        public static string PLACES_API_BASE = "https://maps.googleapis.com/maps/api/place";
        public static string GEOCODE_API_BASE = "http://maps.googleapis.com/maps/api/geocode/xml?address={0}&sensor=false";
        public static string TYPE_AUTOCOMPLETE = "/autocomplete";
        public static string OUT_JSON = "/json";
        public static string API_KEY = "AIzaSyDPRsZJ3iQcO8PdUU1yCjFAKA7etzg7PPM";
        public static int WithinDistanceDefaultInKM = 50;
        public static int DefaultImageId = 1;

    }

    public class Converter
    {
        public Guide convertToGuide(GuideProfile guideProfile)
        {
            Guide g = new Guide();

            g.username = guideProfile.username;
            g.fName = guideProfile.firstName;
            g.lName = guideProfile.lastName;
            g.guideId = guideProfile.guideId;
            g.address1 = guideProfile.address1;
            g.address2 = guideProfile.address2;
            g.description = guideProfile.description;
            g.availability = 0; //@todo
            g.profileImage = guideProfile.profileImage;

            foreach (GuideLanguage l in guideProfile.GuideLanguages)
            {
                LanguageWrapper lw = new LanguageWrapper();
                lw.languageId = l.languageId;
                lw.language = l.Language.Language1;
                lw.fluency = l.Fluency1.fluency1;
                g.languages.Add(lw);
            }

            foreach (GuideExpertises e in guideProfile.GuideExpertises)
            {
                ExpertiseWrapper ew = new ExpertiseWrapper();
                ew.expertiseId = e.expertiseId;
                ew.expertise = e.Expertise.expertise1;
                g.expertises.Add(ew);
            }

            foreach (GuideLocation n in guideProfile.GuideLocations)
            {
                LocationWrapper lw = new LocationWrapper();
                lw.locationId = n.id;
                lw.location = n.cityServed;
                g.locationsServed.Add(lw);
            }

            return g;
        }
    }

   
    public class Geocoder
    {
        public Geocoder()
        {

        }

        public Geocode GetGeocode(string address)
        {
            var requestUri = string.Format(Constants.GEOCODE_API_BASE, Uri.EscapeDataString(address));

            var request = WebRequest.Create(requestUri);
            var response = request.GetResponse();
            var xdoc = XDocument.Load(response.GetResponseStream());

            var result = xdoc.Element("GeocodeResponse").Element("result");
            if (result == null)
            {
                return null;
            }
            var locationElement = result.Element("geometry").Element("location");
            var lat = locationElement.Element("lat").Value;
            var lng = locationElement.Element("lng").Value;

            Geocode gc = new Geocode();
            gc.latitude = lat.ToString();
            gc.longitude = lng.ToString();
            gc.address = address;
            return gc;
        }
    }
}
