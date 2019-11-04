using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web;


namespace BillingSoftware.Pages
{
    public partial class InviceItem : System.Web.UI.Page
    {
        static string prevPage = String.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && !IsCallback)
            {
                prevPage = Request.UrlReferrer.ToString();

                int? id = null;
                int itmp;
                if (int.TryParse(Page.Request.QueryString["InvoiceID"], out itmp))
                {
                    id = itmp;
                    Session["InvoiceID"] = id;//globális változó 
                    if (id != null)
                    {
                        BillingLINQDataContext kp = new BillingLINQDataContext();
                        var record = kp.Invoices.Where(a => a.InvoiceID == itmp).FirstOrDefault();
                        var invoicdetail = kp.InvoiceDetails.Where(a => a.InvoiceID == itmp);
                        var InvoiceDetail = kp.InvoiceDetails.Where(a => a.InvoiceID == record.InvoiceID).FirstOrDefault();

                        tbProductName.Text = InvoiceDetail.ProductName;
                        tbAmountUnit.Text = InvoiceDetail.AmountUnit;
                        tbQuantity.Text = InvoiceDetail.Quantity.ToString();
                        tbUnitPrice.Text = InvoiceDetail.UnitPrice.ToString();
                        gwInvoiceItem.DataSource = invoicdetail;
                        gwInvoiceItem.DataBind();
                    }
                }
            }

        }

        protected void BtnItemNew_Click(object sender, EventArgs e)
        {
            
        }

        protected void BtnItemModification_Click(object sender, EventArgs e)
        {
                tbProductName.Visible = true;
                tbAmountUnit.Visible = true;
                tbQuantity.Visible = true;
                tbUnitPrice.Visible = true;
                BillingLINQDataContext kp = new BillingLINQDataContext();
                var invoice = kp.InvoiceDetails.Where(x => x.InvoiceID == (int)Session["InvoiceID"]).FirstOrDefault();
            
        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect(prevPage);
        }

        protected void BtnSaveItem_Click(object sender, EventArgs e)
        {
            BillingLINQDataContext kp = new BillingLINQDataContext();
            var invoice = kp.InvoiceDetails.Where(x => x.InvoiceID == (int)Session["InvoiceID"]).FirstOrDefault();
            invoice.ProductName = tbProductName.Text;
            invoice.AmountUnit = tbAmountUnit.Text;
            //invoice.Quantity = tbQuantity.Text.ToString;
            kp.SubmitChanges();
            Response.Redirect(prevPage);
        }

        protected void BtnDeleteItem_Click(object sender, EventArgs e)
        {
            BillingLINQDataContext kp = new BillingLINQDataContext();

            if (gwInvoiceItem.FocusedRowIndex == -1) return;

            int id = (int)gwInvoiceItem.GetRowValues(gwInvoiceItem.FocusedRowIndex, "InvoiceID");

            var delete = kp.InvoiceDetails.FirstOrDefault(s => s.InvoiceID == id);
            if (delete != null)
            {
                kp.InvoiceDetails.DeleteOnSubmit(delete);
                kp.SubmitChanges();

            }

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }

}