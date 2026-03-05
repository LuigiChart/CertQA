using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ToolTip;

namespace CertQA
{
  public partial class ShowSingleOrder : System.Web.UI.Page
  {
    static string _ENV;
    static string appMode;
    static string customerNbr;
    static string customerName;
    static string order;
    static string environment;
    protected void Page_Load(object sender, EventArgs e)
    {
      _ENV = Convert.ToString(Session["ENV"]);
      appMode = Convert.ToString(Session["AppMode"]);
      order = Convert.ToString(Session["Ord01"]);
      customerNbr = Convert.ToString(Session["Cus01"]);
      customerName = Convert.ToString(Session["CusName"]);
      environment = Convert.ToString(Session["ENV"]);

      if (!IsPostBack)
      {
        lblCustomerNbr.Text = customerNbr.TrimStart('0').Trim();
        lblCustomerName.Text = customerName;
        lblOrderNbr.Text = order;
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
      if (!order.Equals(""))
      {
        int counter = 0;
        DataTable dt = new DataTable();
        DataRow dr = null;
        dt.Columns.Add("VBELN", System.Type.GetType("System.String"));
        dt.Columns.Add("POSNR", System.Type.GetType("System.String"));
        dt.Columns.Add("MATNR", System.Type.GetType("System.String"));
        dt.Columns.Add("ARKTX", System.Type.GetType("System.String"));
        dt.Columns.Add("MENGE", System.Type.GetType("System.String"));
        dt.Columns.Add("MEINS", System.Type.GetType("System.String"));
        dt.Columns.Add("PSTYV", System.Type.GetType("System.String"));
        dt.Columns.Add("KDMAT", System.Type.GetType("System.String"));
        dt.Columns.Add("CLASSE", System.Type.GetType("System.String"));
        dt.Columns.Add("CHARG", System.Type.GetType("System.String"));

        List<object> orderList = SAPHelper.GetOrdersF007(order, "");
        foreach (F007 item in orderList)
        {
          dr = dt.NewRow();
          dr["VBELN"] = item.VBELN;
          dr["POSNR"] = item.POSNR;
          dr["MATNR"] = item.MATNR.TrimStart('0').Trim();
          dr["ARKTX"] = item.DESCRIPTION; //.Replace("\"", "");
          dr["MENGE"] = item.KWMENG;
          dr["MEINS"] = item.MEINS;
          dr["PSTYV"] = item.PSTYV;
          dr["KDMAT"] = item.KDMAT;
          dr["CHARG"] = item.CHARG;
          // retrieve material class
          dr["CLASSE"] = SAPHelper.GetMaterialClass(item.MATNR);
          if (counter == 0)
          {
            lblCustomerName.Text = item.NAME1;
            lblCustomerNbr.Text = item.KUNNR.TrimStart('0').Trim();
          }
          dt.Rows.Add(dr);
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
          Session["Lin"] = row.Cells[1].Text;
          Session["Mat"] = row.Cells[2].Text;
          //Session["Dsc"] = row.Cells[3].Text;
          Session["Qty"] = row.Cells[4].Text;
          Session["Uom"] = row.Cells[5].Text;
          Session["MatAlt"] = row.Cells[7].Text;
          Session["Cus01"] = lblCustomerNbr.Text; 
          Session["CusName"] = lblCustomerName.Text;
          Session["LnTyp"] = row.Cells[6].Text;
          Session["Class"] = row.Cells[8].Text;
          Session["Charg"] = row.Cells[9].Text;
          Session["Id01"] = "0";
          if (appMode.Equals("Q")){
            switch (row.Cells[8].Text)
            {
              case "VALVE_CHANGE_OVER":
                Response.Write("<script>alert('No form for VALVE_CHANGE_OVER ready')</script>");
                break;
              case "VALVE_CHECK":
                Response.Redirect("ShowGlobe.aspx");
                break;
              case "VALVE_DPF":
                Response.Write("<script>alert('No form for VALVE_DPF ready')</script>");
                break;
              case "VALVE_GLOBE_ACT":
                Response.Redirect("ShowGlobe.aspx");
                break;
              case "VALVE_GLOBE_MAN":
                Response.Redirect("ShowGlobe.aspx");
                break;
              case "VALVE_SAFETY":
                Response.Redirect("ShowSafety.aspx");
                break;
              default:
                Response.Redirect("ShowRevision.aspx");
                break;
            }
          }
          if (appMode.Equals("P")){
            Response.Redirect("ShowFTJP01.aspx");
          }
          break;
        }
      }
    }
  }
}