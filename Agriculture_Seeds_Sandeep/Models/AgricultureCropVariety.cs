using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Agriculture_Seeds_Sandeep.Models
{
    public class AgricultureCropVariety
    {
        public int ID { get; set; }
        public int AgricultureCropID { get; set; }
        public string VarietyName { get; set; }

        public AgricultureCrop AgricultureCrop { get; set; }
        public List<AgricultureCropRate> AgricultureCropRates { get; set; }
        public List<AgricultureStore> AgricultureStores { get; set; }
        public List<AgricultureSeedSelling> AgricultureSeedSellings { get; set; }
    }
}