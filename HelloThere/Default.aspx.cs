﻿using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelloThere
{
    public partial class _Default : Page
    {
        public DataTable friends;
        public DB db;
        public int? auth_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            MiddleWare.Auth(Response);
            db = new DB();
            auth_id = Auth.id();
            friends = db.GetTable("select * from friendships where user_id='"+Auth.id()+"'");
        }

    }

}