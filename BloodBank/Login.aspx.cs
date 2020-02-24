using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloodBank {

	public partial class Login : System.Web.UI.Page {

		protected void Page_Load( object sender, EventArgs e ) {
			// If logged in, redirect to profile...
			try {
				string username = Session["id"].ToString();
				if (username.Length > 0) {
					Response.Redirect("~/Profile.aspx");
					return;
				} else {
					
				}
			} catch {
			}
			Page.Title = "Login";
		}

		static string connection_string;
		static Login() {
			connection_string = WebConfigurationManager.ConnectionStrings["cstr"].ToString();
		}

		protected void loginButton_Click( object sender, EventArgs e )
		{
			using (SqlConnection conn = new SqlConnection(connection_string)) {
				SqlCommand cmd = new SqlCommand("SELECT * FROM [Donor] WHERE username=@username AND password=@password", conn);
				cmd.Parameters.AddWithValue("@username", usernameBox.Text);
				cmd.Parameters.AddWithValue(@"password", passwordBox.Text);
				SqlDataAdapter sda = new SqlDataAdapter(cmd);
				DataTable dt = new DataTable();
				sda.Fill(dt);
				conn.Open();
				int i = cmd.ExecuteNonQuery();
				conn.Close();
				if (dt.Rows.Count > 0) {
					Session.RemoveAll();
					Session["id"] = usernameBox.Text;
					Response.Redirect("Default.aspx");
				} else {
					Session.RemoveAll();
					flashLabel.Text = "Your username or password is incorrect.";
				}
			}
		}
	}
}