using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace CertQA
{
  public partial class ShowProjects : System.Web.UI.Page
  {
    static string _ENV;
    static string customer;
    protected void Page_Load(object sender, EventArgs e)
    {
      customer = Convert.ToString(Session["Cus01"]);
      _ENV = Convert.ToString(Session["ENV"]);
      if (!IsPostBack)
      {
        GridLoad(999999);
      }
    }
    protected void GridLoad(int orderRowIndex)
    {
      if (!customer.Equals(""))
      {
        int counter = 0;
        DataTable dt = new DataTable();
        DataRow dr = null;
        dt.Columns.Add("Order", System.Type.GetType("System.String"));
        dt.Columns.Add("Project", System.Type.GetType("System.String"));

        List<object> prjList = SAPHelper.GetCustomerProjects(customer);
        foreach (CustProj item in prjList)
        {
          if (counter == 0)
          {
            lblCustomerNbr.Text = customer;
            lblCustomerName.Text = item.VBELN;
          }
          else
          {
            dr = dt.NewRow();
            dr["Order"] = item.VBELN;
            dr["Project"] = item.PS_PSP_PNR;
            dt.Rows.Add(dr);
          }
          counter++;
        }
        dt.AcceptChanges();
        OrderGrid.DataSource = dt;
        OrderGrid.DataBind();
        foreach (GridViewRow row in OrderGrid.Rows)
        {
          if (row.RowIndex == orderRowIndex)
          {
            row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
            row.ForeColor = ColorTranslator.FromHtml("#FFFFFF");
            row.ToolTip = string.Empty;
          }
          else
          {
            row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
            row.ForeColor = ColorTranslator.FromHtml("#000000");
            row.ToolTip = "Click to select this row.";
          }
        }
      }
    }

    protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
      if (e.Row.RowType == DataControlRowType.DataRow)
      {
        e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(OrderGrid, "Select$" + e.Row.RowIndex);
        e.Row.ToolTip = "Click to select this row.";
      }
    }

    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {
      foreach (GridViewRow row in OrderGrid.Rows)
      {
        if (row.RowIndex == OrderGrid.SelectedIndex)
        {
          Session["CusName"] = lblCustomerName.Text;
          Session["Ord01"] = row.Cells[0].Text;
          Session["Prj01"] = row.Cells[1].Text;
          Session["ENV"] = _ENV; 
//          Response.Redirect("Pages/ShowProject.aspx"); // ShowProject.aspx will open when clicked on "Next" Button
//          Response.Redirect("ShowSingleProject.aspx"); // ShowSingleProject.aspx will open when clicked on "Next" Button
          Response.Redirect("ShowSingleOrder.aspx"); // ShowSingleOrder.aspx will open when clicked on "Next" Button
          break;
        }
      }
    }
  }
}