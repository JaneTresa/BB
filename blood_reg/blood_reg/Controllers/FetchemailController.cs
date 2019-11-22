using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using blood_reg.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace blood_reg.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FetchemailController : ControllerBase
    {
        onlinebloodbankContext obj = new onlinebloodbankContext();
        [HttpGet]
        public IEnumerable<string> Get()
        {
            List<string> emailList=new List<string>();
            List<UserDetails> userList = obj.UserDetails.ToList();
            foreach(UserDetails user in userList )
            {
                emailList.Add(user.Email);
            }
            return emailList;
        }
    }
}