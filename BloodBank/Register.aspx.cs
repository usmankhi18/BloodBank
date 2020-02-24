using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace BloodBank {

	public partial class WebForm1 : System.Web.UI.Page {

		// Function to get random number
		private static readonly Random getrandom = new Random();
		private static readonly object syncLock = new object();
		public static int GetAutoID() {
			lock (syncLock) { // synchronize
				return getrandom.Next();
			}
		}

		static string connection_string;
		static WebForm1() {
			connection_string = WebConfigurationManager.ConnectionStrings["cstr"].ToString();
		}

		protected void Page_Load(object sender, EventArgs e) {
			try {
				string username = Session["id"].ToString();
				if (username.Length > 0) {
					Response.Redirect("~/Profile.aspx");
					return;
				} else {
				}
			} catch {
			}
			Page.Title = "Register";
			// Check if logged in and redirect to profile
		}

		protected void RegisterAction(object sender, EventArgs e) {
			using (SqlConnection conn = new SqlConnection(connection_string)) {
				string sql = "INSERT INTO [Donor] (id, name, dob, gender, bloodgroup, weight, phoneno, emailid, address, city, state, datelastdonation, username, password, dateregistered) VALUES (@param1, @param2, @param3, @param4, @param5, @param6, @param7, @param8, @param9, @param10, @param11, @param12, @param13, @param14, @param15)";
				SqlCommand cmd = new SqlCommand(sql, conn);
				cmd.Parameters.Add("@param1", SqlDbType.Int).Value = GetAutoID();
				cmd.Parameters.Add("@param2", SqlDbType.Text).Value = nameBox.Text;
				cmd.Parameters.Add("@param3", SqlDbType.Date).Value = DateTime.ParseExact(dobBox.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture);
				cmd.Parameters.Add("@param4", SqlDbType.Text).Value = genderRadio.SelectedValue;
				cmd.Parameters.Add("@param5", SqlDbType.Text).Value = bloodGroupRadio.SelectedValue;
				cmd.Parameters.Add("@param6", SqlDbType.Float).Value = float.Parse(weightBox.Text);
				cmd.Parameters.Add("@param7", SqlDbType.Text).Value = phoneBox.Text;
				cmd.Parameters.Add("@param8", SqlDbType.Text).Value = emailBox.Text;
				cmd.Parameters.Add("@param9", SqlDbType.Text).Value = addressBox.Text;
				cmd.Parameters.Add("@param10", SqlDbType.Text).Value = cityBox.Text;
				cmd.Parameters.Add("@param11", SqlDbType.Text).Value = stateBox.Text;
				cmd.Parameters.Add("@param12", SqlDbType.Date).Value = DateTime.ParseExact(dateLastDonated.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture);
				cmd.Parameters.Add("@param13", SqlDbType.Text).Value = usernameBox.Text;
				cmd.Parameters.Add("@param14", SqlDbType.Text).Value = passwordBox.Text;
				cmd.Parameters.Add("@param15", SqlDbType.Text).Value = DateTime.Now;
				cmd.CommandType = CommandType.Text;
				conn.Open();
				cmd.ExecuteNonQuery();
				Response.Redirect("Login.aspx");
			}
		}

		protected void Username_ServerValidate( object source, ServerValidateEventArgs args ) {
			// Look in the database for any such row
			if (args.Value.Length > 5) {
				args.IsValid = true;
			} else {
				args.IsValid = false;
			}
		}
	}

}