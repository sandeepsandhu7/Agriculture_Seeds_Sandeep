using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Agriculture_Seeds_Sandeep.Models
{
    public class Customer
    {
        public int ID { get; set; }
        public string CustomerName { get; set; }
        public string PhoneNumber { get; set; }
        public string Address { get; set; }

        public List<AgricultureSeedSelling> AgricultureSeedSellings { get; set; }
    }
}