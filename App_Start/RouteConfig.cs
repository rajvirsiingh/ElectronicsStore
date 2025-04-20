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
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace Group5_FinalProject
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Permanent;
            routes.EnableFriendlyUrls(settings);

            routes.MapPageRoute("home", "home", "~/Home.aspx");
            routes.MapPageRoute("admin-dashboard", "admin/dashboard", "~/AdminDashboard.aspx");
            routes.MapPageRoute("login", "admin/login", "~/AdminLogin.aspx");
            routes.MapPageRoute("products", "products", "~/Products.aspx");
            routes.MapPageRoute("cart", "cart", "~/Cart.aspx");
            routes.MapPageRoute("checkout", "checkout", "~/Checkout.aspx");
            routes.MapPageRoute("summary", "summary", "~/OrderSummary.aspx");
        }
    }
}
