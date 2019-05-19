<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="HelloThere.Profile" %>
<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <div class="row" style="margin-top:80px;">
                    <div class="col-md-4">
                        		<div class="d-flex justify-content-start h-100">
			                        <div class="image_outer_container">
				                        <div class="green_icon"></div>
				                        <div class="image_inner_container">
					                        <img  src="<%=info.Rows[0]["picture"] %>">
				                        </div>
			                        </div>
		                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="profile-head">
                                    <h5>
                                        <%=info.Rows[0]["name"] %>
                                    </h5>
                                    <h6>
                                        <%=info.Rows[0]["email"] %>
                                    </h6>
                                    <p class="proile-rating"><%=info.Rows[0]["about"] %></p>
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Info</a>
                                </li>
                               <% if (id == uid)
                                   { %>
                                 <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Edit Profile</a>
                                </li>
                                <%} %>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2">
                        
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                            <%if (id == uid)
                                { %>
                        <asp:FileUpload CssClass="profile-edit-btn" ID="ImageUpload" OnLoad="Upload" runat="server" />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Only Doc files are allowed"
ControlToValidate="ImageUpload" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.jpg|.JPG|.gif|.GIF|.png|.PNG|.bmp|.BMP)$">
</asp:RegularExpressionValidator> <br />
<asp:Button CssClass="profile-edit-btn" ID="btnUpload" runat="server"  Text="Upload" OnClick="Upload" />
                        <%} %>
                    </div>
                    <div class="col-md-">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <label>User Id</label>
                                            </div>
                                            <div class="col-md-9">
                                                <p><%=info.Rows[0]["id"] %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <label>Name</label>
                                            </div>
                                            <div class="col-md-9">
                                                <p><%=info.Rows[0]["name"] %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <label>Email</label>
                                            </div>
                                            <div class="col-md-9">
                                                <p><%=info.Rows[0]["email"] %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <label>Phone</label>
                                            </div>
                                            <div class="col-md-9">
                                                <p><%=info.Rows[0]["phone"] %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label>Profession</label>
                                            </div>
                                            <div class="col-md-8">
                                                <p><%=info.Rows[0]["profession"] %></p>
                                            </div>
                                        </div>
                            </div>
                                                            <%
                                                                if (uid == id)
                                                                {
                                                                    edit_name.Text = info.Rows[0].Field<string>("name");
                                                                    edit_phone.Text = info.Rows[0].Field<string>("phone");
                                                                    edit_profession.Text = info.Rows[0].Field<string>("profession");
                                                                    edit_about.Text = info.Rows[0].Field<string>("about");
                                    %>
                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <label>Name</label>
                                            </div>
                                            <div class="col-md-9">
                                                <asp:TextBox runat="server" Text='<%# info.Rows[0]["profession"] %>'  CssClass="form-control" ID="edit_name" ></asp:TextBox>
                                               
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <label>Phone</label>
                                            </div>
                                            <div class="col-md-9">
                                                <asp:TextBox runat="server" Text="" CssClass="form-control" ID="edit_phone" ></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <label>Profession</label>
                                            </div>
                                            <div class="col-md-9">
                                                <asp:TextBox runat="server" Text='<%# info.Rows[0]["profession"] %>' CssClass="form-control" ID="edit_profession" ></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <label>About</label>
                                            </div>
                                            <div class="col-md-9">
                                                <asp:TextBox runat="server" Text="" CssClass="form-control" TextMode="multiline"  Rows="4" ID="edit_about" ></asp:TextBox>
                                            </div>
                                        </div>
                                <div class="row">
                                            <div class="col-md-3">
                                            
                                            </div>
                                            <div class="col-md-9">
                                                
                                                <asp:Button runat="server" OnClick="Update" Text="Save Changes" CssClass="profile-edit-btn" />
                                            </div>
                                        </div>
                                
                            </div>
                            <% } %>
                        </div>
                    </div>
                </div>
</asp:Content>
