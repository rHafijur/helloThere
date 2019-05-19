<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HelloThere._Default" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="HelloThere" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script runat="server">
        public DataTable messages;
    </script>

    <div style="padding-top:20px; padding-bottom:20px;" class="row d-flex justify-content-center">
        <div class="col-md-8">
            <h2 style="padding-top:20px; padding-bottom:20px;">Chats:</h2>
             <div class="list-group">
         <% foreach (DataRow dr in friends.Rows)
             {
                 int friend_id = dr.Field<int>("friend_id");
                 DataTable user = db.GetTable("SELECT name from users where id='"+friend_id+"'");
                 string f_name = user.Rows[0].Field<string>("name");
                 messages=db.GetTable("SELECT * FROM messages WHERE (user_id='"+auth_id+"' AND target_user_id='"+friend_id+ "') OR (user_id='" + friend_id + "' AND target_user_id='" + auth_id + "') ORDER BY id DESC LIMIT 1");
                 %>
                 <a href="Message?user=<%=friend_id %>" class="list-group-item list-group-item-action flex-column align-items-start">
    <div class="d-flex w-100 justify-content-between">
      <h5 class="mb-1"><%= f_name %></h5>
      <small></small>
    </div>
    <p class="mb-1"><%=messages.Rows[0].Field<string>("text") %></p>
  </a>

            <% } %>
                 </div>
        </div>

    </div>

</asp:Content>
