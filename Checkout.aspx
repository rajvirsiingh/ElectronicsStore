<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Group5_FinalProject.Checkout" UnobtrusiveValidationMode="none" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center my-4">Checkout</h2>

    <div class="container" style="max-width: 600px;">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" />

        <div class="mb-3">
            <label>Full Name</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Name is required" CssClass="text-danger" />
        </div>

        <div class="mb-3">
            <label>Email</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" CssClass="text-danger" />
        </div>

        <div class="mb-3">
            <label>Shipping Address</label>
            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is required" CssClass="text-danger" />
        </div>

        <div class="mb-3">
            <label>Payment Method</label>
            <asp:DropDownList ID="ddlPayment" runat="server" CssClass="form-control">
                <asp:ListItem Text="Credit Card" Value="Credit Card" />
                <asp:ListItem Text="PayPal" Value="PayPal" />
                <asp:ListItem Text="Cash on Delivery" Value="COD" />
            </asp:DropDownList>
        </div>

        <asp:Button ID="btnContinue" runat="server" Text="Continue to Summary" CssClass="btn btn-primary" OnClick="btnContinue_Click" />
    </div>
</asp:Content>
