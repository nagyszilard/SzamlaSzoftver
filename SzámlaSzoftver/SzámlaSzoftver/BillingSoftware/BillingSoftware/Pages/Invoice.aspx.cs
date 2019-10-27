using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace BillingSoftware.Pages
{
    public partial class Invoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && !IsCallback)
            {
                int? id = null;
                int itmp;
                if (int.TryParse(Page.Request.QueryString["Id"], out itmp))
                {
                    int index= gvInvoice.FindVisibleIndexByKeyValue(itmp);
                    gvInvoice.FocusedRowIndex = index;
                }
            }
        }
            protected void AddButton_Click(object sender, EventArgs e)
            {

            Response.Redirect("~/Pages/InvoiceDetail.aspx?mode=edit&InvoiceID=new" );

            }

        protected void EditButton_Click(object sender, EventArgs e)
        {

            if (gvInvoice.FocusedRowIndex == -1) return;

            int id = (int)gvInvoice.GetRowValues(gvInvoice.FocusedRowIndex, "InvoiceID");

            Response.Redirect("~/Pages/InvoiceDetail.aspx?mode=edit&InvoiceID="+ id);
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            BillingLINQDataContext kp = new BillingLINQDataContext();

            if (gvInvoice.FocusedRowIndex == -1) return;

            int id = (int)gvInvoice.GetRowValues(gvInvoice.FocusedRowIndex, "InvoiceID");

            var delete = kp.Invoices.FirstOrDefault(s => s.InvoiceID == id);
            if (delete != null)
            {
                kp.Invoices.DeleteOnSubmit(delete);
                kp.SubmitChanges();
               
            }

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
}