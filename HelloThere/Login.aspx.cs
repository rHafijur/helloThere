using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelloThere
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        public void login(object sender, EventArgs e)
        {
            Auth auth = new Auth();
            bool LoginSuccess= auth.Login(Email.Value,Password.Value);
            if (LoginSuccess)
            {
                Response.Redirect("/");
            }
        }
    }
}