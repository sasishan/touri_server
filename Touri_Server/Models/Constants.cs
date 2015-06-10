using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Xml.Linq;

namespace Touri_Server.Models
{
    static class Constants
    {
        public static string PLACES_API_BASE = "https://maps.googleapis.com/maps/api/place";
        public static string GEOCODE_API_BASE = "http://maps.googleapis.com/maps/api/geocode/xml?address={0}&sensor=false";
        public static string TYPE_AUTOCOMPLETE = "/autocomplete";
        public static string OUT_JSON = "/json";
        public static string API_KEY = "AIzaSyDPRsZJ3iQcO8PdUU1yCjFAKA7etzg7PPM";
        public static int WithinDistanceDefaultInKM = 50;
        public static int DefaultImageId = 1;

        public static string IMAGE_CATEGORY_GUIDE_PROFILE = "guide";
        public static string IMAGE_CATEGORY_APPLICATION_EXPERTISE = "expertise";
        public static string APPLICATION_USER = "default";
        public static string IMAGE_PATH = "images";
        public static string IMAGE_APPLICATION_DEFAULT_PATH = "images\application";

        public static string THUMBNAIL_PATH = "thumbnail\\";

        public static string MessageDownloaded = "Y";
        public static string MessageNotDownloaded = "N";

        public static string MessageNotDelivered = "Unable to deliver message.";

        public static int Uninitialized = -1;
        public static int SUCCESS = 1;
        public static int FAIL = -1;
    }

    public class TouriPaths
    {
        public string GetNewImageDirPath(String category, string username, string fileNameWithExtension)
        {
            string fullPath = null;
            string fileName = Path.GetFileNameWithoutExtension(fileNameWithExtension);
            string extension = Path.GetExtension(fileNameWithExtension);
            fullPath = HttpContext.Current.Server.MapPath("~").ToString() + GetBaseImagePath(category) + "\\" + category + "\\" + username + "\\";// +fileName + extension;

            return fullPath;
        }

        public string GetNewImageDirThumbnailPath(String category, string username, string fileNameWithExtension)
        {
            string fullPath = GetNewImageDirPath(category, username, fileNameWithExtension);
            fullPath += Constants.THUMBNAIL_PATH;
            return fullPath;
        }

        public string GetBaseImagePath(String category)
        {
            return Constants.IMAGE_PATH;
        }


        public string GetImageThumbnailPathFromImageRecord(TouriImage img)
        {
            string fullPath = GetImagePathFromImageRecord(img);
            return (fullPath += Constants.THUMBNAIL_PATH);
        }

        public string GetImagePathFromImageRecord(TouriImage img)
        {
            string fullPath;
            if (img.path.Equals("images\\application"))
            {
                //special path to be used by the application only
                //the path for images is: basepath/<category>/<filename>.<extension>
                fullPath = HttpContext.Current.Server.MapPath("~").ToString() + img.path + "\\" + img.category + "\\" + img.filename + img.extension;
            }
            else
            {
                //the path for images is: basepath/<category>/<username>/<filename>.<extension>
                fullPath = HttpContext.Current.Server.MapPath("~").ToString() + img.path + "\\" + img.category + "\\" + img.username + "\\" + img.filename + img.extension;
            }
            return (fullPath);
        }
    }
    public class Converter
    {
        NativusDBEntities db = new NativusDBEntities();

        public ChatMessage convertToChatMessage(Message msg)
        {
            ChatMessage cm = new ChatMessage();
            cm.id = msg.id;
            cm.message = msg.message1;
            cm.fromUser = msg.fromUser;
            cm.toUser = msg.toUser;
            cm.timeStamp = msg.Timestamp.ToString();

            return cm;
        }

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
            g.summary = guideProfile.summary;

            int countCons = (int)(from cons in db.Connections
                                  where (cons.username == g.username)
                                  select cons).Count();

            g.availability = 0;
            if (countCons > 0)
            {
                g.availability = 1;
            }

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
                lw.latitude = n.latitude;
                lw.longitude = n.longitude;
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
            if (address == null)
            {
                return null;
            }
            var requestUri = string.Format(Constants.GEOCODE_API_BASE, Uri.EscapeDataString(address));

            try
            {
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
            catch (Exception e)
            {
                return null;
            }

        }
    }
}
