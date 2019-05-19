<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="HelloThere.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <%if (error == 1)
       { %>
        <div class="alert alert-warning" role="alert">
  <h4 class="alert-heading">Missing Field!</h4>
  <p>Please fill up the all of the following fields</p>

</div>
    <%}
    else if (error == 2)
    { %>
            <div class="alert alert-warning" role="alert">
  <h4 class="alert-heading">Password Miss Match!</h4>
  <p>The Password did not match with confirmed password, please be carefull</p>

</div>
    <%}
        else if (error == 2)
        { %>
            <div class="alert alert-warning" role="alert">
  <h4 class="alert-heading">Password Length too sort!</h4>
  <p>Please enter atleast 6 charecter</p>

</div>
    <%} %>
    <div class="row d-flex justify-content-center">
        <div class="col-md-6">
                <div class="card" style="margin-top:80px;">
  <div class="card-header">
    Registration
  </div>
  <div class="card-body" >
  <div class="form-group">
    <label for="FullName">Name</label>
    <input runat="server" type="text" id="FullName" class="form-control"  aria-describedby="NameHelp" required="required" placeholder="Enter Full name">
    <small id="NameHelp" class="form-text text-muted">Full name</small>
  </div>
  <div class="form-group">
    <label for="Email">Email address</label>
    <input runat="server" type="email" class="form-control" id="Email" aria-describedby="emailHelp" placeholder="Enter email" required="required">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input runat="server" type="password" class="form-control" id="Password" placeholder="Password" required="required">
  </div>
   <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input runat="server" type="password" class="form-control" id="ConPassword" placeholder="Confirm Password" required="required">
  </div>
  <asp:Button runat="server" OnClick="register" type="submit" class="btn btn-primary" Text="Register"></asp:Button>
      </div>
    </div>
        </div>
    </div>

</asp:Content>
