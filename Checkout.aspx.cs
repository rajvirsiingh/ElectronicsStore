/*
 * Rajvir Singh - 9002835
 * Bimisha Mishra - 8969381
 * Sheharyar Hashmi - 8998448
 * Palak Gupta - 8997694
 * Sandeep Kumar - 8992797
 * Raghav Mahendaru - 9007855
 * Dinkel Mistry - 8995115
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group5_FinalProject
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnContinue_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Session["CheckoutName"] = txtName.Text;
                Session["CheckoutEmail"] = txtEmail.Text;
                Session["CheckoutAddress"] = txtAddress.Text;
                Session["CheckoutPayment"] = ddlPayment.SelectedValue;
                Response.Redirect("~/summary");
            }
        }
    }
}