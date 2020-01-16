using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Agriculture_Seeds_Sandeep.Models
{
    public class AgricultureStore
    {
        public int ID { get; set; }
        public int AgricultureCropVarietyID { get; set; }
        public decimal Quantity { get; set; }
        public string NoofBags { get; set; }

        public AgricultureCropVariety AgricultureCropVariety { get; set; }
    }
}