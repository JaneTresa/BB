using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace bloodbank.Models
{
    public class SearchCls
    {
        [Key]
        public int id  { get; set; }
        
        public string First_Name { get; set; }
        public string Last_Name { get; set; }
        public long contact { get; set; }
        public string bloodGroup { get; set; }
        public string state { get; set; }

        public string area { get; set; }
        public long pinCode { get; set; }

        public SearchCls()
        {

        }
        public SearchCls(int Id, string First, string Last, string Bg, string State, string Area, long Pin, long Contact)
        {
            id = Id;
            First_Name = First;
            Last_Name = Last;
            bloodGroup = Bg;
            state = State;
            area = Area;
            pinCode = Pin;
            contact = Contact;
        }

    }
}
