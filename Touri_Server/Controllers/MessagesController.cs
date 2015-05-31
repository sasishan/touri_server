using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Touri_Server.Models;

namespace Touri_Server.Controllers
{
    [Authorize]
    public class MessagesController : ApiController
    {
        private NativusDBEntities db = new NativusDBEntities();
        private Converter converter = new Converter();

        private bool validRequestor(string requestor)
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

        // GET: api/messages
        //Return messages for the user requesting
        [Route("api/messages")]
        [HttpGet]
        public IEnumerable<ChatMessage> MyMessages()
        {
            var identity = User.Identity;
            string username = identity.Name;
            List<ChatMessage> cMessages = new List<ChatMessage>();

            var messages = (from msgs in db.Messages
                            where (msgs.toUser == username && !msgs.Downloaded.Equals("Y"))
                            select msgs);

            foreach (Message m in messages)
            {
                ChatMessage cm = converter.convertToChatMessage(m);

                //assume everything goes well and the message is sent down
                //we are using an optimistic algorithm that all messages once requested will be downloaded properly
                m.Downloaded = "Y";
                m.LastDownloaded = DateTime.Now;
                cMessages.Add(cm);
            }
            db.SaveChanges();

            return cMessages;
        }
    }
}
