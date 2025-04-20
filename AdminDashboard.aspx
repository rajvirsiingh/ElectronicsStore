<%@ Page Language="C#" MasterPageFile="~/AdminMater.Master" AutoEventWireup="true" UnobtrusiveValidationMode="none" CodeBehind="AdminDashboard.aspx.cs" Inherits="Group5_FinalProject.AdminDashboard" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent2">
    <h2 class="text-center">
        <asp:Button ID="btnLogout" runat="server" CssClass="btn btn-danger" Text="Logout" OnClick="btnLogout_Click" />
    </h2>

    <h2 class="text-center">Dashboard</h2>

    <!-- Categories Section -->
    <h3>Manage Categories</h3>
    <asp:Label ID="lblMessage" runat="server" CssClass="text-danger" EnableViewState="false" />


    <asp:SqlDataSource ID="SqlDataSourceCategories" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM Categories"
        InsertCommand="INSERT INTO Categories (Name) VALUES (@Name)"
        UpdateCommand="UPDATE Categories SET Name = @Name WHERE CategoryID = @CategoryID"
        DeleteCommand="DELETE FROM Categories WHERE CategoryID = @CategoryID">
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="CategoryID" Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="CategoryID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>

    <asp:ValidationSummary ID="ValidationSummaryCategories" runat="server"
        HeaderText="Please fix the following errors:"
        ForeColor="Red" ShowMessageBox="False" ShowSummary="True"
        ValidationGroup="CategoryInsert" />

    <asp:GridView ID="gvCategories" runat="server" DataSourceID="SqlDataSourceCategories"
        AutoGenerateColumns="False" DataKeyNames="CategoryID" CssClass="table table-bordered"
        AllowPaging="true" PageSize="5" OnRowDeleted="gvCategories_RowDeleted" OnSelectedIndexChanged="gvCategories_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="CategoryID" HeaderText="ID" ReadOnly="True" />
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>

    <asp:DetailsView ID="dvCategories" runat="server" DataSourceID="SqlDataSourceCategories"
        AutoGenerateRows="False" DefaultMode="Insert" CssClass="table"
        OnItemInserted="dvCategories_ItemInserted">
        <Fields>
            <asp:TemplateField HeaderText="Category Name">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtCategoryName" runat="server" Text='<%# Bind("Name") %>' />
                    <asp:RequiredFieldValidator ID="rfvCategoryName" runat="server"
                        ControlToValidate="txtCategoryName" ErrorMessage="Category name is required."
                        ForeColor="Red" Display="Dynamic" ValidationGroup="CategoryInsert" />
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="True" InsertText="Insert"
                ValidationGroup="CategoryInsert" />
        </Fields>
    </asp:DetailsView>

    <hr />

    <!-- Products Section -->
    <h3>Manage Products</h3>

    <asp:SqlDataSource ID="SqlDataSourceProducts" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM Products"
        InsertCommand="INSERT INTO Products (Name, Description, Price, StockQty, ImagePath, CategoryID) 
                       VALUES (@Name, @Description, @Price, @StockQty, @ImagePath, @CategoryID)"
        UpdateCommand="UPDATE Products SET Name = @Name, Description = @Description, Price = @Price, StockQty = @StockQty, ImagePath = @ImagePath, CategoryID = @CategoryID 
                       WHERE ProductID = @ProductID"
        DeleteCommand="DELETE FROM Products WHERE ProductID = @ProductID">
        <InsertParameters>
            <asp:Parameter Name="Name" />
            <asp:Parameter Name="Description" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="StockQty" Type="Int32" />
            <asp:Parameter Name="ImagePath" />
            <asp:Parameter Name="CategoryID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" />
            <asp:Parameter Name="Description" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="StockQty" Type="Int32" />
            <asp:Parameter Name="ImagePath" />
            <asp:Parameter Name="CategoryID" Type="Int32" />
            <asp:Parameter Name="ProductID" Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="ProductID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>

    <asp:ValidationSummary ID="ValidationSummaryProducts" runat="server"
        HeaderText="Please fix the following errors:"
        ForeColor="Red" ShowMessageBox="False" ShowSummary="True"
        ValidationGroup="ProductInsert" />

    <asp:GridView ID="gvProducts" runat="server" DataSourceID="SqlDataSourceProducts"
        AutoGenerateColumns="False" DataKeyNames="ProductID" CssClass="table table-bordered"
        AllowPaging="true" PageSize="5" OnSelectedIndexChanged="gvProducts_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="ProductID" HeaderText="ID" ReadOnly="True" />
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:BoundField DataField="Price" HeaderText="Price" />
            <asp:BoundField DataField="StockQty" HeaderText="Stock" />
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>

    <asp:DetailsView ID="dvProducts" runat="server" DataSourceID="SqlDataSourceProducts"
        AutoGenerateRows="False" DefaultMode="Insert" CssClass="table"
        OnItemInserted="dvProducts_ItemInserted">
        <Fields>
            <asp:TemplateField HeaderText="Name">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>' />
                    <asp:RequiredFieldValidator ID="rfvName" runat="server"
                        ControlToValidate="txtName" ErrorMessage="Name is required."
                        ForeColor="Red" Display="Dynamic" ValidationGroup="ProductInsert" />
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Description">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' />
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Price">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("Price") %>' />
                    <asp:RequiredFieldValidator ID="rfvPrice" runat="server"
                        ControlToValidate="txtPrice" ErrorMessage="Price is required."
                        ForeColor="Red" Display="Dynamic" ValidationGroup="ProductInsert" />
                    <asp:RangeValidator ID="rvPrice" runat="server" ControlToValidate="txtPrice"
                        MinimumValue="0.01" MaximumValue="10000" Type="Double"
                        ErrorMessage="Price must be between 0.01 and 10000." ForeColor="Red" Display="Dynamic"
                        ValidationGroup="ProductInsert" />
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Stock">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtStock" runat="server" Text='<%# Bind("StockQty") %>' />
                    <asp:RequiredFieldValidator ID="rfvStock" runat="server"
                        ControlToValidate="txtStock" ErrorMessage="Stock quantity is required."
                        ForeColor="Red" Display="Dynamic" ValidationGroup="ProductInsert" />
                    <asp:RangeValidator ID="rvStock" runat="server" ControlToValidate="txtStock"
                        MinimumValue="0" MaximumValue="9999" Type="Integer"
                        ErrorMessage="Stock must be a valid number (0–9999)." ForeColor="Red" Display="Dynamic"
                        ValidationGroup="ProductInsert" />
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Image URL">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtImagePath" runat="server" Text='<%# Bind("ImagePath") %>' />
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Category ID">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtCategoryID" runat="server" Text='<%# Bind("CategoryID") %>' />
                    <asp:RequiredFieldValidator ID="rfvCategoryID" runat="server"
                        ControlToValidate="txtCategoryID" ErrorMessage="Category ID is required."
                        ForeColor="Red" Display="Dynamic" ValidationGroup="ProductInsert" />
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowInsertButton="True" InsertText="Insert"
                ValidationGroup="ProductInsert" />
        </Fields>
    </asp:DetailsView>
</asp:Content>