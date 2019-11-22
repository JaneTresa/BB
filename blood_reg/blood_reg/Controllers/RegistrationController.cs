using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using blood_reg.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace blood_reg.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RegistrationController : ControllerBase
    {
        onlinebloodbankContext obj = new onlinebloodbankContext();
        [HttpPost]
        public void Post([FromBody] UserDetails details)
        {
            obj.Database.ExecuteSqlCommand("registration '" +details.FirstName+"'" + "," + "'" + details.LastName + "'" +"," + "'" + details.Age + "'" + "," + "'" + details.Gender + "'" + "," + "'" + details.Email + "'" + "," + "'" + details.Contact + "'" + "," + "'" + details.Pass + "'"+","+"'"+ details.Weight + "'" + "," + "'" + details.State + "'"+"," + "'" + details.Area + "'"+"," + "'" + details.PinCode + "'"+ "," + "'" + details.BloodGroup + "'");
        }

        [HttpGet("{userid}/{pass}")]
        public UserDetails Get(int userid,string pass)
        {
            try
            {
                return obj.UserDetails.FromSql("login " + userid + "," + "'" + pass + "'").Single();
            }
            catch(Exception e)
            {
                return null;
            }
        }



        [HttpGet]
        public UserDetails Get() {


            return obj.UserDetails.FromSql("getuserid").SingleOrDefault();
        }
        [HttpGet]
        [Route("GetEmails")]
        public IEnumerable<string> GetEmails()
        {
            List<UserDetails> list = obj.UserDetails.ToList();
            List<string> emails = new List<string>();
            foreach(UserDetails user in list)
            {
                emails.Add(user.Email);
            }
            return emails;
        }

        [HttpGet]
        [Route("GetContact")]
        public IEnumerable<long> GetContact()
        {
            List<UserDetails> list = obj.UserDetails.ToList();
            List<long> contact = new List<long>();
            foreach (UserDetails user in list)
            {
                contact.Add(user.Contact);
            }
            return contact;
        }

    }
}