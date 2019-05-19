<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HelloThere.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="row d-flex justify-content-center" >
        <div class="col-md-5">
            <div class="card" style="margin-top:80px;">
  <div class="card-header">
    Login
  </div>
  <div class="card-body">
      <div class="form-group">
    <label for="Email">Email address</label>
    <input runat="server" type="email" class="form-control" id="Email" aria-describedby="emailHelp" placeholder="Enter email" required="required">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input runat="server" type="password" class="form-control" id="Password" placeholder="Password" required="required">
  </div>
  <asp:Button runat="server" OnClick="login" type="submit" class="btn btn-primary" Text="Login"></asp:Button>
  </div>
</div>

        </div>
    </div>
</asp:Content>
