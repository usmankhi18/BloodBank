using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using System.Globalization;

namespace BloodBank {

	public partial class Requirement : System.Web.UI.Page {

		private static readonly Random getrandom = new Random();
		private static readonly object syncLock = new object();
		public static int GetAutoID() {
			lock (syncLock) { // synchronize
				return getrandom.Next();
			}
		}

		static string connection_string;
		string requestid = "";
		static Requirement() {
			connection_string = WebConfigurationManager.ConnectionStrings["cstr"].ToString();
		}

		protected void Page_Load( object sender, EventArgs e ) {
			string email = Request.QueryString["email"];
			Page.Title = "Request Blood";

			entryPanel.Visible = !(email == null);

			if (email == null)
				return;

			string name = "";
			using (SqlConnection conn = new SqlConnection(connection_string)) {
				SqlCommand cmd = new SqlCommand("SELECT * FROM [Donor] WHERE emailid=@email", conn);
				cmd.Parameters.AddWithValue("@email", email);
				conn.Open();
				SqlDataReader reader = cmd.ExecuteReader();
				reader.Read();
				name = reader["name"].ToString();
				requestid = reader["id"].ToString();
			}
			requestLabel.Text = "Requesting from " + name;
		}

		protected void Sumbit_Click( object sender, EventArgs e ) {
			using (SqlConnection conn = new SqlConnection(connection_string)) {
				string sql = "INSERT INTO [Request] (id, patientname, age, gender, hospitalname, reason, requiredbefore, ipno, hospitalarea, mobileno, city, country, bloodgroup, requestfrom) VALUES (@param1, @param2, @param3, @param4, @param5, @param6, @param7, @param8, @param9, @param10, @param11, @param12, @param13, @param14)";
				SqlCommand cmd = new SqlCommand(sql, conn);
				int patientID = GetAutoID();
				cmd.Parameters.Add("@param1", SqlDbType.Int).Value = patientID;
				cmd.Parameters.Add("@param2", SqlDbType.Text).Value = nameBox.Text;
				cmd.Parameters.Add("@param3", SqlDbType.Int).Value = int.Parse(ageBox.Text);
				cmd.Parameters.Add("@param4", SqlDbType.Text).Value = genderRadio.SelectedValue;
				cmd.Parameters.Add("@param5", SqlDbType.Text).Value = hospitalBox.Text;
				cmd.Parameters.Add("@param6", SqlDbType.Text).Value = reasonBox.Text;
				cmd.Parameters.Add("@param7", SqlDbType.Date).Value = DateTime.ParseExact(dateBox.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture);
				cmd.Parameters.Add("@param8", SqlDbType.Text).Value = ipBox.Text;
				cmd.Parameters.Add("@param9", SqlDbType.Text).Value = hospitalAreaBox.Text;
				cmd.Parameters.Add("@param10", SqlDbType.Text).Value = phoneBox.Text;
				cmd.Parameters.Add("@param11", SqlDbType.Text).Value = cityBox.Text;
				cmd.Parameters.Add("@param12", SqlDbType.Text).Value = countryBox.Text;
				cmd.Parameters.Add("@param13", SqlDbType.Text).Value = bloodGroupRadio.SelectedValue;
				cmd.Parameters.Add("@param14", SqlDbType.Int).Value = int.Parse(requestid);
				cmd.CommandType = CommandType.Text;
				conn.Open();
				cmd.ExecuteNonQuery();
				Response.Redirect("RequestDone.aspx?id="+requestid+"&patientid="+patientID);
			}
		}

		

	}
}