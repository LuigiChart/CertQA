using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Drawing2D;
using System.Text;
using System.Web.UI.WebControls;

namespace CertQA
{
  public partial class ShowFTJP03 : System.Web.UI.Page
  {
    static string _ENV;
    static int recordID;
    static string orderNr;
    static string orderLin;
    static string serialF = "";
    static string serialT = "";
    static string orderERDAT = "";
    static string orderEDATU = "";
    static string lineType = "";
    static string classe = "";

    static SqlConnection conn;
    static SqlCommand cmd = new SqlCommand();

    protected void Page_Load(object sender, EventArgs e)
    {

      string Charge = "";
      if (!IsPostBack){
        _ENV = Convert.ToString(Session["ENV"]);
        recordID = Convert.ToInt32(Session["Id01"]);
        lineType = Convert.ToString(Session["LnTyp"]);
        classe = Convert.ToString(Session["Class"]);
        lblClass.Text = classe;
        if (_ENV == "PRD")
        {
          conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BUSSQL01ConnectionPRD"].ConnectionString);
        }
        else
        {
          conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BUSSQL01Connection"].ConnectionString);
        }

        // first retrieve order from FTJP
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.CommandText = "SELECT * FROM dbo.FTJP WHERE Id = " + recordID;
        cmd.Connection = conn;
        if (conn.State != ConnectionState.Open)
        {
          conn.Close();
          conn.Open();
        }
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
          while (reader.Read())
          {
            orderNr = Convert.ToString(reader["VBELN"]).Trim();
            orderLin = Convert.ToString(reader["POSNR"]).Trim();
            Charge = Convert.ToString(reader["AUFNR"]).Trim();
          }
        }
        conn.Close();
        reader.Close();

        // retrieve serials
        serialF = Convert.ToString(Session["SeF"]);
        serialT = Convert.ToString(Session["SeT"]);

        lblMatricolaFromValue.Text = serialF;
        lblMatricolaToValue.Text = serialT;
        
        // Get missing order line data
        if (orderNr != "0")
        {
          List<object> orderList = SAPHelper.GetOrderDetailF007(orderNr, orderLin, "");
          if (orderList.Count > 0)
          {
            foreach (F007 order in orderList)
            {
              lblCommessaNbr.Text = orderNr;
              lblPosNbr.Text = orderLin;
              lblCustomerNbr.Text = order.KUNNR.TrimStart('0').Trim();
              lblCustomerName.Text = order.NAME1.Replace("'", " ");
              //if (order.KDMAT != "")
              //{
              //  lblItemNbr.Text = order.KDMAT.TrimStart('0').Trim();
              //  lblItemDesc.Text = SAPHelper.SAPReadMAKT(order.KDMAT); //.Replace("\"","&quot;");
              //}
              //else
              //{
              lblItemNbr.Text = order.MATNR.TrimStart('0').Trim();
              lblItemDesc.Text = order.DESCRIPTION.Trim().Replace("'", " ");//.Replace("\"","&quot;");
              //}
              lblItemQty.Text = order.KWMENG;
              lblOrderNbr.Text = order.BSTKD.Replace("'", " ");
              lblITPVal.Text = order.ZZITP;
              lblQPVal.Text = order.ZZQP;
              lblOdPVal.Text = order.AUFNR.Replace("'", " ");
              orderERDAT = order.ERDAT; // order date
              lblDocDatedmy.Text = order.ERDAT.Substring(6, 2) + "." + order.ERDAT.Substring(4, 2) + "." + order.ERDAT.Substring(0, 4);
              orderEDATU = order.EDATU; // delivery date
              lblDelDateVal.Text = order.EDATU.Substring(6, 2) + "." + order.EDATU.Substring(4, 2) + "." + order.EDATU.Substring(0, 4);
            }
          }
        }
        else
        {
          List<object> orderList = SAPHelper.GetProductionOrderDetail(Charge);
          if (orderList.Count > 0)
          {
            foreach (AFPO order in orderList)
            {
              lblCustomerNbr.Text = "";
              lblCustomerName.Text = "";
              lblOrderNbr.Text = "";
              lblCommessaNbr.Text = "";
              lblPosNbr.Text = "";
              lblDelDateVal.Text = "";
              lblITPVal.Text = "";
              lblQPVal.Text = "";
              orderERDAT = order.GSBTR; // order date
              lblDocDatedmy.Text = order.GSBTR.Substring(6, 2) + "." + order.GSBTR.Substring(4, 2) + "." + order.GSBTR.Substring(0, 4);
              lblItemNbr.Text = order.MATNR.TrimStart('0').Trim();
              lblItemDesc.Text = order.DESCRIPTION.Trim().Replace("'", " ");
              lblItemQty.Text = order.VFMNG;
              lblOdPVal.Text = order.AUFNR.Trim();
              btNext.Visible = false;
            }
          }
        }

        // Build HTML table rows dynamically
        List<string> txtLines = SAPHelper.GetOrderText(orderNr, orderLin, "ZFTJ");
        StringBuilder tableRows = new StringBuilder();
        tableRows.Append("<table>");
          foreach (string lineTxt in txtLines)
          {
            tableRows.Append("<tr>");
            tableRows.Append($"<td>{lineTxt}</td>");
            tableRows.Append("</tr>");
          }
        tableRows.Append("</table>");
        // Inject rows into the table body
        //tableBody.InnerHtml = tableRows.ToString();
        PlaceHolder1.Controls.Add(new Literal { Text = tableRows.ToString() });
      }
    }
    protected void ButtonStart_Click(object sender, EventArgs e)
    {
      Response.Redirect("Default.aspx");
    }
    protected void ButtonOrder_Click(object sender, EventArgs e)
    {
      Response.Redirect("ShowSingleOrder.aspx");
    }
    protected void ButtonQC_Click(object sender, EventArgs e)
    {
      Session["Id01"] = recordID;
      Session["SeF"] = serialF;
      Session["SeT"] = serialT;
      switch (classe)
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
          Response.Write("<script>alert('Invalid material class')</script>");
          break;
      }
    }
  }
}