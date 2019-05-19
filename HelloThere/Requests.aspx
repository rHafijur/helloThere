<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Requests.aspx.cs" Inherits="HelloThere.Requests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
         <div class="row">
        <div class="col-md-6">
        <asp:GridView CssClass="table" ID="requests" runat="server" ShowHeader="false" AutoGenerateColumns="false" GridLines="None"  Height="143px">
        <Columns>
            <asp:BoundField DataField="name" HeaderText="Name" />
                        <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <asp:LinkButton ID="Accept" runat="server" CausesValidation="false" CssClass="btn btn-info"
                    Text="Accept Request" OnClick="Accept_click"  CommandArgument='<%# Eval("id") %>' />
            </ItemTemplate>
        </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <asp:LinkButton ID="Delete" runat="server" CausesValidation="false" CssClass="btn btn-danger"
                    Text="Ignore Request" OnClick="Delete_click"  CommandArgument='<%# Eval("fr_id") %>' />
            </ItemTemplate>
        </asp:TemplateField>

        </Columns>
    </asp:GridView>
        </div>
    </div>
</asp:Content>
