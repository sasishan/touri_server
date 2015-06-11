using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.Http;
using Touri_Server.Models;

namespace WebApplicationMVC5.Controllers
{
    public class ImagesController : ApiController
    {
        private NativusDBEntities db = new NativusDBEntities();
        // GET: api/Images/5
        //[ResponseType(typeof(Expertise))]
        public HttpResponseMessage GetImage(int id)
        {
            TouriImage img = db.TouriImages.Find(id);
            if (img == null)
            {
                return new HttpResponseMessage(HttpStatusCode.NotFound);
            }

            string fullPath = "";

            TouriPaths tp = new TouriPaths();
            fullPath = tp.GetImagePathFromImageRecord(img);

            HttpResponseMessage response = new HttpResponseMessage(HttpStatusCode.OK);
            try
            {
                response.Content = new StreamContent(new FileStream(fullPath, FileMode.Open, FileAccess.Read));
                response.Content.Headers.ContentType = new MediaTypeHeaderValue("image/png");
            }
            catch (Exception e)
            {
                //do nothing
            }
            

            return response;
        }

        // GET: api/Images/5/thumbnail
        [Route("api/images/{id}/thumbnail/")]
        public HttpResponseMessage GetThumbnailImage(int id)
        {
            TouriImage img = db.TouriImages.Find(id);
            if (img == null)
            {
                return new HttpResponseMessage(HttpStatusCode.NotFound);
            }

            string fullPath = "";
            TouriPaths tp = new TouriPaths();
            fullPath = tp.GetImageThumbnailPathFromImageRecord(img);

            //if a thumbnail doesn't exist get the regular image
            if (!Directory.Exists(fullPath))
            {
                fullPath = tp.GetImagePathFromImageRecord(img);
            }

            HttpResponseMessage response = new HttpResponseMessage(HttpStatusCode.OK);
            response.Content = new StreamContent(new FileStream(fullPath, FileMode.Open, FileAccess.Read));
            response.Content.Headers.ContentType = new MediaTypeHeaderValue("image/png");

            return response;
        }
    }
}
