﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using System.Xml.Linq;
using System.Device;
using Touri_Server.Models;
using System.Device.Location;
using WebApplicationMVC5.Controllers;

namespace Touri_Server.Controllers
{
    public class GuidesController : ApiController
    {
        private NativusDBEntities db = new NativusDBEntities();
        Converter converter = new Converter();

        // GET: api/Guides
        [Route("api/guides/search")]
        [HttpGet]
        public IEnumerable<Guide> GetGuideProfiles([FromUri] SearchGuideCriteria query)
        {
            List<GuideProfile> queryProfiles = new List<GuideProfile>();
            if (query == null)
            {
                return null;
            }

            if (query.langs.Count==0)
            {
                queryProfiles = db.GuideProfiles.ToList();
            }
            else
            {
                foreach (string qlang in query.langs)
                {
                    IQueryable<GuideProfile> guideProfiles = from guides in db.GuideProfiles
                                                             from langs in guides.GuideLanguages
                                                             where (langs.Language.Language1.ToLower() == qlang.ToLower())
                                                             select guides;
                    foreach (GuideProfile g in guideProfiles)
                    {
                        if (!queryProfiles.Contains(g))
                        {
                            queryProfiles.Add(g);
                        }
                    }
                }
            }

            List<GuideProfile> queryProfiles2 = new List<GuideProfile>();
            int withinDistance = Constants.WithinDistanceDefaultInKM;
            if (query.withinDistance != null)
            {
                withinDistance = Convert.ToInt32(query.withinDistance);
            }
            withinDistance *= 1000; // convert to KM

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

/*                List<GuideProfile> guideProfilesLocs = (from guides in queryProfiles
                                                         from locations in guides.GuideLocations
                                                         where (locations.cityServed.ToLower()==qloc.ToLower())
                                                         select guides).ToList<GuideProfile>();*/

                List<GuideProfile> guideProfilesLocs = (from guides in queryProfiles
                                                        from locations in guides.GuideLocations
                                                        where ((new GeoCoordinate(locations.latitude, locations.longitude)).GetDistanceTo(coord) <= withinDistance)
                                                        select guides).ToList<GuideProfile>();

                foreach(GuideProfile g in guideProfilesLocs)
                {
                    if (!queryProfiles2.Contains(g))
                    {
                        queryProfiles2.Add(g);
                    }
                }
            }

            if (query.locs.Count>0)
            {
                queryProfiles = queryProfiles2;
            }

            queryProfiles2 = new List<GuideProfile>();
            foreach (string qExp in query.exps)
            {
                List<GuideProfile> guideProfilesLocs = (from guides in queryProfiles
                                                        from exps in guides.GuideExpertises
                                                        where (exps.Expertise.expertise1.ToLower() == qExp.ToLower())
                                                        select guides).ToList<GuideProfile>();

                foreach (GuideProfile g in guideProfilesLocs)
                {
                    if (!queryProfiles2.Contains(g))
                    {
                        queryProfiles2.Add(g);
                    }
                }
            }
            if (query.exps.Count > 0)
            {
                queryProfiles = queryProfiles2;
            }

            List<Guide> guideList = new List<Guide>();
            foreach (GuideProfile gp in queryProfiles)
            {
                Guide g = converter.convertToGuide(gp);
                guideList.Add(g);
            }
            return guideList;
        }

        // GET: api/Guides
        public IEnumerable<Guide> GetGuideProfiles()
        {
            List<GuideProfile> guideProfileList = db.GuideProfiles.ToList<GuideProfile>();
            List<Guide> guideList = new List<Guide>();

            foreach (GuideProfile gp in guideProfileList)
            {
                Guide g = converter.convertToGuide(gp);
                guideList.Add(g);
            }
            return guideList;
        }

        // GET: api/Guides/5
        [ResponseType(typeof(GuideProfile))]
        public Guide GetGuideProfile(int id)
        {
            GuideProfile guideProfile = db.GuideProfiles.Find(id);
            if (guideProfile == null)
            {
                return null;
            }

            Guide g = converter.convertToGuide(guideProfile);
            return g;
        }

        // GET: api/Guides/username
        [Authorize]
        [ResponseType(typeof(GuideProfile))]
        public Guide GetGuideProfile(String username)
        {
            var identity = User.Identity;

           // GuideProfile guideProfile = db.GuideProfiles.Find(id);
            var guide = (from guides in db.GuideProfiles                                                    
                                        where guides.username==username
                                        select guides);

            if (guide.Count() == 0)
            {
                return null;
            }


            Guide g = converter.convertToGuide(guide.First<GuideProfile>());
            return g;
        }

        // PUT: api/Guides/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutGuideProfile(int id, GuideProfile guideProfile)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != guideProfile.guideId)
            {
                return BadRequest();
            }

            db.Entry(guideProfile).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!GuideProfileExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Guides/<id>/expertise/<expertise>
  /*      [Route("api/guides/{guideid}/expertise/")]
        [ResponseType(typeof(GuideProfile))]
        public IHttpActionResult PostGuideLanguage(int guideId, ExpertiseWrapper expertise)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            GuideExpertises ge = new GuideExpertises();
            ge.guideId = guideId;
            ge.expertiseId = expertise.expertiseId;

            db.GuideExpertises.Add(ge);
            db.SaveChanges();

            return Ok(ge);
        }
        */

 

        // DELETE: api/Guides/5
        [ResponseType(typeof(GuideProfile))]
        public IHttpActionResult DeleteGuideProfile(int id)
        {
            GuideProfile guideProfile = db.GuideProfiles.Find(id);
            if (guideProfile == null)
            {
                return NotFound();
            }

            db.GuideProfiles.Remove(guideProfile);
            db.SaveChanges();

            return Ok(guideProfile);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool GuideProfileExists(int id)
        {
            return db.GuideProfiles.Count(e => e.guideId == id) > 0;
        }

        [Route("api/guides/{id}/thumbnail/")]
        public HttpResponseMessage GetThumbnailImage(int id)
        {
            ImagesController iC = new ImagesController();

            GuideProfile guideProfile = db.GuideProfiles.Find(id);
            if (guideProfile == null)
            {
                return new HttpResponseMessage(HttpStatusCode.NotFound);
            }

            return iC.GetThumbnailImage(guideProfile.profileImage);
        }
    }
}
