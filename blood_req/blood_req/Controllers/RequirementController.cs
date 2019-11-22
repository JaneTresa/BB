using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using blood_req.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace blood_req.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RequirementController : ControllerBase
    {
        onlinebloodbankContext obj = new onlinebloodbankContext();
        [HttpPost("{UserId}")]
        public void Post(int UserId, [FromBody] BloodDetails details)
        {

            obj.Database.ExecuteSqlCommand("requirement " + UserId+ "," +"'"+details.BloodGroup+"'"+","+ "'" + details.State + "'" + "," +"'"+ details.Area + "'" + "," +"'"+ details.PinCode + "'" + "," +"'"+ details.Contact + "'" );
        }

        [HttpGet]
       
        public IEnumerable<BloodDetails> Get()
        {
            return obj.BloodDetails.FromSql("getrequirement").ToList();
        }

       // [HttpGet]
        //public IEnumerable<BloodDetails> Get()
        //{
        //    return obj.BloodDetails.ToList(); ;
        //}
    }
}