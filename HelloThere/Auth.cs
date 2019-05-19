using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HelloThere
{
    public class Auth : System.Web.UI.Page
    {
        public static bool Check()
        {
            Auth auth = new Auth();
            int? auth_id = (int?)auth.Session["u_id"];
            if (auth_id != null)
            {
                return true;
            }
            return false;
        }
        public static bool Logout()
        {
            Auth auth = new Auth();
            auth.Session["u_id"]=null;
           
            return true;
        }
        public static int? id()
        {
            Auth auth = new Auth();
            int? auth_id = (int?)auth.Session["u_id"];

            return auth_id;
        }

        public bool Login(string email, string password)
        {
            DataTable datatable;
            DB db = new DB();
            datatable = db.AuthQuery(email,password);
            int count= datatable.Rows.Count;
            if (count==1)
            {
                Session["u_id"] = datatable.Rows[0][0];
                return true;
            }
            return false;
        }
    }
}