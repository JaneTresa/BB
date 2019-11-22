using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using donate.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace donate.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class donateController : ControllerBase
    {
        onlinebloodbankContext obj = new onlinebloodbankContext();
        [HttpPost("{UserId}")]
        public void Post(int UserId, [FromBody] BloodDetails details)
        {
            obj.Database.ExecuteSqlCommand("donate " + UserId + "," + "'" + details.BloodGroup + "'" + "," + "'" + details.State + "'" + "," + "'" + details.Area + "'" + "," + details.PinCode  + "," +  details.Contact );
        }
        [HttpGet("{Id}")]
        public BloodDetails GetById(int Id)
        {
            return obj.BloodDetails.FromSql("getbyid " + Id).SingleOrDefault();
        }
      
    }
}