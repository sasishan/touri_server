using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Touri_Server.Models
{
    public class Geocode
    {
        public string latitude { get; set; }
        public string longitude { get; set; }
        public string address { get; set; }
    }


    public class ChatMessage
    {
        public int id { get; set; }
        public string fromUser { get; set; }
        public string toUser { get; set; }
        public string message { get; set; }
        public string timeStamp { get; set; }
        public string downloaded { get; set; }
        public string lastDownloaded { get; set; }
        public int fromUserId { get; set; }

        public void setDownloaded()
        {
            downloaded = "Y";
            lastDownloaded = DateTime.Now.ToString();
        }

        public void setNotDownloaded()
        {
            downloaded = "N";
            lastDownloaded = "";
        }
    }


    public class SearchGuideCriteria
    {
        public int guideId { get; set; }
        public List<string> langs { get; set; }
        public List<string> locs { get; set; }
        public List<string> exps { get; set; }
        public string withinDistance  { get; set; }

        public SearchGuideCriteria()
        {
            langs = new List<string>();
            locs = new List<string>();
            exps = new List<string>();
        }
    }


    public class Expertise_object
    {
        public int expertiseId { get; set; }
        public string expertise { get; set; }
        public string description { get; set; }
        public int imageId { get; set; }
        public int numberOfGuides { get; set; }

        public Expertise_object()
        {
        }
    }

    public class Guide
    {
        public int guideId { get; set; }
        public string username { get; set; }
        public string fName { get; set; }
        public string lName { get; set; }
        public string address1 { get; set; }
        public string address2 { get; set; }
        public string phone { get; set; }
        public string description { get; set; }
        public string summary { get; set; }
        public int availability { get; set; }
        public int profileImage { get; set; }
        public string lastMessageSent { get; set; }
        public List<LanguageWrapper> languages { get; set; }
        public List<LocationWrapper> locationsServed { get; set; }
        public List<ExpertiseWrapper> expertises { get; set; }

        public Guide()
        {
            // keep for serializable
            languages = new List<LanguageWrapper>();
            locationsServed = new List<LocationWrapper>();
            expertises = new List<ExpertiseWrapper>();
        }
    }

    public class GuideNames
    {
        public string fName { get; set; }
        public string lName { get; set; }

        public GuideNames()
        {
            // keep for serializable
        }
    }

    public class LanguageWrapper
    {
        public int languageId { get; set; }
        public string language { get; set; }
        public string fluency { get; set; }

        public void Language()
        {
            // keep for serializable
        }
    }

    public class ListLocsLangs
    {
        public List<string> locs { get; set; }
        public List<int> langIds { get; set; }
        public List<int> expIds { get; set; }

        public void StringLocsLangs()
        {
            // keep for serializable
        }
    }


    public class LocationWrapper
    {
        public int locationId { get; set; }
        public string location { get; set; }
        public double latitude { get; set; }
        public double longitude { get; set; }

        public void Location()
        {
            // keep for serializable
        }
    }

    public class ExpertiseWrapper
    {
        public int expertiseId { get; set; }
        public string expertise { get; set; }

        public void Expertise()
        {
            // keep for serializable
        }
    }

}
