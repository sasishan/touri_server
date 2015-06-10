using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Description;
using Touri_Server.Models;

namespace Touri_Server.Controllers
{
    [Authorize]
    public class MyGuideProfileController : ApiController
    {
        private NativusDBEntities db = new NativusDBEntities();
        private Converter converter = new Converter();

        private string getGuideUsername(int guideId)
        {            
            var guide = (from guides in db.GuideProfiles
                         where guides.guideId == guideId
                         select guides);
            if (guide != null)
            {
                return guide.First<GuideProfile>().username;
            }
            return null;
        }

        private bool validRequestor (string requestor)
        {
            var identity = User.Identity;
            if (requestor.Equals(identity.Name))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        // GET: api/MyGuideProfile/username
        [Route("api/MyGuideProfile")]
        [HttpGet]
        public Guide MyGuideProfile()
        {
            var identity = User.Identity;
            string username = identity.Name;

            // GuideProfile guideProfile = db.GuideProfiles.Find(id);
            var guide = (from guides in db.GuideProfiles
                         where guides.username == username
                         select guides);

            if (guide.Count() == 0)
            {
                return null;
            }

            Guide g = converter.convertToGuide(guide.First<GuideProfile>());
            return g;
        }

        // POST: api/Guides/<id>/expertise/<expertise>
        [Route("api/MyGuideProfile/{guideid}/profileImage/")]
        [ResponseType(typeof(GuideProfile))]
        [HttpPost]
        public HttpResponseMessage PostProfileImage(int guideId)
        {
            if (!ModelState.IsValid)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }

            string requestor = getGuideUsername(guideId);
            if (!validRequestor(requestor))
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }

            GuideProfile guideProfile = db.GuideProfiles.Find(guideId);
            if (guideProfile == null)
            {
                //error should not happen!
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }

            HttpResponseMessage result = null;
            var httpRequest = HttpContext.Current.Request;

            TouriPaths tp = new TouriPaths();
            if (httpRequest.Files.Count > 0)
            {
                foreach (string file in httpRequest.Files)
                {
                    var postedFile = httpRequest.Files[file];
                    if (!Path.GetExtension(postedFile.FileName).Equals(".jpg"))
                    {
                        return Request.CreateResponse(HttpStatusCode.BadRequest);
                    }           
                    var dirPath = tp.GetNewImageDirPath(Constants.IMAGE_CATEGORY_GUIDE_PROFILE, requestor, postedFile.FileName);

                    if (!Directory.Exists(dirPath))
                    {
                        Directory.CreateDirectory(dirPath);
                    }
                    
                    postedFile.SaveAs(dirPath+"\\"+ postedFile.FileName);

                    TouriImage ti = new TouriImage();
                    ti.filename = Path.GetFileNameWithoutExtension(postedFile.FileName);
                    ti.extension = Path.GetExtension(postedFile.FileName);
                    ti.category = Constants.IMAGE_CATEGORY_GUIDE_PROFILE;
                    ti.dateuploaded = DateTime.Now;
                    ti.path = tp.GetBaseImagePath(Constants.IMAGE_CATEGORY_GUIDE_PROFILE);
                    ti.username = requestor;

                    db.TouriImages.Add(ti);
                    db.SaveChanges();

                    guideProfile.profileImage = ti.id;
                    db.SaveChanges();
                }
                result = Request.CreateResponse(HttpStatusCode.Created);
            }
            else
            {
                result = Request.CreateResponse(HttpStatusCode.BadRequest);
            }

            return result;
        }

        // POST: api/Guides/<id>/expertise/<expertise>
        [Route("api/MyGuideProfile/{guideid}/expertise/")]
        [ResponseType(typeof(GuideProfile))]
        [HttpPost]
        public IHttpActionResult PostGuideExpertise(int guideId, ExpertiseWrapper expertise)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            string requestor = getGuideUsername(guideId);
            if (!validRequestor(requestor))
            {
                return BadRequest("Unauthorized requestor");
            }

            Expertise exp = db.Expertises.Find(expertise.expertiseId);
            if (exp == null)
            {
                return BadRequest("Expertise not found");
            }

            GuideExpertises ge = new GuideExpertises();
            ge.guideId = guideId;
            ge.expertiseId = expertise.expertiseId;

            db.GuideExpertises.Add(ge);
            db.SaveChanges();

