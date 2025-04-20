<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" UnobtrusiveValidationMode="none"  CodeBehind="Cart.aspx.cs" Inherits="Group5_FinalProject.Cart" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center mb-4">Cart</h2>
    <asp:Label ID="lblEmpty" runat="server" Text="Your Cart is Empty" CssClass="text-danger text-center" Visible="false"/>

    <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="false" OnRowDeleting="gvCart_RowDeleting" CssClass="table table-bordered">
        <Columns>
            <asp:BoundField DataField="ProductName" HeaderText="Product" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
            <asp:BoundField DataField="Price" HeaderText="Unit Price" DataFormatString="{0:C}" />
            <asp:BoundField DataField="Total" HeaderText="Total" DataFormatString="{0:C}" />
            <asp:CommandField ShowDeleteButton="true" HeaderText="Remove" />

        </Columns>
    </asp:GridView>
    
    <asp:Label ID="lblTotal" runat="server" CssClass="h4 mt-3 d-block" />
    <br />
    <asp:Button ID="btnClearCart" Text="Clear Cart" runat="server" CssClass="btn btn-danger" OnClick="btnClearCart_Click" />
    <asp:Button ID="btnCheckout" runat="server" Text="Checkout" CssClass="btn btn-primary" OnClick="btnCheckout_Click" />
</asp:Content>
