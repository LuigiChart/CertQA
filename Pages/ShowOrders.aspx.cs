using Microsoft.Reporting.Map.WebForms.BingMaps;
using SAP.Middleware.Connector;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace CertQA
{
  public partial class ShowOrders : System.Web.UI.Page
  {
    static string _ENV;
    static string appMode;
    static string customerNbr;
    protected void Page_Load(object sender, EventArgs e)
    {
      appMode = Convert.ToString(Session["AppMode"]);
      customerNbr = Convert.ToString(Session["Cus01"]);
      _ENV = Convert.ToString(Session["ENV"]);
      if (!IsPostBack)
      {
        if (appMode.Equals("Q"))
        {
          lblMode.Text = "Mode = Q";
        }
        if (appMode.Equals("P"))
        {
          lblMode.Text = "Mode = P";
        }
        GridLoad(999999);
      }
    }
    protected void GridLoad(int orderRowIndex)
    {
      string oldOrder = "";
      if (!customerNbr.Equals(""))
      {
        int counter = 0;
        DataTable dt = new DataTable();
        DataRow dr = null;
        dt.Columns.Add("Order", System.Type.GetType("System.String"));
        dt.Columns.Add("Date", System.Type.GetType("System.String"));
        lblCustomerNbr.Text = customerNbr.TrimStart('0').Trim();
        //lblCustomerName.Text = SAPHelper.SAPReadKNA1(null, null, customerNbr.PadLeft(10, '0'));
        //List<object> orderList = SAPHelper.SAPReadVBAK(null, null, customerNbr.PadLeft(10, '0'));
        //foreach (VBAK order in orderList)
        //{
        //  dr = dt.NewRow();
        //  dr["Order"] = order.VBELN;
        //  dr["Date"] = order.AUDAT;
        //  dt.Rows.Add(dr);
        //  counter++;
        //}
        List<object> orderList = SAPHelper.GetOrdersF007("", customerNbr);
        foreach (F007 order in orderList)
        {
          if(oldOrder != order.VBELN){
            oldOrder = order.VBELN;
            dr = dt.NewRow();
            dr["Order"] = order.VBELN;
            dr["Date"] = order.ERDAT.Substring(6, 2) + "." + order.ERDAT.Substring(4, 2) + "." + order.ERDAT.Substring(0, 4);
            if (counter == 0){
              lblCustomerName.Text = order.NAME1;
            }
            dt.Rows.Add(dr);
            counter++;
          }
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
        // Save original color so we can restore it on mouseout
        string originalColor = e.Row.BackColor.IsEmpty ? "transparent" : System.Drawing.ColorTranslator.ToHtml(e.Row.BackColor);
        e.Row.Attributes["onmouseover"] = "this.style.backgroundColor='#dff0d8'; this.style.cursor='pointer';";
        e.Row.Attributes["onmouseout"] = $"this.style.backgroundColor='{originalColor}';";
      }
    }

    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {
      foreach (GridViewRow row in OrderGrid.Rows)
      {
        if (row.RowIndex == OrderGrid.SelectedIndex)
        {
          // Session["Cus01"] = customerNbr; already populated
          Session["CusName"] = lblCustomerName.Text;
          Session["Ord01"] = row.Cells[0].Text;
          Response.Redirect("ShowSingleOrder.aspx"); // ShowSingleOrder.aspx will open when clicked on "Next" Button
          break;
        }
      }
    }
  }
}