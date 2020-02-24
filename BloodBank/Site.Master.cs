using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloodBank {

	public partial class SiteMaster : MasterPage {

		protected void Page_Load( object sender, EventArgs e ) {
			try {
				string username = Session["id"].ToString();
				if (username.Length > 0) {
					profileLabel.Text = username;
					profileLabel.Visible = true;
					logoutButton.Visible = true;
				} else {
					profileLabel.Visible = false;
					logoutButton.Visible = false;
				}
			} catch {
				profileLabel.Visible = false;
				logoutButton.Visible = false;
			}
		}

		protected void logoutButton_Click( object sender, EventArgs e ) {
			Session.RemoveAll();
			Response.Redirect("login.aspx");
		}
	}
}