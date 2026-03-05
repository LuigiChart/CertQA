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
  public partial class ShowSingleProject : System.Web.UI.Page
  {
    static string _ENV;
    static string customerNbr;
    static string customerName;
    static string order;
    static string project;
    protected void Page_Load(object sender, EventArgs e)
    {
      _ENV = Convert.ToString(Session["ENV"]);
      project = Convert.ToString(Session["Prj01"]);
      order = Convert.ToString(Session["Ord01"]);
      customerNbr = Convert.ToString(Session["Cus01"]);
      customerName = Convert.ToString(Session["CusName"]);
      if (!IsPostBack)
      {
        GridLoad(999999);
      }
    }
    protected void GridLoad(int orderRowIndex)
    {
      if (!project.Equals(""))
      {
        int counter = 0;
        DataTable dt = new DataTable();
        DataRow dr = null;
        dt.Columns.Add("WBSName", System.Type.GetType("System.String"));
        dt.Columns.Add("WBSInt", System.Type.GetType("System.String"));
        dt.Columns.Add("WBSExt", System.Type.GetType("System.String"));
        dt.Columns.Add("EBELN", System.Type.GetType("System.String"));
        dt.Columns.Add("EBELP", System.Type.GetType("System.String"));
        dt.Columns.Add("MATNR", System.Type.GetType("System.String"));
        dt.Columns.Add("TXZ01", System.Type.GetType("System.String"));
        dt.Columns.Add("MENGE", System.Type.GetType("System.String"));
        dt.Columns.Add("MEINS", System.Type.GetType("System.String"));

        List<object> wbsList = SAPHelper.GetProjectDetail1(project);
        foreach (ProjDetail item in wbsList)
        {
          if (counter == 0)
          {
            lblProject.Text = item.WBSNAME;
            lblProjectName.Text = item.TXZ01;
          }
          else
          {
            dr = dt.NewRow();
            dr["WBSName"] = item.WBSNAME;
            dr["WBSInt"] = item.WBSINT;
            dr["WBSExt"] = item.WBSEXT;
            dr["EBELN"] = item.EBELN;
            dr["EBELP"] = item.EBELP;
            dr["MATNR"] = item.MATNR;
            dr["TXZ01"] = item.TXZ01;
            dr["MENGE"] = item.MENGE;
            dr["MEINS"] = item.MEINS;
            dt.Rows.Add(dr);
          }
          counter++;
        }
        dt.AcceptChanges();
        WBSGrid.DataSource = dt;
        WBSGrid.DataBind();
        foreach (GridViewRow row in WBSGrid.Rows)
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
        e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(WBSGrid, "Select$" + e.Row.RowIndex);
        e.Row.ToolTip = "Click to select this row.";
      }
    }

    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {
      foreach (GridViewRow row in WBSGrid.Rows)
      {
        if (row.RowIndex == WBSGrid.SelectedIndex)
        {
          Session["Mat"] = row.Cells[5].Text;
          Session["Dsc"] = row.Cells[6].Text;
          Session["Qty"] = row.Cells[7].Text;
          Session["Uom"] = row.Cells[8].Text;
          Response.Redirect("ShowItem.aspx");
          break;
        }
      }
    }
  }
}