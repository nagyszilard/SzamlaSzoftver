using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BillingSoftware.Pages
{
    public partial class InvoiceDetail : System.Web.UI.Page
    {
     
        protected void Page_Load(object sender, EventArgs e)
        {
         
            if (!IsPostBack && !IsCallback)
            {
               
                dsCustomer.DataBind();
                
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
                        var Customer = kp.Customers.Where(a => a.CustomerID == record.CustomerID).FirstOrDefault();
                        var Company = kp.Companies.Where(a => a.CompanyID == record.CompanyID).FirstOrDefault();
                        gwInvoiceDetail.DataSource = invoicdetail;
                        gwInvoiceDetail.DataBind();

                        DueDate.Date = record.DueDate.GetValueOrDefault();
                        InvoiceDate.Date = record.InvoiceDate.GetValueOrDefault();
                        DateOfCompletion.Date = record.DateOfCompletion.GetValueOrDefault();

                        cbCompany.Value = record.CompanyID;
                        CompanyAddress.Text = Company.Adress;
                        CompanyAccountNumber.Text = Company.AccountNumber;

                        cbCustomer.Value = record.CustomerID;
                        CustomerAddress.Text = Customer.Adress;
                        CustomerAccountNumber.Text = Customer.AccountNumber;
                        tbInvoiceNumber.Text = record.InvoiceNumber;
                        //DueDateTextBox.Text = record.DueDate.Value.ToString("d", CultureInfo.CreateSpecificCulture("hu-HU"));
                        //InvoiceDateTextBox.Text = record.InvoiceDate.Value.ToString("d", CultureInfo.CreateSpecificCulture("hu-HU"));
                        //DateOfCompletionTextBox.Text = record.DateOfCompletion.ToString("d", CultureInfo.CreateSpecificCulture("hu-HU"));
                        tbNetto.Text = record.Netto.ToString();
                        tbTax.Text = record.Tax.ToString();
                        tbBrutto.Text = record.Brutto.ToString();

                        //Session["InvoiceNumber"] = record.InvoiceNumber; ;
                    }
                }

                else if (Page.Request.QueryString["InvoiceID"] == "new")
                {
                    Session["InvoiceID"] = "new";//globális változó 
                }

               
            }
        }

        protected void LinqDataSource1_ContextCreating(object sender, LinqDataSourceContextEventArgs e)
        {

        }

        protected void InvoiceNumberTextBox_TextChanged(object sender, EventArgs e)
        {
           
        }

        protected void InvoiceDetailGridView_SelectionChanged(object sender, EventArgs e)
        {
            
        }

        protected void InvoiceDetailGridView_DataBinding(object sender, EventArgs e)
        {

        }

        protected void ASPxBack_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("~/Pages/Invoice.aspx?Id="+Session["InvoiceID"]);
           
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            BillingLINQDataContext kp = new BillingLINQDataContext();
            if (Session["InvoiceID"] != "new")
            {
                var invoice = kp.Invoices.Where(x => x.InvoiceID == (int)Session["InvoiceID"]).FirstOrDefault();
                invoice.InvoiceDate = InvoiceDate.Date;
                invoice.DateOfCompletion = DateOfCompletion.Date;
                invoice.DueDate = DueDate.Date;
                invoice.CustomerID = (int)cbCustomer.Value;
                invoice.CompanyID = (int)cbCompany.Value;
                
                kp.SubmitChanges();
            }
            else
            {
                int maxInvoiceID = kp.Invoices.Max(x => x.InvoiceID) + 1;
                BillingSoftware.Invoice item = new BillingSoftware.Invoice();
                item.InvoiceNumber = DateTime.Today.ToString("yymmdd") + "_" + maxInvoiceID.ToString();
                kp.Invoices.ToList().Add(item);
                kp.SubmitChanges();
            }

            Response.Redirect("~/Pages/Invoice.aspx?Id="+Session["InvoiceID"]);
        }

        protected void cbCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            BillingLINQDataContext kp = new BillingLINQDataContext();
            var Customer = kp.Customers.Where(a => a.CustomerID == (int)cbCustomer.Value).FirstOrDefault();
            CustomerAddress.Text = Customer.Adress;
            CustomerAccountNumber.Text = Customer.AccountNumber;
        }

        protected void cbCompany_SelectedIndexChanged(object sender, EventArgs e)
        {
            BillingLINQDataContext kp = new BillingLINQDataContext();
            var Company = kp.Companies.Where(a => a.CompanyID == (int)cbCompany.Value).FirstOrDefault();
            CompanyAddress.Text = Company.Adress;
            CompanyAccountNumber.Text = Company.AccountNumber;

        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            BillingLINQDataContext kp = new BillingLINQDataContext();

            if (gwInvoiceDetail.FocusedRowIndex == -1) return;

            int id = (int)gwInvoiceDetail.GetRowValues(gwInvoiceDetail.FocusedRowIndex, "InvoiceID");

            var delete = kp.InvoiceDetails.FirstOrDefault(s => s.InvoiceID == id);
            if (delete != null)
            {
                kp.InvoiceDetails.DeleteOnSubmit(delete);
                kp.SubmitChanges();

            }

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void BtnNew_Click(object sender, EventArgs e)
        {
            if (gwInvoiceDetail.FocusedRowIndex == -1) return;

            int id = (int)gwInvoiceDetail.GetRowValues(gwInvoiceDetail.FocusedRowIndex, "InvoiceID");

            Response.Redirect("~/Pages/InvoiceItem.aspx?mode=edit&InvoiceID=" + id);
        }

        protected void BtnModification_Click(object sender, EventArgs e)
        {
            if (gwInvoiceDetail.FocusedRowIndex == -1) return;

            int id = (int)gwInvoiceDetail.GetRowValues(gwInvoiceDetail.FocusedRowIndex, "InvoiceID");

            Response.Redirect("~/Pages/InvoiceItem.aspx?mode=edit&InvoiceID=" + id);
        }
    }
}