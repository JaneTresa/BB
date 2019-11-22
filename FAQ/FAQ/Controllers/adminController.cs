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
    public class adminController : ControllerBase
    {
        onlinebloodbankContext obj = new onlinebloodbankContext();

        [HttpGet]
        public IEnumerable<Faq> Get()
        {
            return obj.Faq.FromSql("admin").ToList();
        }

        [HttpPut("{id}")]
        public void Post(int id, [FromBody] Faq query)
        {
            obj.Database.ExecuteSqlCommand("adminanswer " + id + "," + "'" + query.Answers + "'");
        }


    }
}