<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="InvoiceItem.aspx.cs" Inherits="BillingSoftware.Pages.InviceItem" %><%@ Register assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

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

    <div>
 <dx:ASPxLabel ID="lbInvoiceItem" runat="server" Text="Számlán szereplő tételek" CssClass="lbInvoiceItem"></dx:ASPxLabel>
    </div>
<div>    
<dx:ASPxGridView ID="gwInvoiceItem" runat="server" AutoGenerateColumns="False" KeyFieldName="InvoiceDetailItemID" Theme="MetropolisBlue" CssClass="InvoiceDetailGrid" Width="518px" EnableRowsCache="False">
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
    <SettingsDataSecurity AllowInsert="false" />
    <EditFormLayoutProperties>
            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="700" />
        </EditFormLayoutProperties>
        <SettingsPopup>
            <EditForm Width="600">
                <SettingsAdaptivity Mode="OnWindowInnerWidth" SwitchAtWindowInnerWidth="768" />
            </EditForm>
        </SettingsPopup>
    </dx:ASPxGridView>
</div>
    <div>
      <table>
       <tr>
        <td> <dx:ASPxTextBox ID="tbProductName" runat="server"  Width="293px" Visible="false" > </dx:ASPxTextBox> </td>
        <td> <dx:ASPxTextBox ID="tbAmountUnit" runat="server"  Width="35px" Visible="false" > </dx:ASPxTextBox> </td>
        <td> <dx:ASPxTextBox ID="tbQuantity" runat="server"  Width="59px" Visible="false" HorizontalAlign="Right" > </dx:ASPxTextBox> </td>
       <td> <dx:ASPxTextBox ID="tbUnitPrice" runat="server"  Width="131px" Visible="false" HorizontalAlign="Right" > </dx:ASPxTextBox>  </td>
      </tr>
      </table>
    </div>
<div>
    <table>
    <tr>
       <td> <dx:ASPxButton ID="BtnItemNew" CssClass="BtnNewItem" runat="server" Text="Hozzáadás"  Theme="MetropolisBlue" Width="100px" OnClick="BtnItemNew_Click"></dx:ASPxButton></></td>
       <td> <dx:ASPxButton ID="BtnItemModification" CssClass="BtnModItem" runat="server" Text="Módósítás"  Theme="MetropolisBlue" Width="100px" OnClick="BtnItemModification_Click"></dx:ASPxButton></></td>
      <td> <dx:ASPxButton ID="BtnDeleteItem" CssClass="BtnDeleteItem" runat="server" Text="Törlés"  Theme="MetropolisBlue" Width="100px" OnClick="BtnDeleteItem_Click"></dx:ASPxButton></></td>

   </tr>
</table>
</div>
<div>
    <table>
 <tr>
        <td><dx:ASPxButton ID="BtnSaveItem" CssClass="Btnsave" runat="server" Text="Ment"  Theme="MetropolisBlue" Width="100px" OnClick="BtnSaveItem_Click"></dx:ASPxButton></td>
        <td><dx:ASPxButton ID="BtnBackItem" CssClass="BtnBack" runat="server" Text="Mégsem" Theme="MetropolisBlue" Width="100px" OnClick="BtnBack_Click" ></dx:ASPxButton></td>
    </tr>
</table>
</div>
</asp:Content>

