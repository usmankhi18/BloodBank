using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloodBank {
	public partial class _Default : Page {
		protected void Page_Load( object sender, EventArgs e ) {
			try {
				string username = Session["id"].ToString();
				if (username.Length > 0) {
					loggedIn.Visible = true;
					notLoggedIn.Visible = false;
				} else {
					loggedIn.Visible = false;
					notLoggedIn.Visible = true;
				}
			} catch {
				loggedIn.Visible = false;
				notLoggedIn.Visible = true;
			}
			Page.Title = "Home";
		}
	}
}