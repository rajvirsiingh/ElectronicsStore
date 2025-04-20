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
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group5_FinalProject
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCart();
            }
        }
        private void LoadCart()
        {
            if (Session["Cart"] != null)
            {
                DataTable cart = (DataTable)Session["Cart"];

                // Calculate total for each row
                if (!cart.Columns.Contains("Total"))
                    cart.Columns.Add("Total", typeof(decimal));

                foreach (DataRow row in cart.Rows)
                {
                    decimal price = Convert.ToDecimal(row["Price"]);
                    int qty = Convert.ToInt32(row["Quantity"]);
                    row["Total"] = qty * price;
                }

                gvCart.DataSource = cart;
                gvCart.DataBind();

                lblEmpty.Visible = false;
                lblTotal.Text = "Grand Total: " +
                    cart.AsEnumerable().Sum(r => r.Field<decimal>("Total")).ToString("C");
            }
            else
            {
                gvCart.Visible = false;
                lblTotal.Visible = false;
                lblEmpty.Visible = true;
            }
        }

        protected void gvCart_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            DataTable cart = (DataTable)Session["Cart"];
            cart.Rows.RemoveAt(e.RowIndex);
            Session["Cart"] = cart.Rows.Count > 0 ? cart : null; // Clear cart if empty
            LoadCart();
        }

        protected void btnClearCart_Click(object sender, EventArgs e)
        {
            Session["Cart"]=null;
            LoadCart();

        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (Session["Cart"] != null)
            {
                Response.Redirect("~/checkout");
            }
            else
            {
                LoadCart();
            }
        }
    }
}