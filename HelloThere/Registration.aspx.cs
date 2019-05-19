using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HelloThere;

namespace HelloThere
{
    public partial class Registration : System.Web.UI.Page
    {
        public int error = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        public void register(object sender, EventArgs e)
        {
            if (FullName.Value==""|| Email.Value == "" || Password.Value == "" || ConPassword.Value == "")
            {
                if (Password.Value!=ConPassword.Value)
                {
                    error = 2;
                }
                else
                {
                    error = 1;
                }
            }
            else
            {
                if (Password.Value.Length<6)
                {
                    error = 3;
                    return;
                }
                if (Password.Value != ConPassword.Value)
                {
                    error = 2;
                }
                else
                {
                    Hash hash = new Hash();
                    string HasedPassword = hash.ToMD5(Password.Value);
                    DB db = new DB();
                    int success=db.executequery("INSERT into users (name, email, password) VALUES ('"+FullName.Value+ "','" + Email.Value + "','" + HasedPassword + "')");
                    if (success==1)
                    {
                        Response.Write("User Successfully added");
                    }
                    else
                    {
                        Response.Write("Failed to add user");
                    }
                }
            }
        }
    }
}