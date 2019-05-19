using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelloThere
{
    public partial class SiteMaster : MasterPage
    {
        public bool auth;
        public string countRequest="";
        protected void Page_Load(object sender, EventArgs e)
        {
            auth = Auth.Check();
            if (auth)
            {
                Search.Visible = true;
                authbutton.Visible = false;
                regularButton.Visible = true;
                divBuckup.Visible = false;
                DataTable friendRequest = new DB().GetTable("SELECT * FROM friend_requests WHERE receiver_id='"+Session["u_id"]+"' AND accepted='"+0+"'");
                int count = friendRequest.Rows.Count;
                if (count > 0)
                {
                    countRequest = "<span class=\"badge badge-info\">" + count + "</span>";
                }
            }

        }
        public void search_click(object sender, EventArgs e)
        {
            string name = keyword.Value;
            if (name!=null ||name!="")
            {
                Response.Redirect("/Search?name="+name);
            }
        }
        public void Logout(object sender, EventArgs e)
        {
            Auth.Logout();
            Response.Redirect("/Login");
        }

    }
}