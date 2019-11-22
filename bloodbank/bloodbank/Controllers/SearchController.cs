using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using bloodbank.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace bloodbank.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SearchController : ControllerBase
    {
        onlinebloodbankContext obj = new onlinebloodbankContext();


        [HttpGet("{bg}/{state}/{area}/{pin}")]
        public IEnumerable<SearchCls> Get(string bg, string state, string area, long pin)
        {
            try
            {
                List<UserDetails> user = obj.UserDetails.FromSql("userdetails").ToList();
                List<BloodDetails> blood = obj.BloodDetails.FromSql("searchproc '" + bg + "'" + "," + "'" + state + "'" + "," + "'" + area + "'" + "," + pin).ToList();

                List<SearchCls> result = new List<SearchCls>();

                foreach (UserDetails u in user)
                {
                    foreach (BloodDetails b in blood)
                    {
                        if (u.UserId == b.UserId)
                        {

                            result.Add(new SearchCls(u.UserId, u.FirstName, u.LastName, b.BloodGroup, b.State, b.Area, b.PinCode, b.Contact));
                        }
                    }

                }
                return result;
            }
            catch(Exception e)
            {
                return null;
            }
            //return obj.BloodDetails.FromSql("sp_blood_availability '"+bg+"'"+","+"'"+state+"'"+","+"'"+area+"'"+","+pin);
        }
        [HttpGet]
        public IEnumerable<BloodDetails> Get()
        { 
            return obj.BloodDetails.FromSql("availabledetails").ToList();
        }
        //[HttpGet("{bg}/{state}/{area}/{pin}")]
        //public IEnumerable<SearchCls> Get(string bg, string state, string area, long pin)


        //{
        //    //searchobj.bg = bg;
        //    //searchobj.state = state;
        //    //searchobj.area = area;
        //    //searchobj.pin = pin;
        //    //return obj.SearchCls.FromSql("search '" + searchobj.bg + "'" + "," + "'" + searchobj.state + "'" + "," + "'" + searchobj.area + "'" + "," + pin).ToList();
        //    return obj.SearchCls.FromSql("search '" + bg + "'" + "," + "'" + state + "'" + "," + "'" + area + "'" + "," + pin).ToList();
        //}




        // GET: api/Search

    }
}
