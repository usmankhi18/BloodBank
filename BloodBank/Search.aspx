<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="BloodBank.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

	<h1>Search</h1>

	<div class="form-group">
		<label for="cityBox">City:</label>
		<asp:TextBox runat="server" ID="cityBox" Placeholder="City" CssClass="form-control"></asp:TextBox>
	</div>

	<div class="form-group">
		<label for="bloodGroupRadio">Blood Group:</label>
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
		<asp:Button ID="searchButton" runat="server" CssClass="btn btn-default" OnClick="searchButton_Click" Text="Search" />
	</div>

	<asp:SqlDataSource runat="server" ID="datasource1" ConnectionString="<%$ ConnectionStrings:ITLPConnectionString %>" SelectCommand="SELECT [name], [gender], [bloodgroup], [city], [emailid], [phoneno] FROM [Donor] WHERE (([city] LIKE '%' + @city + '%') AND ([bloodgroup] = @bloodgroup))">
		<SelectParameters>
			<asp:ControlParameter ControlID="cityBox" DefaultValue="" Name="city" PropertyName="Text" Type="String" />
			<asp:ControlParameter ControlID="bloodGroupRadio" Name="bloodgroup" PropertyName="SelectedValue" Type="String" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:GridView runat="server" ID="gridView" AutoGenerateColumns="False" DataSourceID="datasource1">
		<Columns>
			<asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
			<asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
			<asp:BoundField DataField="bloodgroup" HeaderText="Blood Group" SortExpression="bloodgroup" />
			<asp:BoundField DataField="emailid" HeaderText="Email Address" SortExpression="emailid" />
			<asp:BoundField DataField="phoneno" HeaderText="Phone Number" SortExpression="phoneno" />
			<asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
			<asp:ButtonField CommandName="Select_Row" Text="Request Blood" />
		</Columns>
	</asp:GridView>

</asp:Content>
