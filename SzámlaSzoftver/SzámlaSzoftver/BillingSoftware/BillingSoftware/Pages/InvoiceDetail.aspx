<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="InvoiceDetail.aspx.cs" Inherits="BillingSoftware.Pages.InvoiceDetail" %>

<%@ Register assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<style type="text/css">
    @media screen and (min-width: 480px) {
    #leftsidebar {
        width: 200px;
        float: left;
    }

    #main {
        margin-left: 216px;
    }
}
.dxgvHeader_MetropolisBlue
{
	background: #E0E0E0!important;
}
.dxbButton_MetropolisBlue, .dxbButtonHover_MetropolisBlue
{
	color: black!important;
	background: #E0E0E0!important;	
            top: 656px;
            left: 358px;
        }
.dxbButtonHover_MetropolisBlue
{
	color: white!important;
	background: #0072C6!important;
   
}

</style>
    <div> <dx:ASPxLabel ID="lbBilling" runat="server" Text="Számla" CssClass="LabelBilling" Font-Size="Larger" > </dx:ASPxLabel> 

    </div>

 <table>
        <tr>
            
            <td><dx:ASPxLabel ID="lbComapny" runat="server" Text="Szállító:"> </dx:ASPxLabel> 
<asp:Panel ID="CompanyBoxId" runat="server" CssClass="CompanyBox" >
      <dx:ASPxComboBox ID="cbCompany" runat="server" AutoPostBack="True" DataSourceID="dsCompany" ForceDataBinding="True" OnSelectedIndexChanged="cbCompany_SelectedIndexChanged" TextField="Name" Theme="MetropolisBlue" ValueField="CompanyID" ValueType="System.Int32" ViewStateMode="Disabled"></dx:ASPxComboBox>
    <dx:ASPxTextBox ID="CompanyAddress" runat="server" Width="170px" CssClass="CompanyAddress"></dx:ASPxTextBox>
    <dx:ASPxTextBox ID="CompanyAccountNumber" runat="server" Width="170px" CssClass="CompanyAccNum"></dx:ASPxTextBox>
 <asp:SqlDataSource ID="dsCompany" runat="server" ConnectionString="<%$ ConnectionStrings:BillingConnectionString2 %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [CompanyID], [Name] FROM [Companys]"></asp:SqlDataSource>
</asp:Panel>
            </td>

            <td><dx:ASPxLabel ID="CustomerLabel" runat="server" Text="Vevő:"> </dx:ASPxLabel> 
                <asp:Panel ID="CustomerBoxID" runat="server" CssClass="CustomerBox" >
                    <dx:ASPxComboBox ID="cbCustomer" AutoPostBack="true" runat="server" DataSourceID="dsCustomer" ForceDataBinding="True" OnSelectedIndexChanged="cbCustomer_SelectedIndexChanged" Theme="MetropolisBlue" ViewStateMode="Disabled" TextField="Name" ValueField="CustomerID" ValueType="System.Int32">
                    </dx:ASPxComboBox>
                    <dx:ASPxTextBox ID="CustomerAddress" runat="server" CssClass="CustromerAddress" Width="170px">
                    </dx:ASPxTextBox>
                    <dx:ASPxTextBox ID="CustomerAccountNumber" runat="server" CssClass="CustomerAccNum" Width="170px">
                    </dx:ASPxTextBox>
                    <asp:SqlDataSource ID="dsCustomer" runat="server" ConnectionString="<%$ ConnectionStrings:BillingConnectionString2 %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [CustomerID], [Name] FROM [Customers]"></asp:SqlDataSource>
   </asp:Panel></td>
        </tr>
    </table>
<div>
      <dx:ASPxLabel ID="lbInvoiceNumber" runat="server" Text="Számlaszám:" CssClass="IvoiceNumberLabel"> </dx:ASPxLabel>
    <dx:ASPxTextBox ID="tbInvoiceNumber" runat="server" CssClass="IvoiceNumberTextbox" Width="170px" OnTextChanged="InvoiceNumberTextBox_TextChanged" ReadOnly="True">
        <ReadOnlyStyle Font-Bold="True">
        </ReadOnlyStyle>
      </dx:ASPxTextBox>
</div>
<div>
<table>
     <tr>
      <td> <dx:ASPxLabel ID="lbDueDate" runat="server" Text="Fiz. határidő:" CssClass="DueDateLabel"></dx:ASPxLabel> </td>
      <td><dx:ASPxLabel ID="lbIvoiceDate" runat="server" Text="Számla kelte:" CssClass="InvoiceDateLabel"></dx:ASPxLabel></td>
      <td> <dx:ASPxLabel ID="lbDateOfCompletion" runat="server" Text="Tel. időpontja:" Theme="MetropolisBlue" CssClass="DateOFLabel"></dx:ASPxLabel></td>
    </tr>
    
    <tr>
      <td> <dx:ASPxDateEdit ID="DueDate" runat="server" CssClass="DueDate" Theme="MetropolisBlue" Width="110px"></dx:ASPxDateEdit> </td>
      <td>  <dx:ASPxDateEdit ID="InvoiceDate" runat="server" CssClass="InvoiceDate" Theme="MetropolisBlue" Width="110px"></dx:ASPxDateEdit> </td>
      <td> <dx:ASPxDateEdit ID="DateOfCompletion" runat="server" CssClass="DateOF" Theme="MetropolisBlue" Width="110px"></dx:ASPxDateEdit> </td>
    </tr>
   
