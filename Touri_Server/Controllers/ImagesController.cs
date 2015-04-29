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


            HttpResponseMessage response = new HttpResponseMessage(HttpStatusCode.OK);
            response.Content = new StreamContent(new FileStream(fullPath, FileMode.Open, FileAccess.Read));
            response.Content.Headers.ContentType = new MediaTypeHeaderValue("image/png");

            return response;
        }
    }
}
