<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" UnobtrusiveValidationMode="none"  AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Group5_FinalProject.AdminLogin" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center">Admin Login</h2>
    <asp:ValidationSummary runat="server" CssClass="text-danger" />

    <label>Email:</label>
    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
    <asp:RequiredFieldValidator ControlToValidate="txtEmail" runat="server" ErrorMessage="Email required" CssClass="text-danger" />

    <br />

    <label>Password:</label>
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />
    <asp:RequiredFieldValidator ControlToValidate="txtPassword" runat="server" ErrorMessage="Password required" CssClass="text-danger" />

    <br />

    <asp:Button ID="btnLogin" runat="server" Text="Login as Admin" CssClass="btn btn-primary mt-3" OnClick="btnLogin_Click" />
    <br />
    <asp:Label ID="lblError" runat="server" CssClass="text-danger d-block mt-3" />
</asp:Content>
