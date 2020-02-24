<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BloodBank.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
	<h1>Login</h1>
	<div class="form-group">
		<label for="usernameBox">Username:</label>
		<asp:TextBox runat="server" ID="usernameBox" CssClass="form-control" Placeholder="Username"></asp:TextBox>
	</div>
	<asp:RequiredFieldValidator runat="server" ID="reqV1" ControlToValidate="usernameBox"></asp:RequiredFieldValidator>
	<div class="form-group">
		<label for="passwordBox">Password:</label>
		<asp:TextBox runat="server" ID="passwordBox" CssClass="form-control" Placeholder="Password" TextMode="Password"></asp:TextBox>
	</div>
	<asp:RequiredFieldValidator runat="server" ID="reqV2" ControlToValidate="passwordBox"></asp:RequiredFieldValidator>
	<asp:Label ID="flashLabel" runat="server" ForeColor="Red"></asp:Label>
	<div class="form-group">
		<asp:Button runat="server" ID="loginButton" Text="Login" OnClick="loginButton_Click" CssClass="btn btn-default" />
	</div>
</asp:Content>
