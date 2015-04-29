using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using Touri_Server.Models;
using System.Threading.Tasks;

namespace Touri_Server.Hubs
{
    
    public class ChatHub : Hub
    {
        private NativusDBEntities db = new NativusDBEntities();

        public override Task OnConnected()
        {
            var username = Context.QueryString["username"];
            var guideId = Context.QueryString["targetGuideId"];
            Random r = new Random();

            //add the user to the connected DB
            Connection c = new Connection();

            if (username.Equals(""))
            {
                
                username = "Traveller_" + r.Next();

                int count = (from connects in db.Connections
                            where (connects.username == username)
                            select connects).Count();

                //find a username that does not exist in the table
                int tries = 0;
                while (count!=0 && tries<5)
                {
                    username = "Traveller_" + r.Next();

                    count = (from connects in db.Connections
                                 where (connects.username == username)
                                 select connects).Count();
                    tries++;
                }
            }

            c.username = username;
            c.connectionId = Context.ConnectionId;
            c.lastConnected = DateTime.Now;
            
            db.Connections.Add(c);
                                   
            db.SaveChanges();
         
            return base.OnConnected();
        }

        public override Task OnDisconnected(bool stopCalled)
        {                        
            Connection c = db.Connections.Find(Context.ConnectionId);
            db.Connections.Remove(c);
            db.SaveChanges();
            return base.OnDisconnected(stopCalled);
        }

        public override Task OnReconnected()
        {
            // Add your own code here.
            // For example: in a chat application, you might have marked the
            // user as offline after a period of inactivity; in that case 
            // mark the user as online again.
            return base.OnReconnected();
        }

        public void Send(string platform, string message)
        {
            Clients.All.messageReceived(platform, message);
            //Clients.All.addNewMessageToPage(platform, message);
        }
    }
}