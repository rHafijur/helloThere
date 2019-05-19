using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;

namespace HelloThere
{
    public partial class Search : System.Web.UI.Page
    {
        public DB db=new DB();
        public int? s_id;
        public DataTable dataTable;
        protected void Page_Load(object sender, EventArgs e)
        {
            s_id = Auth.id();
            string name = Request.QueryString.Get("name");
            dataTable = new DB().Search(name);
            People.DataSource = dataTable;
            People.DataBind();
        }
        protected void Request_click(object sender, EventArgs e)
        {
            if (s_id == null)
            {
                return;
            }
            var r_id = (sender as LinkButton).CommandArgument;
            DB db = new DB();
            db.executequery("INSERT INTO friend_requests (sender_id, receiver_id) VALUES ('"+s_id+"','"+r_id+"')");
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}