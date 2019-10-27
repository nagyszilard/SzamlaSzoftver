using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace BillingSoftware
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string BillingDB = ConfigurationManager.ConnectionStrings["Billing"].ConnectionString;

            //SqlConnection con = new SqlConnection(BillingDB);
            //SqlDataAdapter da = new SqlDataAdapter("Select InvoiceNumber,CountryCode,InvoiceDate,DateOfCompletion,Netto,Tax,Brutto,Note from Invoices ", con);
            //SqlDataAdapter da2 = new SqlDataAdapter("Select ProductName,AmountUnit,UnitPrice from InvoiceDetails", con);

            //DataSet ds1 = new DataSet();
            //da.Fill(ds1);

            //DataSet ds2 = new DataSet();
            //da2.Fill(ds2);

            //GridView1.DataSource = ds1;
            //GridView2.DataSource = ds2;
            //GridView1.DataBind();
            //GridView2.DataBind();
        }
protected void WelcomeButton_Click(object sender, EventArgs e)
        {
           Response.Redirect("~/Pages/Invoice");
        }
    }
}