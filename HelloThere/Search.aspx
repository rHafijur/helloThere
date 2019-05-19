<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="HelloThere.Search" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="HelloThere" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script runat="server">
        public int count = 0;
    </script>
     <div class="row">
        <div class="col-md-6">
            <h2 style="padding-top:20px; padding-bottom:20px;">Search Result(s)</h2>
        <asp:GridView CssClass="table" ID="People" runat="server" ShowHeader="false" GridLines="None" AutoGenerateColumns="false" Height="143px">
        <Columns>
            <asp:BoundField DataField="name" HeaderText="Name" />
                        <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <%
                  
                    DataTable table= db.GetTable("select * from friend_requests where sender_id='"+s_id+"' and receiver_id='"+dataTable.Rows[count++].Field<int>("id")+"'");
                    if (table.Rows.Count > 0)
                    {
                        if (table.Rows[0].Field<int>("accepted") == 0)
                        {
                 %>
                <span class="btn btn-success" > Request Sent</span>
                <%}
    else
    { %>
                <span class="btn btn-info" > Friend</span>
                <%} %>
                <%}
    else
    { %>
                <asp:LinkButton ID="Request" runat="server" CausesValidation="false" CssClass="btn btn-primary"
                    Text="Send Request" OnClick="Request_click"  CommandArgument='<%# Eval("id") %>' />
                <%} %>
                <a class="btn btn-info" href="/Profile?uid=<%# Eval("id") %>">Profile</a>
            </ItemTemplate>
        </asp:TemplateField>

        </Columns>
    </asp:GridView>
        </div>
    </div>
</asp:Content>
