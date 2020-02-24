using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;

namespace BloodBank {

	public partial class RequestDone : System.Web.UI.Page {

		static string connection_string;
		static RequestDone() {
			connection_string = WebConfigurationManager.ConnectionStrings["cstr"].ToString();
		}

		protected void Page_Load( object sender, EventArgs e ) {
			Page.Title = "Requested";
			string id = Request.QueryString["id"];
			string patid = Request.QueryString["patientid"];
			if (id == null) {
				titleLabel.Text = "Error!";
				infoLabel.Text = "There were some difficulties processing your request.";
				return;
			}
			using (SqlConnection conn = new SqlConnection(connection_string)) {
				SqlCommand donorCommand = new SqlCommand("SELECT * FROM [Donor] WHERE id=@id", conn);
				donorCommand.Parameters.AddWithValue("@id", id);
				conn.Open();
				SqlDataReader donorReader = donorCommand.ExecuteReader();
				donorReader.Read();
				string phoneno = donorReader["phoneno"].ToString();
				string donorname = donorReader["name"].ToString();
				donorReader.Close();

				SqlCommand requestCommand = new SqlCommand("SELECT * FROM [Request] WHERE id=@id", conn);
				requestCommand.Parameters.AddWithValue("@id", patid);
				SqlDataReader requestReader = requestCommand.ExecuteReader();
				requestReader.Read();
				string patientname = requestReader["patientname"].ToString();
				string patientno = requestReader["mobileno"].ToString();
				requestReader.Close();

				var accountSid = "ACab3e465e67051257d227bf49a3c9a58e";
				var authToken = "ca96731e12b0442bcf5b1c8f7dedc58d";

				TwilioClient.Init(accountSid, authToken);

				var message = MessageResource.Create(
					to: new PhoneNumber(phoneno),
					from: new PhoneNumber("+13609001701"),
					body: "Your blood is required by " + patientname + ". Contact them at " + patientno + ".");

				titleLabel.Text = "Your request is underway!";
				infoLabel.Text = donorname + " has been informed about your need for blood. Watch out for vampires! \n\nTransaction id: " + message.Sid.ToString();

				HtmlMeta meta = new HtmlMeta();
				meta.HttpEquiv = "Refresh";
				meta.Content = "5;url=Default.aspx";
				this.Page.Controls.Add(meta);

			}
		}
	}

}