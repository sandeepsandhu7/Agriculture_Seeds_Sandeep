using System.Web;
using System.Web.Mvc;

namespace Agriculture_Seeds_Sandeep
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
