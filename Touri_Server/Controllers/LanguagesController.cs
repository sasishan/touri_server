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
using Touri_Server.Models;

namespace Touri_Server.Controllers
{
    public class LanguagesController : ApiController
    {
        private NativusDBEntities db = new NativusDBEntities();

        // GET: api/Languages
        public IEnumerable<LanguageWrapper> GetLanguages()
        {
            List<Language> langs =  db.Languages.ToList<Language>();
            List<LanguageWrapper> langWrap = new List<LanguageWrapper>();

            foreach (Language l in langs)
            {
                LanguageWrapper lw = convertToLanguageWrapper(l);
                langWrap.Add(lw);
            }
            return langWrap;
        }

        // GET: api/Languages/5
        [ResponseType(typeof(LanguageWrapper))]
        public IHttpActionResult GetLanguage(int id)
        {
            Language language = db.Languages.Find(id);
            if (language == null)
            {
                return NotFound();
            }
            LanguageWrapper lw = convertToLanguageWrapper(language);
            return Ok(lw);
        }

        // PUT: api/Languages/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutLanguage(int id, Language language)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != language.LanguageId)
            {
                return BadRequest();
            }

            db.Entry(language).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!LanguageExists(id))
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

        // POST: api/Languages
        [ResponseType(typeof(Language))]
        public IHttpActionResult PostLanguage(Language language)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Languages.Add(language);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = language.LanguageId }, language);
        }

        // DELETE: api/Languages/5
        [ResponseType(typeof(Language))]
        public IHttpActionResult DeleteLanguage(int id)
        {
            Language language = db.Languages.Find(id);
            if (language == null)
            {
                return NotFound();
            }

            db.Languages.Remove(language);
            db.SaveChanges();

            return Ok(language);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool LanguageExists(int id)
        {
            return db.Languages.Count(e => e.LanguageId == id) > 0;
        }

        private LanguageWrapper convertToLanguageWrapper(Language l)
        {
            LanguageWrapper lw = new LanguageWrapper();
            lw.languageId = l.LanguageId;
            lw.language = l.Language1;

            return lw;
        }
    }
}