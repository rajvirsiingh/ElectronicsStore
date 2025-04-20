<%@ Page Language="C#" UnobtrusiveValidationMode="none" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Group5_FinalProject.Products" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center my-4">
        Explore More
    </h2>
    <asp:SqlDataSource ID="ProductDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ProductID], [Name], [Price], [Description], [ImagePath], [CategoryID] FROM [Products]"></asp:SqlDataSource>
   
       
    <asp:SqlDataSource ID="DetailDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT P.Name, P.Description, P.Price, P.ImagePath, C.Name AS Category FROM Products P JOIN Categories C ON P.CategoryID = C.CategoryID Where P.ProductID = @ProductID">
        <SelectParameters>
            <asp:ControlParameter Name="ProductID" ControlID="ddlProducts" runat="server" PropertyName="SelectedValue" Type="Int32"/>
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:DropDownList ID="ddlProducts" CssClass="form-control w-50 mb-3" runat="server" DataSourceID="ProductDataSource" DataTextField="Name" DataValueField="ProductID" AutoPostBack="true">
    </asp:DropDownList>
   <asp:FormView 
            ID="fvProduct" 
            runat="server" 
            DataSourceID="DetailDataSource"
            RenderOuterTable="false" 
      >
            <ItemTemplate>
                <asp:Panel CssClass="card p-4 shadow-sm" style="max-width: 600px;" runat="server">
                    <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("ImagePath") %>' Height="200px" CssClass="mb-3" />
                    <h3><%# Eval("Name") %></h3>
                    <p>Category: <%# Eval("Category") %></p>
                    <p>Description: <%# Eval("Description") %></p>
                    <p class="text-primary">Price: <%# Eval("Price", "{0:C}") %></p>

                    <label for="txtQuantity">Quantity:</label>
                    <asp:TextBox ID="txtQuantity" runat="server" Text="1" TextMode="Number" CssClass="form-control w-25" />

                    <asp:RequiredFieldValidator ID="rfvQty" runat="server" ControlToValidate="txtQuantity"
                        ErrorMessage="Quantity required" Display="Dynamic" CssClass="text-danger" />

                    <asp:RangeValidator ID="rvQty" runat="server" ControlToValidate="txtQuantity"
                        MinimumValue="1" MaximumValue="10" Type="Integer" Display="Dynamic"
                        ErrorMessage="Enter between 1–10" CssClass="text-danger" />

                    <br />
                    <asp:Label ID="lblSuccess" runat="server" CssClass="text-success fw-bold" Visible="false"/>
                    <asp:Button ID="btnAddToCart" OnClick="btnAddToCart_Click" runat="server" Text="Add to Cart" CssClass="btn btn-success mt-2" />
                </asp:Panel>
            </ItemTemplate>
        </asp:FormView>

   
       
</asp:Content>
