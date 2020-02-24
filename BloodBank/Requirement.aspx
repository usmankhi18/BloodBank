<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Requirement.aspx.cs" Inherits="BloodBank.Requirement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

	<h1><asp:Label ID="requestLabel" runat="server" Text=""></asp:Label></h1>

	<br />

	<h3>Details:</h3>
	<br />
	<asp:SqlDataSource ID="datasource1" runat="server" ConnectionString="<%$ ConnectionStrings:ITLPConnectionString %>" SelectCommand="SELECT [name], [dob], [gender], [bloodgroup], [weight], [phoneno], [emailid], [address], [city], [state] FROM [Donor] WHERE ([emailid] = @emailid)">
		<SelectParameters>
			<asp:QueryStringParameter Name="emailid" QueryStringField="email" Type="String" />
		</SelectParameters>
	</asp:SqlDataSource>
	<asp:GridView ID="gridView" runat="server" AutoGenerateColumns="False" DataSourceID="datasource1">
		<Columns>
			<asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
			<asp:BoundField DataField="dob" HeaderText="Date of Birth" SortExpression="dob" />
			<asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
			<asp:BoundField DataField="bloodgroup" HeaderText="Bloog Group" SortExpression="bloodgroup" />
			<asp:BoundField DataField="weight" HeaderText="Weight" SortExpression="weight" />
			<asp:BoundField DataField="phoneno" HeaderText="Phone Number" SortExpression="phoneno" />
			<asp:BoundField DataField="emailid" HeaderText="Email ID" SortExpression="emailid" />
			<asp:BoundField DataField="address" HeaderText="Street Address" SortExpression="address" />
			<asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
			<asp:BoundField ApplyFormatInEditMode="True" DataField="state" HeaderText="State" SortExpression="state" />
		</Columns>
	</asp:GridView>

	<asp:Panel ID="entryPanel" runat="server">

		<br />
		<h2>Enter your details:</h2>
		<br />

		<div class="form-group">
			<label for="nameBox">Patient Name:</label>
			<asp:TextBox runat="server" CssClass="form-control" ID="nameBox" Placeholder="Patient Name"></asp:TextBox>
		</div>
		<asp:RequiredFieldValidator runat="server" ID="nameValidator" ControlToValidate="nameBox" ErrorMessage="Enter a name, you must."></asp:RequiredFieldValidator>
		<div class="form-group">
			<label for="ageBox">Age:</label>
			<asp:TextBox runat="server" CssClass="form-control" ID="ageBox" Placeholder="Age"></asp:TextBox>
		</div>
		<asp:RequiredFieldValidator runat="server" ID="ageValidator" ControlToValidate="ageBox" ErrorMessage="Enter an age, you must."></asp:RequiredFieldValidator>
		<asp:RangeValidator runat="server" ID="ageRangeValidator" ControlToValidate="ageBox" MinimumValue="4" MaximumValue="104" Type="Integer"></asp:RangeValidator>
		<div class="form-group">
			<label for="genderRadio">Gender:</label>
			<asp:RadioButtonList runat="server" ID="genderRadio">
				<asp:ListItem>Male</asp:ListItem>
				<asp:ListItem>Female</asp:ListItem>
				<asp:ListItem>Others</asp:ListItem>
			</asp:RadioButtonList>
		</div>
		<div class="form-group">
			<label for="hospitalBox">Hospital Name:</label>
			<asp:TextBox runat="server" CssClass="form-control" ID="hospitalBox" Placeholder="Hospital Name"></asp:TextBox>
		</div>
		<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="hospitalBox"></asp:RequiredFieldValidator>
		<div class="form-group">
			<label for="reasonBox">Reason for requirement:</label>
			<asp:TextBox runat="server" CssClass="form-control" ID="reasonBox" Placeholder="Reason for requirement"></asp:TextBox>
		</div>
		<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="reasonBox"></asp:RequiredFieldValidator>
		<div class="form-group">
			<label for="dateBox">Required before:</label>
			<asp:TextBox runat="server" CssClass="form-control" ID="dateBox" Placeholder="Required before date (MM/dd/yyyy)"></asp:TextBox>
		</div>
		<asp:CompareValidator ID="dateValidator" runat="server" Type="Date" Operator="DataTypeCheck" ControlToValidate="dateBox" ErrorMessage="Please enter a valid date."></asp:CompareValidator>
		<div class="form-group">
			<label for="ipBox">IP Number:</label>
			<asp:TextBox runat="server" CssClass="form-control" ID="ipBox" Placeholder="In patient number"></asp:TextBox>
		</div>
		<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="ipBox"></asp:RequiredFieldValidator>
		<div class="form-group">
			<label for="hospitalAreaBox">Hospital area:</label>
			<asp:TextBox runat="server" CssClass="form-control" ID="hospitalAreaBox" Placeholder="Hospital area"></asp:TextBox>
		</div>
		<asp:RequiredFieldValidator runat="server" ID="ReV4" ControlToValidate="hospitalAreaBox"></asp:RequiredFieldValidator>
			<div class="form-group">
			<label for="phoneBox">Phone number:</label>
			<asp:TextBox runat="server" ID="phoneBox" CssClass="form-control" Placeholder="Phone number (with country code)"></asp:TextBox>
		</div>
		<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="phoneBox" ErrorMessage="Enter your phone number, you must."></asp:RequiredFieldValidator>
		<asp:RegularExpressionValidator runat="server" ID="RegXV1" ControlToValidate="phoneBox" ErrorMessage="Enter your phone number with country code" ValidationExpression="^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$"></asp:RegularExpressionValidator>
		<div class="form-group">
			<label for="cityBox">City:</label>
			<asp:TextBox runat="server" ID="cityBox" CssClass="form-control" Placeholder="City"></asp:TextBox>
 		</div>
		<asp:RequiredFieldValidator runat="server" ID="ReqV6" ControlToValidate="cityBox"></asp:RequiredFieldValidator>
		<div class="form-group">
			<label for="stateBox">Country:</label>
			<asp:TextBox runat="server" ID="countryBox" CssClass="form-control" Placeholder="State"></asp:TextBox>
		</div>
		<asp:RequiredFieldValidator runat="server" ID="ReqV7" ControlToValidate="countryBox"></asp:RequiredFieldValidator>
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
			<asp:Button runat="server" Text="Sumbit" CssClass="btn btn-default" OnClick="Sumbit_Click"/>
		</div>

	</asp:Panel>

</asp:Content>
