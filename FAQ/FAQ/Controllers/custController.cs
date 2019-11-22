using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FAQ.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace FAQ.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class custController : ControllerBase
    {
        onlinebloodbankContext obj = new onlinebloodbankContext();

        [HttpGet]
        public IEnumerable<Faq> Get()
        {
            return obj.Faq.FromSql("cust");
        }

        //[HttpPost("{userId}")]
        //public void Post(int userId,[FromBody] Faq query)
        //{
        //    obj.Database.ExecuteSqlCommand("custpost " + userId + "," + "'" + query.Questions + "'");
        //}

        [HttpPost("{userId}/{questions}")]
        public void Post(int userId, string questions)
        {
            obj.Database.ExecuteSqlCommand("custpost " + userId + "," + "'" + questions + "'");
        }

    }
}