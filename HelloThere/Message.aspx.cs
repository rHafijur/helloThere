using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelloThere
{
    public partial class Message : System.Web.UI.Page
    {
        public int target_id;
        public DataTable messageTable;
        public int? id;
        public string friend_name;
        protected void Page_Load(object sender, EventArgs e)
        {
            MiddleWare.Auth(Response);
            id = Auth.id();
            string t_id = Request.QueryString.Get("user");
            if (t_id==null)
            {
                Response.Redirect("/");
            }
            target_id = Int32.Parse(t_id);
            DataTable friend = new DB().GetTable("SELECT * from users where id='"+ target_id+"'");
            friend_name=(string) friend.Rows[0]["name"];
            messageTable = new DB().GetTable("SELECT * FROM messages WHERE (user_id='"+id+"' AND target_user_id='"+target_id+ "') OR (user_id='" + target_id + "' AND target_user_id='" + id + "') ORDER BY id DESC LIMIT 20");
            
        }
        protected void send_click(object sender, EventArgs e)
        {
            new DB().executequery("INSERT INTO messages (user_id, target_user_id, text) VALUES ('"+id+ "','" + target_id + "','" + WriteMessage.Text + "')");
            WriteMessage.Text = "";
            Response.Redirect("/Message?user="+target_id);
        }

    }
}