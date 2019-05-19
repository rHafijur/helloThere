<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Message.aspx.cs" Inherits="HelloThere.Message" %>
<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <% foreach (DataRow row in messageTable.Rows){ %>

    <%} %>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <%=friend_name %>
              </div>
              <div class="card-body">
                      <div class="row d-flex justify-content-center">
                            <div class="col-md-10">
                                  <div class="form-group">
                                    <label for="WriteMessage">Write new message</label>
                                      <asp:TextBox class="form-control" id="WriteMessage" TextMode="multiline"  Rows="5" runat="server" />
                                  </div>
                            </div>

                        </div>
                                <div class="row d-flex justify-content-end">
                                <div class="col-md-2">
                                    <asp:Button OnClick="send_click" CssClass="btn btn-success" runat="server" Text="Send"/>
                                </div>
                            </div>
                 <ul class="list-group">
                    <% foreach (DataRow row in messageTable.Rows){
                            int u_id = row.Field<int>("user_id");
                            string position = "";
                            string color = "";
                            if (u_id==id)
                            {
                                position = "end";
                                color = "list-group-item-secondary";
                            }
                            else
                            {
                                position = "start";
                                color = "list-group-item-primary";
                            }
                     %>
                <li class="list-group">
                    <div class="row d-flex justify-content-<%=position %>">
                        <div class="col-md-5">
                            <span class="list-group-item <%=color %>"><%=row["text"] %></span>
                        </div>
                    </div>
                </li>
                    <%} %>
              
            </ul>
              </div>
            </div>
        </div>
    </div>

</asp:Content>
