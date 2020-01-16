using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Agriculture_Seeds_Sandeep.Models
{
    public class AgricultureSeedSelling
    {
        public int ID { get; set; }
        public int CustomerID { get; set; }
        public int AgricultureCropVarietyID { get; set; }
        public string NoofBags { get; set; }
        public decimal Amount { get; set; }


        public Customer Customer { get; set; }
        public AgricultureCropVariety AgricultureCropVariety { get; set; }
    }
}