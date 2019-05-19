using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelloThere
{
    public partial class Profile : System.Web.UI.Page
    {
        public int? id;
        public int? uid;
        public DataTable info;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                uid = Int32.Parse(Request.QueryString.Get("uid"));
            }catch(Exception f)
            {
            }
            MiddleWare.Auth(Response);
            id = Auth.id();
            if (uid==null)
            {
                uid = id;
            }
            
                info = new DB().GetTable("SELECT * from users where id='" + uid + "'");
            
           
        }
        protected void Upload(object sender, EventArgs e)
        {
            if (ImageUpload.HasFile)
            {
                string fileName = Path.GetFileName(ImageUpload.PostedFile.FileName);
                ImageUpload.PostedFile.SaveAs(Server.MapPath("~/Images/") + fileName);
                new DB().executequery("UPDATE users SET picture='/Images/"+fileName+"' WHERE id='"+id+"'");
                Response.Redirect(Request.Url.AbsoluteUri);
            }
        }
        protected void Update(object sender, EventArgs e)
        {
            new DB().executequery("UPDATE users SET name='"+ edit_name.Text+ "', phone='" + edit_phone.Text + "', profession='" + edit_profession.Text + "', about='" + edit_about.Text + "' WHERE id='"+id+"'");
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}