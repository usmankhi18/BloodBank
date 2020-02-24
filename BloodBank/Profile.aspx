<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="BloodBank.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
	<asp:SqlDataSource runat="server" ID="datasource1" ConnectionString="<%$ ConnectionStrings:ITLPConnectionString %>" SelectCommand="SELECT [name], [username], [dob], [gender], [bloodgroup], [weight], [phoneno], [emailid], [address], [city], [state], [datelastdonation], [dateregistered] FROM [Donor] WHERE ([username] = @username)">
		<SelectParameters>
			<asp:SessionParameter Name="username" SessionField="id" Type="String" />
		</SelectParameters>
</asp:SqlDataSource>
	<br />
	<asp:DetailsView runat="server" ID="detailsView" AutoGenerateRows="False" DataSourceID="datasource1" CellPadding="4" ForeColor="#333333" GridLines="None">
		<AlternatingRowStyle BackColor="White" />
		<CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
		<EditRowStyle BackColor="#2461BF" />
		<FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
		<Fields>
			<asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
			<asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
			<asp:BoundField DataField="dob" HeaderText="Date of Birth" SortExpression="dob" />
			<asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
			<asp:BoundField DataField="bloodgroup" HeaderText="Blood Group" SortExpression="bloodgroup" />
			<asp:BoundField DataField="weight" HeaderText="Weight" SortExpression="weight" />
			<asp:BoundField DataField="phoneno" HeaderText="Phone No" SortExpression="phoneno" />
			<asp:BoundField DataField="emailid" HeaderText="Email address" SortExpression="emailid" />
			<asp:BoundField DataField="address" HeaderText="Street Address" SortExpression="address" />
			<asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
			<asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
			<asp:BoundField DataField="datelastdonation" HeaderText="Date of Last Donation" SortExpression="datelastdonation" />
			<asp:BoundField DataField="dateregistered" HeaderText="Date of Registration" SortExpression="dateregistered" />
		</Fields>
		<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
		<HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
		<PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
		<RowStyle BackColor="#EFF3FB" />
</asp:DetailsView>
</asp:Content>
