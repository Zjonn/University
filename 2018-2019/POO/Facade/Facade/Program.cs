using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Facade
{
    class Program
    {
        static void Main(string[] args)
        {
        }
    }
    public class SmtpFacade
    {
        SmtpClient client = new SmtpClient();
        public SmtpFacade()
        {
            client.Port = 25;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            client.Host = "smtp.google.com";
        }
        public void Send(string From, string To, 
            string Subject, string Body,
            Stream Attachment, string AttachmentMimeType)
        {
            MailMessage mail = new MailMessage(From, To);
            mail.Subject = Subject;
            mail.Body = Body;
            mail.Attachments.Add(
                new System.Net.Mail.Attachment(Attachment, AttachmentMimeType));
            client.Send(mail);
        }
    }
}
