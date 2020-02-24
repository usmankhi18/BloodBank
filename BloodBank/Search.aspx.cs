using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloodBank
{
	public partial class Search : System.Web.UI.Page {

		protected void Page_Load( object sender, EventArgs e ) {
			gridView.RowCommand += gridView_RowCommand;
			Page.Title = "Search";
		}

		protected void searchButton_Click( object sender, EventArgs e ) {
			
		}

		void gridView_RowCommand( Object sender, GridViewCommandEventArgs e ) {
			if (e.CommandName == "Select_Row") {
				int index = Convert.ToInt32(e.CommandArgument);
				GridViewRow row = gridView.Rows[index];
				string email = row.Cells[3].Text;
				Response.Redirect("Requirement.aspx?email=" + email);
			}
		}
	}
}