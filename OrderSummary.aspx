<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="OrderSummary.aspx.cs" UnobtrusiveValidationMode="none"  Inherits="Group5_FinalProject.OrderSummary" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center">Order Summary</h2>
    <asp:Label runat="server" ID="lblConfirmation"/>
    <asp:GridView ID="gvSummary" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered mt-4">
        <Columns>
            <asp:BoundField DataField="ProductName" HeaderText="Product" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
            <asp:BoundField DataField="Price" HeaderText="Unit Price" DataFormatString="{0:C}" />
            <asp:BoundField DataField="Total" HeaderText="Total" DataFormatString="{0:C}" />
        </Columns>
    </asp:GridView>

    <asp:Panel ID="pnlUserInfo" runat="server" CssClass="mb-4">
        <h4>Customer Information</h4>
        <p><strong>Name:</strong> <asp:Label ID="lblName" runat="server" /></p>
        <p><strong>Email:</strong> <asp:Label ID="lblEmail" runat="server" /></p>
        <p><strong>Address:</strong> <asp:Label ID="lblAddress" runat="server" /></p>
        <p><strong>Payment Method:</strong> <asp:Label ID="lblPayment" runat="server" /></p>
    </asp:Panel>

    <asp:Label ID="lblGrandTotal" runat="server" CssClass="h4 mt-3 d-block text-end me-3" />
    <asp:Button runat="server" Text="Place Order" ID="btnPlaceOrder" CssClass="btn btn-primary " OnClick="btnPlaceOrder_Click" />
</asp:Content>