using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelloThere
{
    public partial class Requests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MiddleWare.Auth(Response);
            DataTable dataTable = new DB().GetTable("SELECT users.*, friend_requests.id as fr_id FROM users join friend_requests on users.id=friend_requests.sender_id WHERE friend_requests.receiver_id='" + Auth.id()+"' AND accepted='0'");
            requests.DataSource = dataTable;
            requests.DataBind();
        }
        protected void Accept_click(object sender, EventArgs e)
        {
            var f_id = (sender as LinkButton).CommandArgument;
            DB db = new DB();
            db.executequery("INSERT INTO friendships (user_id, friend_id) VALUES ('"+Auth.id()+ "','" + f_id + "')");
            db.executequery("INSERT INTO friendships (user_id, friend_id) VALUES ('" + f_id + "','" + Auth.id() + "')");
            db.executequery("UPDATE friend_requests SET accepted='1' WHERE receiver_id='"+Auth.id()+"' AND sender_id='"+f_id+"'");
        }
        protected void Delete_click(object sender, EventArgs e)
        {
            var fr_id = (sender as LinkButton).CommandArgument;
            DB db = new DB();
            db.executequery("DELETE FROM friend_requests WHERE id='" + fr_id + "'");
        }
    }
}