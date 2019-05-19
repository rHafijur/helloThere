<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Friends.aspx.cs" Inherits="HelloThere.Friends" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
         <div class="row">
        <div class="col-md-6">
            <h2 style="padding-top:20px; padding-bottom:20px;">Friend(s)</h2>
        <asp:GridView CssClass="table" ID="friends" runat="server" ShowHeader="false" AutoGenerateColumns="false" GridLines="None" >
        <Columns>
            <asp:BoundField DataField="name" ShowHeader="False" />
                        <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <a class="btn btn-success" href="/Message?user=<%# Eval("id") %>">Message</a>
                <a class="btn btn-info" href="/Profile?uid=<%# Eval("id") %>">Profile</a>
            </ItemTemplate>
        </asp:TemplateField>

        </Columns>
    </asp:GridView>
        </div>
    </div>

</asp:Content>