</table>
</div>
    <div>
         <dx:ASPxLabel ID="lbInvoice" runat="server" Text="Számlán szereplő tételek:" CssClass="lbInvoice"></dx:ASPxLabel>
    </div>
<div class="row">
<div class="col-sm-12">
           <dx:ASPxGridView ID="gwInvoiceDetail" runat="server" AutoGenerateColumns="False" KeyFieldName="InvoiceDetailID" Theme="MetropolisBlue" OnSelectionChanged="InvoiceDetailGridView_SelectionChanged" CssClass="InvoiceDetailGrid" Width="518px">
        <SettingsPager Visible="False">
        </SettingsPager>
               <SettingsBehavior AllowFocusedRow="True" />
<SettingsPopup>
<HeaderFilter MinHeight="140px"></HeaderFilter>
</SettingsPopup>
        <Columns>
            <dx:GridViewDataTextColumn FieldName="InvoiceDetailID" ReadOnly="True" VisibleIndex="0" Visible="false">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="InvoiceID" VisibleIndex="1" Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Terméknév" FieldName="ProductName" VisibleIndex="2" >
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="M.e" FieldName="AmountUnit" VisibleIndex="3" Width="16px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Menny." FieldName="Quantity" VisibleIndex="4" Width="55px">
                <HeaderStyle HorizontalAlign="Right" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Egységár" FieldName="UnitPrice" VisibleIndex="5" Width="130px">
                <PropertiesTextEdit DisplayFormatString="0,0">
                </PropertiesTextEdit>
                <HeaderStyle HorizontalAlign="Right" />
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
</div>
</div>
<table>
    <tr>
       <td> <dx:ASPxButton ID="BtnNew" CssClass="BtnNew" runat="server" Text="Hozzáadás"  Theme="MetropolisBlue" Width="100px" OnClick="BtnNew_Click"></dx:ASPxButton></></td>
       <td> <dx:ASPxButton ID="BtnModification" CssClass="BtnMod" runat="server" Text="Módósítás"  Theme="MetropolisBlue" Width="100px" OnClick="BtnModification_Click"></dx:ASPxButton></></td>
       <td> <dx:ASPxButton ID="BtnDelete" CssClass="BtnDelete" runat="server" Text="Törlés"  Theme="MetropolisBlue" Width="100px" OnClick="BtnDelete_Click"></dx:ASPxButton></></td>
   </tr>
</table>

<table>
     <tr>
      <td> <dx:ASPxLabel ID="lbNetto" runat="server" Text="Nettó:" CssClass="NettoLabel"></dx:ASPxLabel></td>
      <td><dx:ASPxLabel ID="lbTax" runat="server" Text="Áfa:" CssClass="TaxLabel"></dx:ASPxLabel> </td>
      <td> <dx:ASPxLabel ID="lbBrutto" runat="server" Text="Bruttó:" CssClass="BruttoLabel"></dx:ASPxLabel> </td>
    </tr>
      <tr>
     <td><dx:ASPxTextBox ID="tbNetto" runat="server" Width="110px" OnTextChanged="InvoiceNumberTextBox_TextChanged" CssClass="NettoTextBox" ReadOnly="true" BackColor="WhiteSmoke" RightToLeft="True"><MaskSettings Mask="&lt;0..99999g&gt;.&lt;00..99&gt; $" IncludeLiterals="DecimalSymbol"/></dx:ASPxTextBox></td>
      <td> <dx:ASPxTextBox ID="tbTax" runat="server" Width="110px" OnTextChanged="InvoiceNumberTextBox_TextChanged" CssClass="TaxTextBox" ReadOnly="true" BackColor="WhiteSmoke" RightToLeft="True"> </dx:ASPxTextBox></td>
      <td><dx:ASPxTextBox ID="tbBrutto" runat="server" Width="110px" OnTextChanged="InvoiceNumberTextBox_TextChanged" CssClass="BruttoTextbox" ReadOnly="true" BackColor="WhiteSmoke" RightToLeft="True"><MaskSettings Mask="&lt;0..99999g&gt;.&lt;00..99&gt; $" IncludeLiterals="DecimalSymbol"/></dx:ASPxTextBox></td>
    </tr>
   
</table>
<table>
 <tr>
        <td><dx:ASPxButton ID="BtnSave" CssClass="Btnsave" runat="server" Text="Ment"  Theme="MetropolisBlue" Width="100px" OnClick="BtnSave_Click"></dx:ASPxButton></td>
        <td><dx:ASPxButton ID="BtnBack" CssClass="BtnBack" runat="server" Text="Mégsem" OnClick="ASPxBack_Click" Theme="MetropolisBlue" Width="100px"></dx:ASPxButton></td>
    </tr>
</table>

<%--<input type="checkbox" id="myCheck"  onclick="myFunction()">

<p id="text" style="display:none">Checkbox is CHECKED!</p>

<script type="text/javascript">
    function myFunction() {
        var checkBox = document.getElementById("myCheck");
        var text = document.getElementById("text");
        if (checkBox.checked == true) {
            text.style.display = "block";
        } else {
            text.style.display = "none";
        }
    }
</script>--%>
</asp:Content>

