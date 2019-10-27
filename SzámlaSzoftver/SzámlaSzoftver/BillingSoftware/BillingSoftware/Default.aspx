<%@ Page Title="Billing Software" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BillingSoftware._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" >
     <div>
    
     <asp:Label ID="lbWelcome" runat="server" Text="Üdvözöljük a számlázó programban!" Font-Size ="Larger" CssClass="WelcomeLabel"></asp:Label>
     <div>

     <asp:Button ID="BtnWelcome" runat="server" CssClass="btn btn-block btn-primary btn-lg BtnWelcome" Text="Számlák listája" OnClick="WelcomeButton_Click" />
    </div>
    </div>
     </asp:Content>
   



