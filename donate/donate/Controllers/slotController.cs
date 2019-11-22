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
    public class slotController : ControllerBase
    {
        onlinebloodbankContext obj = new onlinebloodbankContext();

        [HttpPost("{userId}")]
        public void PostDemo(int userId, [FromBody] SlotDetails details)
        {
            obj.Database.ExecuteSqlCommand("slotpost " + userId + "," + "'" + details.Hospital + "'" + "," + "'" + details.City + "'" + "," + "'" + details.DateForDonating + "'" + "," + "'" + details.TimeForDonating + "'");
        }

        [HttpPost]
        public SlotDetails Post([FromBody]SlotDetails slot)
        {
            //  DateTime dateForDonating = DateTime.Now;
            return obj.SlotDetails.FromSql("slotvalidation '" + slot.Hospital + "'" + "," + "'" + slot.City + "'" + "," + "'" + slot.DateForDonating + "'" + "," + "'" + slot.TimeForDonating + "'").SingleOrDefault();

        }

        [HttpGet]
        public IEnumerable<SlotDetails> Get()
        {
            return obj.SlotDetails.FromSql("fetchslot").ToList();
        }
        [HttpPut("{id}")]
        public void updateById(int id)
        {
            obj.Database.ExecuteSqlCommand("updatedone " + id);
        }
    }
}