<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BloodBank._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

	<div class="jumbotron text-center">
		<h1>Blood Bank</h1>
		<p>Blood donor and Requester repo.</p>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<h3><a href="Search.aspx">Post your Requirement</a></h3>
				<p>Look for blood donors.</p>
			</div>
			<asp:Panel ID="loggedIn" runat="server">
				<div class="col-sm-6">
					<h3><a href="Profile.aspx">Profile</a></h3>
				</div>
			</asp:Panel>
			<asp:Panel ID="notLoggedIn" runat="server">
				<div class="col-sm-6">
					<h3><a href="Login.aspx">Login</a></h3>
					<h3><a href="Register.aspx">Sign up</a></h3>
				</div>
			</asp:Panel>
		</div>
	</div>

</asp:Content>
