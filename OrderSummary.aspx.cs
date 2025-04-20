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
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace Group5_FinalProject
{
    public partial class OrderSummary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSummary();
            }
        }

        private void LoadSummary()
        {
            lblName.Text = Session["CheckoutName"]?.ToString();
            lblEmail.Text = Session["CheckoutEmail"]?.ToString();
            lblAddress.Text = Session["CheckoutAddress"]?.ToString();
            lblPayment.Text =Session["CheckoutPayment"]?.ToString();
            if (Session["Cart"] != null)
            {
                DataTable cart = (DataTable)Session["Cart"];

                // Add "Total" column if missing
                if (!cart.Columns.Contains("Total"))
                    cart.Columns.Add("Total", typeof(decimal));

                foreach (DataRow row in cart.Rows)
                {
                    decimal price = Convert.ToDecimal(row["Price"]);
                    int qty = Convert.ToInt32(row["Quantity"]);
                    row["Total"] = price * qty;
                }

                gvSummary.DataSource = cart;
                gvSummary.DataBind();

                lblGrandTotal.Text = "Grand Total: " +
                    cart.AsEnumerable().Sum(r => r.Field<decimal>("Total")).ToString("C");
            }
            else
            {
                gvSummary.Visible = false;
                lblGrandTotal.Text = "Your cart is empty.";
            }
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            if (Session["Cart"] == null)
            {
                lblConfirmation.Text = "Your cart is empty.";
                lblConfirmation.Visible = true;
                return;
            }

            
            // Clear cart session
            Session["Cart"] = null;

            lblConfirmation.Text = "Your order has been placed successfully!";
            lblConfirmation.Visible = true;
            gvSummary.Visible = false;
            lblGrandTotal.Visible = false;
            pnlUserInfo.Visible = false; // Only if you used the customer info panel
               
            }
        }

    }
