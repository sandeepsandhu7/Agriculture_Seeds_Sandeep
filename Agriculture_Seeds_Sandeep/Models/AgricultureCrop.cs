using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Agriculture_Seeds_Sandeep.Models
{
    public class AgricultureCrop
    {
        public int ID { get; set; }
        public string CropName { get; set; }
        public List<AgricultureCropVariety> AgricultureCropVarieties { get; set; }
    }
}