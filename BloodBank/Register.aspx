<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="BloodBank.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

	<h2>Register</h2>

	<div class="form-group">
		<label for="nameBox">Name:</label>
		<asp:TextBox runat="server" CssClass="form-control" ID="nameBox" Placeholder="Name"></asp:TextBox>
	</div>
	<asp:RequiredFieldValidator runat="server" ID="nameValidator" ControlToValidate="nameBox" ErrorMessage="Enter a name, you must."></asp:RequiredFieldValidator>
	<div class="form-group">
		<label for="dobBox">Date of Birth:</label>
		<asp:TextBox runat="server" CssClass="form-control" ID="dobBox" Placeholder="Date of birth (MM/dd/yyyy)"></asp:TextBox>
	</div>
	<asp:CompareValidator ID="dateValidator" runat="server" Type="Date" Operator="DataTypeCheck" ControlToValidate="dobBox" ErrorMessage="Please enter a valid date."></asp:CompareValidator>
	<asp:RangeValidator id="rngDate" ControlToValidate="dobBox" type="Date" minimumvalue="10/26/57" maximumvalue="10/26/99" ErrorMessage="You must be over 18 years of age!" display="Dynamic" runat="server"></asp:RangeValidator>
	<div class="form-group">
		<label for="genderRadio">Gender:</label>
		<asp:RadioButtonList runat="server" ID="genderRadio">
			<asp:ListItem>Male</asp:ListItem>
			<asp:ListItem>Female</asp:ListItem>
			<asp:ListItem>Others</asp:ListItem>
		</asp:RadioButtonList>
	</div>
	<div class="form-group">
		<label for="bloodGroupRadio">Blood Group</label>
		<asp:RadioButtonList runat="server" ID="bloodGroupRadio">
			<asp:ListItem>A-</asp:ListItem>
			<asp:ListItem>A+</asp:ListItem>
			<asp:ListItem>B-</asp:ListItem>
			<asp:ListItem>B+</asp:ListItem>
			<asp:ListItem>AB-</asp:ListItem>
			<asp:ListItem>AB+</asp:ListItem>
			<asp:ListItem>O-</asp:ListItem>
			<asp:ListItem>O+</asp:ListItem>
		</asp:RadioButtonList>
	</div>
	<div class="form-group">
		<label for="weightBox">Weight:</label>
		<asp:TextBox runat="server" ID="weightBox" CssClass="form-control" Placeholder="Weight (kg)"></asp:TextBox>
	</div>
	<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="weightBox" ErrorMessage="You need a weight."></asp:RequiredFieldValidator>
	<asp:RangeValidator runat="server" ID="RangeValidator1" ControlToValidate="weightBox" ErrorMessage="Enter your weight (kg) [45-180]." MinimumValue="45" MaximumValue="180" Type="Integer"></asp:RangeValidator>	
	<div class="form-group">
		<label for="phoneBox">Phone number:</label>
		<asp:TextBox runat="server" ID="phoneBox" CssClass="form-control" Placeholder="Phone number (with country code)"></asp:TextBox>
	</div>
	<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="phoneBox" ErrorMessage="Enter your phone number, you must."></asp:RequiredFieldValidator>
	<asp:RegularExpressionValidator runat="server" ID="RegXV1" ControlToValidate="phoneBox" ErrorMessage="Enter your phone number with country code" ValidationExpression="^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$"></asp:RegularExpressionValidator>
	<div class="form-group">
		<label for="emailBox">Email address:</label>
		<asp:TextBox runat="server" ID="emailBox" CssClass="form-control" Placeholder="Email address"></asp:TextBox>
	</div>
	<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="emailBox" ErrorMessage="Enter your email, you must."></asp:RequiredFieldValidator>
	<asp:RegularExpressionValidator runat="server" ID="RegXV2" ControlToValidate="emailBox" ErrorMessage="Enter a proper email -_-" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
	<div class="form-group">
		<label for="addressBox">Address:</label>
		<asp:TextBox runat="server" ID="addressBox" CssClass="form-control" Placeholder="Street Address"></asp:TextBox>
	</div>
	<asp:RequiredFieldValidator runat="server" ID="ReqV5" ControlToValidate="addressBox" ErrorMessage="Enter an address"></asp:RequiredFieldValidator>
	<div class="form-group">
		<label for="cityBox">City:</label>
		<asp:TextBox runat="server" ID="cityBox" CssClass="form-control" Placeholder="City"></asp:TextBox>
 	</div>
	<asp:RequiredFieldValidator runat="server" ID="ReqV6" ControlToValidate="cityBox"></asp:RequiredFieldValidator>
	<div class="form-group">
		<label for="stateBox">State:</label>
		<asp:TextBox runat="server" ID="stateBox" CssClass="form-control" Placeholder="State"></asp:TextBox>
	</div>
	<asp:RequiredFieldValidator runat="server" ID="ReqV7" ControlToValidate="cityBox"></asp:RequiredFieldValidator>
	<div class="form-group">
		<label for="dateLastDonated">Date of last blood donation:</label>
		<asp:TextBox runat="server" ID="dateLastDonated" CssClass="form-control" Placeholder="Date of last donation (MM/dd/yyyy)"></asp:TextBox>
	</div>
	<asp:RequiredFieldValidator runat="server" ID="ReqV8" ControlToValidate="dateLastDonated"></asp:RequiredFieldValidator>
	<div class="form-group">
		<label for="usernameBox">Pick a username:</label>
		<asp:TextBox runat="server" ID="usernameBox" CssClass="form-control" Placeholder="Username"></asp:TextBox>
	</div>
	<asp:RequiredFieldValidator runat="server" ID="ReqV9" ControlToValidate="usernameBox" ErrorMessage="Pick a username, you must"></asp:RequiredFieldValidator>
	<asp:CustomValidator runat="server" ID="CV6" ErrorMessage="This username is not available." ValidateEmptyText="false" OnServerValidate="Username_ServerValidate"></asp:CustomValidator>
	<div class="form-group">
		<label for="passwordBox">Password:</label>
		<asp:TextBox runat="server" ID="passwordBox" CssClass="form-control" Placeholder="Password" TextMode="Password"></asp:TextBox>
	</div>
	<asp:RequiredFieldValidator runat="server" ID="ReqV10" ControlToValidate="passwordBox" ErrorMessage="Password is required."></asp:RequiredFieldValidator>
	<div class="form-group">
		<label for="retypePasswordBox">Retype Password:</label>
		<asp:TextBox runat="server" ID="retypePasswordBox" CssClass="form-control" Placeholder="Password" TextMode="Password"></asp:TextBox>
	</div>
	<asp:CompareValidator runat="server" ID="CompareV1" ControlToCompare="passwordBox" ControlToValidate="retypePasswordBox" ErrorMessage="Passwords should match ffs"></asp:CompareValidator>
	<div class="form-group">
		<asp:Button runat="server" OnClick="RegisterAction" Text="Register" CssClass="btn btn-default"/>
	</div>
</asp:Content>
