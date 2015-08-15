﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using Touri_Server.Models;
using System.Threading.Tasks;
using System.Data.Entity.Infrastructure;

namespace Touri_Server.Hubs
{
    
    public class ChatHub : Hub
    {
        private NativusDBEntities db = new NativusDBEntities();

        int mUserId = Constants.Uninitialized;

        public override Task OnConnected()
        {
            var username = Context.QueryString["username"];
            mUserId = Convert.ToInt32(Context.QueryString["userid"]);
            var targetUsername = Context.QueryString["targetUserName"];

            //add the user to the connected DB
            Connection c = new Connection();

            //create a group chat using their username
            Groups.Add(Context.ConnectionId, username);

            try
            {
                Connection connectRec = db.Connections.Find(username);
                if (connectRec == null)
                {
                    c.username = username;
                    c.connectionId = Context.ConnectionId;
                    c.lastConnected = DateTime.Now;
                    db.Connections.Add(c);
                }
                else
                {
                    connectRec.connectionId = Context.ConnectionId;
                    connectRec.lastConnected = DateTime.Now;
                }
                db.SaveChanges();
            }
            catch (Exception e)
            {
                //do nothing
            }
         
            return base.OnConnected();
        }

        public override Task OnDisconnected(bool stopCalled)
        {
            //if the stop was intentional then we will show offline
            //otherwise, we have to assume the service will restart the connection
            if (stopCalled==true)
            {
                var username = Context.QueryString["username"];
                Connection c = db.Connections.Find(username);

                if (c != null)
                {
                    db.Connections.Remove(c);
                    try
                    {
                        db.SaveChanges();
                    }
                    catch (DbUpdateConcurrencyException E)
                    {
                        //Safely ignore this exception
                    }
                    catch (Exception e)
                    {
                        //Something else has occurred
                        throw;
                    }
                }
            }

            return base.OnDisconnected(stopCalled);
        }

        public override Task OnReconnected()
        {
            var username = Context.QueryString["username"];
            Connection connectRec = db.Connections.Find(username);
            
            if (connectRec == null)
            {
                Connection c = new Connection();
                c.username = username;
                c.connectionId = Context.ConnectionId;
                c.lastConnected = DateTime.Now;
                db.Connections.Add(c);
            }
            else
            {
                connectRec.connectionId = Context.ConnectionId;
                connectRec.lastConnected = DateTime.Now;
            }
            db.SaveChanges();
            return base.OnReconnected();
        }

        //For anonymous users this gives them their username generated by the chat hub
        //klugy - @todo make them log in
        public void SendMyUserName()
        {
            var connection = (from cons in db.Connections
                            where cons.connectionId == Context.ConnectionId
                            select cons);
            if (connection == null)
            {
                Clients.Caller.ReceiveMyUserName("");
            }
            else
            {
                Connection c = connection.First<Connection>();
            //    Clients.All.messageReceived("Pla", "Ba");
                //Clients.Group(c.username).messageReceived("Pla", "Ba");
                Clients.Group(c.username).receiveMyUserName(c.username);
            }
        }

        //Log the message into the database and set it NOT downloaded
        private int LogNewMessage(string message, string from, string to, int fromId, int toUserId)
        {
            Message m = new Message();
            m.toUserId = toUserId;
            m.fromUserId = fromId;
            m.toUser = to;
            m.fromUser = from;
            m.message1 = message;
            DateTime now = DateTime.Now;
            m.Timestamp = now;
            m.Downloaded = Constants.MessageNotDownloaded;
            
            UserLastMessage lm = db.UserLastMessages.Find(from);
            if (lm != null)
            {
                lm.LastDateTime = now;
            }
            else
            {
                lm = new UserLastMessage();
                lm.Username = from;
                lm.LastDateTime = now;
                db.UserLastMessages.Add(lm);
            }
            db.Messages.Add(m);

            try
            {
                db.SaveChanges();
                return m.id;
            }
            catch (Exception e)
            {
                return Constants.Uninitialized;
            }
        }

        //@todo get the touser id - this is the fromuserid
        public int SendPrivateMessage(string message, string fromUsername, string targetUsername, int fromUserId, int toUserId)
        {
            int messageId = LogNewMessage(message, fromUsername, targetUsername, fromUserId, toUserId);

            //if we can't log the message return an error
            if (messageId == Constants.Uninitialized)
            {
                Clients.Group(fromUsername).messageReceived("Touri", Constants.MessageNotDelivered, "-1", fromUserId);
                return Constants.Uninitialized;
            }

            //send the message - if the user is not online, no harm done as they will download it when connected
            Clients.Group(targetUsername).messageReceived(fromUsername, message, messageId.ToString(), fromUserId);
            return messageId;
        }

        public void PingClient(string fromUsername)
        {
            Clients.Group(fromUsername).PingClient(DateTime.Now.ToString());
        }

        //receive the ack from the client
        public void AcknowledgeMessage(int messageId)
        {
            int result = UpdateMessageAsSeen(messageId);
        }

        //when an ack is received for the message, update our database so we don't download it later
        private int UpdateMessageAsSeen(int messageId)
        {
            int result = Constants.FAIL;
            try
            {
                Message m = db.Messages.Find(messageId);
                if (m != null)
                {
                    m.Downloaded = Constants.MessageDownloaded;
                    //m.LastDownloaded = DateTime.Now;
                    db.SaveChangesAsync();
                    result = Constants.SUCCESS;
                }
            }
            catch (Exception e)
            {
                //do nothing
            }
            return result;
        }

        //not used function
        public void Send(string fromUsername, string targetUsername, string message)
        {
            
            int messageId = LogNewMessage(message, fromUsername, targetUsername, -1, -1);

            //if we can't log the message return an error
            if (targetUsername.Equals("All"))
            {
                Clients.All.messageReceived(targetUsername, message, messageId);
            }
            else if (messageId != Constants.Uninitialized)
            {
                Clients.Group(targetUsername).messageReceived(fromUsername, message, messageId.ToString());
            }

            //Clients.All.addNewMessageToPage(platform, message);
        }
    }
}