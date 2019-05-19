using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelloThere
{
    public class MiddleWare : System.Web.UI.Page
    {
       
        public static void Auth(HttpResponse response)
        {
            MiddleWare middleWare = new MiddleWare();
            int? auth_id=(int?)middleWare.Session["u_id"];
            if (auth_id!=null)
            {
                String timeStamp = GetTimestamp(DateTime.Now);
                new DB().executequery("UPDATE users SET last_active='"+timeStamp+"' WHERE id='"+auth_id+"'");
                return;
            }
            response.Redirect("/Login");
        }
        static String GetTimestamp(DateTime value)
        {
            return value.ToString("yyyy-MM-dd HH:mm:ss");
        }
    }
}