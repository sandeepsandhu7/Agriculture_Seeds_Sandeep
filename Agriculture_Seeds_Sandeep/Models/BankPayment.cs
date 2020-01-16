using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Agriculture_Seeds_Sandeep.Models
{
    public class BankPayment
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public DateTime TransactionDate { get; set; }
        public string TransactionNumber { get; set; }
        public decimal AmountReceived { get; set; }
    }
}