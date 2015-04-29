using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Touri_Server.Models
{
    class Constants
    {
        public static string LOG_TAG = "ExampleApp";
        public static string PLACES_API_BASE = "https://maps.googleapis.com/maps/api/place";
        public static string GEOCODE_API_BASE = "http://maps.googleapis.com/maps/api/geocode/xml?address={0}&sensor=false";
        public static string TYPE_AUTOCOMPLETE = "/autocomplete";
        public static string OUT_JSON = "/json";
        public static string API_KEY = "AIzaSyDPRsZJ3iQcO8PdUU1yCjFAKA7etzg7PPM";
        public static int WithinDistanceDefaultInKM = 50;
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
