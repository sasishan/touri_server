using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using System.Device.Location;
using Touri_Server.Models;
using System.Xml.Linq;

namespace Touri_Server.Controllers
{
    public class ExpertisesController : ApiController
    {
        private NativusDBEntities db = new NativusDBEntities();

        // GET: api/Guides
        // return expertises with at least one guide in the location(s)
        [Route("api/expertises/search")]
        [HttpGet]
        public IEnumerable<Expertise_object> GetExpertisesSearch([FromUri] SearchGuideCriteria query)
        {
            if (query == null)
            {
                return null;
            }

            List<Expertise_object> expertiseList = new List<Expertise_object>();
            List<GuideProfile> queryProfiles = new List<GuideProfile>();
            List<Expertise> expertises = db.Expertises.ToList<Expertise>();
            int profileCount = 0;
            int withinDistance = Constants.WithinDistanceDefaultInKM;
            if (query.withinDistance != null)
            {
                withinDistance = Convert.ToInt32(query.withinDistance);
            }
            withinDistance *= 1000; // convert to KM

            foreach (Expertise e in expertises)
            {
                profileCount = 0;
                queryProfiles.Clear();
                foreach (string qloc in query.locs)
                {
                    //get the geocode from google api
                    Geocoder gCoder = new Geocoder();
                    Geocode gc = gCoder.GetGeocode(qloc);
                    if (gc == null)
                    {
                        continue;
                    }

                    //then do a proximity search
                    Double latitude = Convert.ToDouble(gc.latitude);
                    Double longitude = Convert.ToDouble(gc.longitude);
                    var coord = new GeoCoordinate(latitude, longitude);


                    List<GuideProfile> guideProfilesExps = (from guides in db.GuideProfiles
                                                            from guideExp in guides.GuideExpertises
                                                            where guideExp.expertiseId == e.expertiseId
                                                            select guides).ToList<GuideProfile>();

                    List<GuideProfile> guideProfilesLocs = (from guides in guideProfilesExps
                                                            from locations in guides.GuideLocations
                                                            where ((new GeoCoordinate(locations.latitude, locations.longitude)).GetDistanceTo(coord) <= withinDistance)
                                                            select guides).ToList<GuideProfile>();

/*                    List<GuideProfile> guideProfilesLocs = (from guides in db.GuideProfiles
                                                            from locations in guides.GuideLocations
                                                            from guideExp in guides.GuideExpertises
                                                            where ((new GeoCoordinate(locations.latitude, locations.longitude)).GetDistanceTo(coord) <= withinDistance)
                                                            select guides).ToList<GuideProfile>();*/

                    foreach (GuideProfile g in guideProfilesLocs)
                    {
                        if (!queryProfiles.Contains(g))
                        {
                            profileCount++;
                        }
                    }
                }
                Expertise_object newExp = convertToExpertiseObject(e);
                newExp.numberOfGuides = profileCount;
                expertiseList.Add(newExp);
            }

            return expertiseList;
        }

        // GET: api/Expertises
        public IEnumerable<Expertise_object> GetExpertises()
        {
            List<Expertise> expertises = db.Expertises.ToList<Expertise>();
            List<Expertise_object> expertiseList = new List<Expertise_object>();

            foreach (Expertise e in expertises)
            {
                Expertise_object eo = convertToExpertiseObject(e);
                var numGuides = (from guides in db.GuideExpertises where (guides.expertiseId == e.expertiseId) select guides).Count();
                eo.numberOfGuides = numGuides;

                expertiseList.Add(eo);
            }
            return expertiseList;
        }

        // GET: api/Expertises/5
        [ResponseType(typeof(Expertise_object))]
        public IHttpActionResult GetExpertise(int id)
        {
            Expertise expertise = db.Expertises.Find(id);

            if (expertise == null)
            {
                return NotFound();
            }
            Expertise_object e = convertToExpertiseObject(expertise);

            return Ok(e);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ExpertiseExists(int id)
        {
            return db.Expertises.Count(e => e.expertiseId == id) > 0;
        }



        private Expertise_object convertToExpertiseObject(Expertise expertise)
        {
            Expertise_object e = new Expertise_object();

            e.expertiseId = expertise.expertiseId;
            e.expertise = expertise.expertise1;
            e.description = expertise.description;
            if (expertise.imageId != null)
            {
                e.imageId = (int)expertise.imageId;
            }
            else
            {
                e.imageId = 0;
            }

            return e;
        }
    }
}