<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Invoice.aspx.cs" Inherits="BillingSoftware.Pages.Invoice" %>


<%@ Register assembly="DevExpress.Web.v19.1, Version=19.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>   
    <style type="text/css">
.dxgvHeader_MetropolisBlue
{
	background: #E0E0E0!important;
}
.dxbButton_MetropolisBlue, .dxbButtonHover_MetropolisBlue
{
	color: black!important;
	background: #E0E0E0!important;	
            top: 405px;
            left: 19px;
        }
.dxbButtonHover_MetropolisBlue
{
	color: white!important;
	background: #0072C6!important;
    
}
 
</style>
<div>
 <div>
    <asp:Label ID="lbInvoice" runat="server" Text="Számlák" CssClass="InvoiceLabel"></asp:Label>
 </div>
    <dx:ASPxGridView ID="gvInvoice" CssClass="GridInvoice" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="dsInvoice" KeyFieldName="InvoiceID" Theme="MetropolisBlue" EnableTheming="True">
        <ClientSideEvents RowDblClick="function(s, e) { ASPxButton2.onClick();}" ></ClientSideEvents>
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
        <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" />
        <SettingsResizing ColumnResizeMode="Control" />
<SettingsPopup>
<HeaderFilter MinHeight="140px"></HeaderFilter>
</SettingsPopup>
        <SettingsSearchPanel Visible="True" />
        <SettingsText GroupPanel="Csoportosítás kategória szerint" SearchPanelEditorNullText="Keresés a számlák között..." />
        <Columns>
            
            <dx:GridViewDataTextColumn FieldName="InvoiceID" ReadOnly="True" VisibleIndex="0" Visible="false">
                <EditFormSettings Visible="False"></EditFormSettings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Számlaszám" FieldName="InvoiceNumber" VisibleIndex="1" Width="75px"></dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Számla kelte" FieldName="InvoiceDate" VisibleIndex="4" Width="80px"></dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn Caption="Fiz. határidő" FieldName="DueDate" VisibleIndex="5" Width="80px"></dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn Caption="Tel. időpontja" FieldName="DateOfCompletion" VisibleIndex="6" Width="80px"></dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Nettó" FieldName="Netto" VisibleIndex="7" Width="110px">
                <PropertiesTextEdit DisplayFormatString="0,0">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Áfa" FieldName="Tax" VisibleIndex="8" Width="28px"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Bruttó" FieldName="Brutto" VisibleIndex="9" Width="110px">
                <PropertiesTextEdit DisplayFormatString="0,0">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Megjegyzés" FieldName="Note" VisibleIndex="10"></dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Vevő" FieldName="CustomerID" VisibleIndex="3" Width="170px">
                <PropertiesComboBox DataSourceID="dsCustomer" TextField="Name" ValueField="CustomerID">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Szállító" FieldName="CompanyID" Name="CusomerID" VisibleIndex="2" Width="190px">
                <PropertiesComboBox DataSourceID="dsCompany" TextField="Name" ValueField="CompanyID">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
    </dx:ASPxGridView>

    <div>
 </div>
<dx:ASPxButton ID="BtnAdd"  runat="server" OnClick="AddButton_Click" Width="100px" Text="Hozzáadás" Theme="MetropolisBlue">
</dx:ASPxButton>
<dx:ASPxButton ID="BtnEdit" CssClass="EditButton" runat="server" ClientInstanceName="ASPxButton2" OnClick="EditButton_Click" Width="100px" Text="Szerkesztés" Theme="MetropolisBlue">
</dx:ASPxButton>
<dx:ASPxButton ID="BtnDelete" CssClass="DeleteButton" runat="server" OnClick="DeleteButton_Click" Text="Törlés" Theme="MetropolisBlue" Width="100px">
</dx:ASPxButton>

    <asp:SqlDataSource runat="server" ID="dsInvoice" ConnectionString='<%$ ConnectionStrings:BillingConnectionString2 %>' DeleteCommand="DELETE FROM [Invoices] WHERE [InvoiceID] = @original_InvoiceID" InsertCommand="INSERT INTO [Invoices] ([InvoiceNumber], [CountryCode], [InvoiceDate], [DueDate], [DateOfCompletion], [Netto], [Tax], [Brutto], [Note]) VALUES (@InvoiceNumber, @CountryCode, @InvoiceDate, @DueDate, @DateOfCompletion, @Netto, @Tax, @Brutto, @Note)" SelectCommand="SELECT * FROM [Invoices]" UpdateCommand="UPDATE [Invoices] SET [InvoiceNumber] = @InvoiceNumber, [CountryCode] = @CountryCode, [InvoiceDate] = @InvoiceDate, [DueDate] = @DueDate, [DateOfCompletion] = @DateOfCompletion, [Netto] = @Netto, [Tax] = @Tax, [Brutto] = @Brutto, [Note] = @Note WHERE [InvoiceID] = @original_InvoiceID" OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
            <asp:Parameter Name="original_InvoiceID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="InvoiceNumber" Type="String"></asp:Parameter>
            <asp:Parameter Name="CountryCode" Type="String"></asp:Parameter>
            <asp:Parameter Name="InvoiceDate" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="DueDate" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="DateOfCompletion" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="Netto" Type="Single"></asp:Parameter>
            <asp:Parameter Name="Tax" Type="Single"></asp:Parameter>
            <asp:Parameter Name="Brutto" Type="Single"></asp:Parameter>
            <asp:Parameter Name="Note" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="InvoiceNumber" Type="String"></asp:Parameter>
            <asp:Parameter Name="CountryCode" Type="String"></asp:Parameter>
            <asp:Parameter Name="InvoiceDate" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="DueDate" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="DateOfCompletion" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="Netto" Type="Single"></asp:Parameter>
            <asp:Parameter Name="Tax" Type="Single"></asp:Parameter>
            <asp:Parameter Name="Brutto" Type="Single"></asp:Parameter>
            <asp:Parameter Name="Note" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_InvoiceID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource runat="server" ID="dsCustomer" ConnectionString='<%$ ConnectionStrings:BillingConnectionString2 %>' SelectCommand="SELECT [CustomerID], [Name] FROM [Customers]" OldValuesParameterFormatString="original_{0}">
    </asp:SqlDataSource>

    <asp:SqlDataSource runat="server" ID="dsCompany" ConnectionString='<%$ ConnectionStrings:BillingConnectionString2 %>' SelectCommand="SELECT [Name], [CompanyID] FROM [Companys]" OldValuesParameterFormatString="original_{0}">
    </asp:SqlDataSource>
</div>
</div>
</asp:Content>