            return Ok("Expertise added");
        }

        // POST: api/Guides/<id>/name/<first name, last name>
        [Route("api/MyGuideProfile/{guideid}/description/")]
        [ResponseType(typeof(GuideProfile))]
        [HttpPost]
        public IHttpActionResult PostGuideDescription(int guideId, Guide guide)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            string requestor = getGuideUsername(guideId);
            if (!validRequestor(requestor))
            {
                return BadRequest("Unauthorized requestor");
            }

            GuideProfile gp = db.GuideProfiles.Find(guideId);
            if (gp == null)
            {
                return BadRequest("Could not fine guide");
            }

            gp.description = guide.description;
            db.SaveChanges();

            return Ok("Description updated");
        }

        // POST: api/Guides/<id>/name/<first name, last name>
        [Route("api/MyGuideProfile/{guideid}/summary/")]
        [ResponseType(typeof(GuideProfile))]
        [HttpPost]
        public IHttpActionResult PostGuideSummary(int guideId, Guide guide)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            string requestor = getGuideUsername(guideId);
            if (!validRequestor(requestor))
            {
                return BadRequest("Unauthorized requestor");
            }

            GuideProfile gp = db.GuideProfiles.Find(guideId);
            if (gp == null)
            {
                return BadRequest("Could not fine guide");
            }

            gp.summary = guide.summary;
            db.SaveChanges();

            return Ok("OK");
        }

        // POST: api/Guides/<id>/name/<first name, last name>
        [Route("api/MyGuideProfile/{guideid}/name/")]
        [ResponseType(typeof(GuideProfile))]
        [HttpPost]
        public IHttpActionResult PostGuideName(int guideId, Guide guide)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            string requestor = getGuideUsername(guideId);
            if (!validRequestor(requestor))
            {
                return BadRequest("Unauthorized requestor");
            }

            GuideProfile gp = db.GuideProfiles.Find(guideId);
            if (gp==null)
            {
                return BadRequest("Could not fine guide");
            }

            gp.firstName = guide.fName;
            gp.lastName = guide.lName;
            db.SaveChanges();

            return Ok("Name updated");
        }

        // POST: api/Guides/<id>/language/<language>
        [Route("api/MyGuideProfile/{guideid}/alllanguages/")]
        [ResponseType(typeof(GuideProfile))]
        [HttpPost]
        public IHttpActionResult PostGuideLanguages(int guideId, ListLocsLangs data)
        {
            if (!ModelState.IsValid || data==null)
            {
                return BadRequest(ModelState);
            }

            string requestor = getGuideUsername(guideId);
            if (!validRequestor(requestor))
            {
                return BadRequest("Unauthorized requestor");
            }

            //remove any language records, as we will re-write them all
            var records =
                from langs in db.GuideLanguages
                where langs.guideId == guideId
                select langs;

            foreach (GuideLanguage gl in records)
            {
                db.GuideLanguages.Remove(gl);
            }

            foreach (int langId in data.langIds)
            {
                Language l = db.Languages.Find(langId);
                if (l == null)
                {
                    return BadRequest("Language not found");
                }

                GuideLanguage gl = new GuideLanguage();
                gl.guideId = guideId;
                gl.languageId = langId;
                gl.fluency = 4; //@todo

                db.GuideLanguages.Add(gl);
            }

            db.SaveChanges();

            return Ok("OK");
        }

        // POST: api/Guides/<id>/language/<language>
        [Route("api/MyGuideProfile/{guideid}/allexpertises/")]
        [ResponseType(typeof(GuideProfile))]
        [HttpPost]
        public IHttpActionResult PostGuideExpertises(int guideId, ListLocsLangs data)
        {
            if (!ModelState.IsValid || data == null)
            {
                return BadRequest(ModelState);
            }

            string requestor = getGuideUsername(guideId);
            if (!validRequestor(requestor))
            {
                return BadRequest("Unauthorized requestor");
            }

            //remove any language records, as we will re-write them all
            var records =
                from exps in db.GuideExpertises
                where exps.guideId == guideId
                select exps;

            foreach (GuideExpertises ge in records)
            {
                db.GuideExpertises.Remove(ge);
            }

            foreach (int expId in data.expIds)
            {
                Expertise exp = db.Expertises.Find(expId);
                if (exp == null)
                {
                    return BadRequest("Expertise not found");
                }

                GuideExpertises ge = new GuideExpertises();
                ge.guideId = guideId;
                ge.expertiseId = expId;

                db.GuideExpertises.Add(ge);
            }

            db.SaveChanges();

            return Ok("OK");
        }


        // POST: api/Guides/<id>/language/<language>
        [Route("api/MyGuideProfile/{guideid}/language/")]
        [ResponseType(typeof(GuideProfile))]
        [HttpPost]
        public IHttpActionResult PostGuideLanguage(int guideId, LanguageWrapper language)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            string requestor = getGuideUsername(guideId);
            if (!validRequestor(requestor))
            {
                return BadRequest("Unauthorized requestor");
            }

            Language l = db.Languages.Find(language.languageId);
            if (l == null)
            {
                return BadRequest("Expertise not found");
            }

            GuideLanguage gl = new GuideLanguage();
            gl.guideId = guideId;
            gl.languageId = language.languageId;
            gl.fluency = 4; //@todo

            db.GuideLanguages.Add(gl);
            db.SaveChanges();

            return Ok("OK");
        }

        // POST: api/Guides/<id>/location/<location>
        [Route("api/MyGuideProfile/{guideid}/alllocations/")]
        [ResponseType(typeof(GuideProfile))]
        public IHttpActionResult PostGuideLocations(int guideId, ListLocsLangs data)
        {
            if (!ModelState.IsValid || data == null)
            {
                return BadRequest(ModelState);
            }

            string requestor = getGuideUsername(guideId);
            if (!validRequestor(requestor))
            {
                return BadRequest("Unauthorized requestor");
            }

            //get the geocode from google api
            Geocoder gCoder = new Geocoder();

            //remove any location records, as we will re-write them all
            var records =
                from locs in db.GuideLocations
                where locs.guideId == guideId
                select locs;

            foreach (GuideLocation gl in records)
            {
                db.GuideLocations.Remove(gl);
            }

            foreach (string location in data.locs)
            {
                GuideLocation gl = new GuideLocation();
                gl.guideId = guideId;
                gl.cityServed = location;

                Geocode gc = gCoder.GetGeocode(location);
                if (gc == null)
                {
                    return BadRequest("Could not find a valid geocode for the location specified " + location);
                }

                //now insert into the database
                gl.longitude = Convert.ToDouble(gc.longitude);
                gl.latitude = Convert.ToDouble(gc.latitude);

                db.GuideLocations.Add(gl);
            }

            db.SaveChanges();

            return Ok("OK");
        }

        // POST: api/Guides/<id>/location/<location>
        [Route("api/MyGuideProfile/{guideid}/location/")]
        [ResponseType(typeof(GuideProfile))]
        public IHttpActionResult PostGuideLocation(int guideId, LocationWrapper location)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            string requestor = getGuideUsername(guideId);
            if (!validRequestor(requestor))
            {
                return BadRequest("Unauthorized requestor");
            }

            //get the geocode from google api
            Geocoder gCoder = new Geocoder();
            GuideLocation gl = new GuideLocation();
            gl.guideId = guideId;
            gl.cityServed = location.location;

            Geocode gc = gCoder.GetGeocode(location.location);
            if (gc == null)
            {
                return BadRequest("Could not find a valid geocode for the location specified " + location.location);
            }

            //now insert into the database
            gl.longitude = Convert.ToDouble(gc.longitude);
            gl.latitude = Convert.ToDouble(gc.latitude);

            db.GuideLocations.Add(gl);
 
            db.SaveChanges();

            return Ok("Location added");
        }

        // POST: api/MyGuideProfile
        [Route("api/MyGuideProfile")]
        [ResponseType(typeof(GuideProfile))]
        [HttpPost]
        public IHttpActionResult PostGuideProfile(Guide guide)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            //note guideId is not set yet

            string requestor = guide.username;
            if (!validRequestor(requestor))
            {
                return BadRequest("Unauthorized requestor");
            }

            GuideProfile guideProfile = new GuideProfile();
            guideProfile.username = ((guide.username == null) ? "" : guide.username);
            //guideProfile.username = guide.username;
            guideProfile.firstName = (( guide.fName == null) ? "" : guide.fName);
            guideProfile.lastName = ((guide.lName == null) ? "" : guide.lName);
            guideProfile.guideId = 0;
            guideProfile.address1 = ((guide.address1 == null) ? "" : guide.address1);
            guideProfile.address2 = ((guide.address2 == null) ? "" : guide.address2);
            guideProfile.description = ((guide.description == null) ? "" : guide.description);
            guideProfile.summary = ((guide.summary == null) ? "" : guide.summary);
            guideProfile.profileImage = guide.profileImage;

            db.GuideProfiles.Add(guideProfile);
            db.SaveChanges();

            guide.guideId = guideProfile.guideId;

            return Ok(guide);
        }

        // DELETE: api/MyGuideProfile/5
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
    }
}