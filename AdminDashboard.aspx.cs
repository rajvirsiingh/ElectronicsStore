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
    public partial class AdminDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        // 🚪 Logout Button Click
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/home");
        }

        // ✅ After inserting a new Category
        protected void dvCategories_ItemInserted(object sender, System.Web.UI.WebControls.DetailsViewInsertedEventArgs e)
        {
            if (e.Exception == null)
            {
                // Refresh the GridView
                gvCategories.DataBind();
            }
            else
            {
                // Handle error
                e.ExceptionHandled = true;
                // Optionally show error message (using a Label if needed)
            }
        }

        // ✅ After inserting a new Product
        protected void dvProducts_ItemInserted(object sender, System.Web.UI.WebControls.DetailsViewInsertedEventArgs e)
        {
            if (e.Exception == null)
            {
                // Refresh the GridView
                gvProducts.DataBind();
            }
            else
            {
                e.ExceptionHandled = true;
            }
        }

        // Optional: Handle when a category is selected (e.g., future functionality)
        protected void gvCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Placeholder: Do something if needed when a row is selected
        }

        // Optional: Handle when a product is selected
        protected void gvProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Placeholder: Do something if needed when a row is selected
        }
        protected void gvCategories_RowDeleted(object sender, GridViewDeletedEventArgs e) { if (e.Exception != null) { lblMessage.Text = "You cannot delete this category because it has products assigned to it."; lblMessage.ForeColor = System.Drawing.Color.Red; e.ExceptionHandled = true; } }
    }
}