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
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group5_FinalProject
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && ddlProducts.Items.Count > 0)
            {
                ddlProducts.SelectedIndex = 0; // Show the first product by default
                fvProduct.DataBind(); // Bind FormView to match selected product
               
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            
            // Get controls inside FormView
            TextBox txtQty = (TextBox)fvProduct.FindControl("txtQuantity");
            Label lblPriceRaw = (Label)fvProduct.FindControl("lblPriceHidden");
            
            Label lblName = new Label();
            decimal price = 0;
            string productName = "";
            int productId = Convert.ToInt32(ddlProducts.SelectedValue);

            DataView dv = (DataView)DetailDataSource.Select(DataSourceSelectArguments.Empty);
            if (dv.Count > 0)
            {
                DataRowView drv = dv[0];
                price = Convert.ToDecimal(drv["Price"]);
                productName = drv["Name"].ToString();

            }
            
            int quantity = Convert.ToInt32(txtQty.Text);

            // Session-based cart
            DataTable cart;
            if (Session["Cart"] == null)
            {
                cart = new DataTable();
                cart.Columns.Add("ProductID", typeof(int));
                cart.Columns.Add("ProductName", typeof(string));
                cart.Columns.Add("Quantity", typeof(int));
                cart.Columns.Add("Price", typeof(decimal));
                Session["Cart"] = cart;
            }
            else
            {
                cart = (DataTable)Session["Cart"];
            }

            // Grab data using DataItem
            if (fvProduct.DataItem != null)
            {
                var data = (DataRowView)fvProduct.DataItem;
                lblName.Text = data["Name"].ToString();
                price = Convert.ToDecimal(data["Price"]);
            }
            else
            {
                // fallback: use SQL from dropdown
                string selectedProductName = ddlProducts.SelectedItem.Text;
                lblName.Text = selectedProductName;
                // You'll need to query price if required, or pass it into ViewState earlier
            }

       
          

           

            // Check if product already in cart
            DataRow existing = cart.Select($"ProductID = {productId}").FirstOrDefault();
            if (existing != null)
            {
                existing["Quantity"] = Convert.ToInt32(existing["Quantity"]) + quantity;
            }
            else
            {
                cart.Rows.Add(productId, lblName.Text, quantity, price);
            }

            Label lblSuccess = (Label)fvProduct.FindControl("lblSuccess");
            lblSuccess.Text = "Item added to cart";
            lblSuccess.Visible = true;

        }

       
    }
}