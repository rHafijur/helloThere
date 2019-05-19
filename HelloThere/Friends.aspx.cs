using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelloThere
{
    public partial class Friends : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MiddleWare.Auth(Response);
            DataTable dataTable = new DB().GetTable("SELECT users.* FROM users JOIN friendships ON friendships.friend_id=users.id WHERE friendships.user_id='"+Auth.id()+"'");
            friends.DataSource = dataTable;
            friends.DataBind();
        }
    }
}