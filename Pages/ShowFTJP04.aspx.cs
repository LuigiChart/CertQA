using Microsoft.IdentityModel.Tokens;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Metrics;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace CertQA
{
  public partial class ShowFTJP04 : System.Web.UI.Page
  {
    static int recordID;
    static int certNr;
    static string material;
    static string matdescription;
    static string matqty;
    static string matuom;
    static string matprc;
    static string order;
    static string orderLin;
    static string customer;
    static string customerName;
    static string marcatura;
    static string tcollaudo;
    static string serialF = "";
    static string serialT = "";
    static string project;

    static SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BUSSQL01Connection"].ConnectionString);
    static SqlCommand cmd = new SqlCommand();
    static string sqlText;
    static List<object> serialList;

    protected void Page_Load(object sender, EventArgs e)
    {

      if (!IsPostBack){
        material = Convert.ToString(Session["Mat"]);
        matdescription = SAPHelper.SAPReadMAKT(material);
        //matdescription = Convert.ToString(Session["Dsc"]);
        //matdescription = matdescription.Replace("&quot;", "\"");
        matqty = Convert.ToString(Session["Qty"]);
        matuom = Convert.ToString(Session["Uom"]);
        matprc = Convert.ToString(Session["Prc"]);
        order = Convert.ToString(Session["Ord01"]);
        orderLin = Convert.ToString(Session["Lin"]);
        customer = Convert.ToString(Session["Cus01"]);
        customerName = Convert.ToString(Session["CusName"]);
        recordID = Convert.ToInt32(Session["Id01"]);
        project = Convert.ToString(Session["Prj01"]);
        //LoadReport();
        lblItemNbr.Text = material.TrimStart('0');
        lblItemDesc.Text = matdescription;
        lblItemQty.Text = matqty;
        lblItemUom.Text = matuom;
        //lblItemPrc.Text = matprc;
        lblOrderNbr.Text = order.TrimStart('0');
        lblOrderLin.Text = orderLin;
        lblCustomerNbr.Text = customer.TrimStart('0');
        lblCustomerName.Text = customerName;
        //savRecordId.Text = recordID.ToString();

        cmd.CommandType = System.Data.CommandType.Text;
        if (recordID > 0)
        {
          cmd.CommandText = "SELECT * FROM dbo.GENERAL WHERE Id = " + recordID;
        }
        else
        {
          cmd.CommandText = "SELECT * FROM dbo.GENERAL WHERE KUNNR = '" + customer
                    + "' AND VBELN = '" + order.TrimStart('0')
                    + "' AND POSNR = " + orderLin;
        }
        cmd.Connection = conn;
        conn.Open();
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
          while (reader.Read())
          {
            recordID = Convert.ToInt32(reader["Id"]);
            savRecordId.Text = recordID.ToString();
            lblCertificateNr.Text = Convert.ToInt32(reader["CERT"]).ToString("00/0000000");
            DateTime test01 = Convert.ToDateTime(reader["DATCER"]);
            lblCertDataDat.Text = test01.ToString("yyyy-MM-dd"); 
            lblTipoCollaudoCode.Text = reader["TCOLLAUDO"].ToString();
            lblMatricolaFromValue.Text = reader["ANZSNF"].ToString();
            lblMatricolaToValue.Text = reader["ANZSNT"].ToString();
            inpMarcatura.Value = reader["MARC"].ToString();
// get serial from - to
            serialF = lblMatricolaFromValue.Text;
            serialT = lblMatricolaToValue.Text;
            marcatura = inpMarcatura.Value;
          }
        }
        // if no record is returned, then create an empty one
        else
        {
          reader.Close();
          if (recordID == 0) // only if we are not coming from direct
          {
            // generate a new certificate number (last + 1 for current year)
            int certNrMin = (DateTime.Now.Year - 2000) * 10000000;
            int certNrMax = ((DateTime.Now.Year - 2000) * 10000000) + 9999999;
            cmd.CommandText = "SELECT MAX(CERT) MXCERT FROM dbo.GENERAL WHERE CERT BETWEEN " + certNrMin + " AND " + certNrMax;
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
              while (reader.Read())
              {
                var sqlValue = reader["MXCERT"];
                if (sqlValue == DBNull.Value)
                {
                  certNr = certNrMin + 1;
                  lblCertificateNr.Text = certNr.ToString("00/0000000");
                }
                else
                {
                  certNr = Convert.ToInt32(reader["MXCERT"]);
                  certNr = certNr + 1;
                  lblCertificateNr.Text = certNr.ToString("00/0000000");
                }
              }
            }
            else
            {
              certNr = certNrMin + 1;
              lblCertificateNr.Text = certNr.ToString("00/0000000");
            }
            reader.Close();
            string actDate = DateTime.Now.ToString("yyyy-MM-dd");
            string actDateTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            // retrieve serials
            serialF = "";
            serialT = "";
            string objectNr = SAPHelper.SAPReadSER02(order, orderLin);
            if (objectNr != "")
            {
              serialList = SAPHelper.GetSerials(objectNr);
              if (serialList.Count == 0)
              {
                Response.Write("<script>alert('No serial numbers found in Serials')</script>");
              }
              else
              {
                foreach (string serial in serialList)
                {
                  if(string.IsNullOrEmpty(serialF)){
                    serialF = serial.Trim('0');
                    lblMatricolaFromValue.Text = serialF;
                  }
                  serialT = serial.Trim('0');
                  lblMatricolaToValue.Text = serialT;
                }
                cmd.CommandText = "INSERT INTO dbo.GENERAL (CERT,DATCER,KUNNR,VBELN,POSNR,MATNR,ARKTX,MEINS,KWMENG,DELQTY,NETPR,IVA,STOCK,PROJECT,TCOLLAUDO,ANZSNF,ANZSNT,MARC,UPDATED) "
                  + " VALUES(" + certNr + ",'" + actDateTime + "','" + customer + "','" + order.TrimStart('0') + "','" + orderLin + "','" + material + "','" + matdescription + "','"
                  + matuom + "'," + matqty + ", 0," + matprc + ",0,0,'" + project + "','','" + serialF + "','" + serialT +"','','" + actDateTime + "');SELECT SCOPE_IDENTITY();";
                recordID = Convert.ToInt32(cmd.ExecuteScalar());
                savRecordId.Text = recordID.ToString();
                lblTipoCollaudoCode.Text = "";
                inpMarcatura.Value = "";
                //cmd.CommandText = "INSERT INTO dbo.COLLAUDO (Id,PROVA,BPIDRO,SERIE,UGELLO,CORPO,PULSTD,PULOSS,PRVTBA,BPTARA,PRVTUG,FLUIDO,DATISP,PRESPV,PERCTA,PERAMM,PERRIL,CTRVIS,COFEMA,DATCFE,DATCRV,COCLNT,DATCCL,UPDATED) "
                //+ "VALUES(" + recordID + ",'','','','','','','','','','','','" + actDate + "','',0,0,0,'','','" + actDate + "','" + actDate + "','','" + actDate + "','" + actDateTime + "')";
                cmd.CommandText = "INSERT INTO dbo.COLLAUDO (Id,PROVA,BPIDRO,SERIE,UGELLO,CORPO,PULSTD,PULOSS,PRVTBA,BPTARA,PRVTUG,FLUIDO,DATISP,PRESPV,PERCTA,PERAMM,PERRIL,CTRVIS,COFEMA,DATCFE,DATCRV,COCLNT,DATCCL,UPDATED) "
                + "VALUES(" + recordID + ",'','','','','','','','','','','','" + "1900-01-01" + "','',0,0,0,'','','" + "1900-01-01" + "','" + "1900-01-01" + "','','" + "1900-01-01" + "','" + actDateTime + "')";
                int rowsAffected = cmd.ExecuteNonQuery();
                // now add entry to SERIALS for each single serial of line
                foreach (string serial in serialList)
                {
                  cmd.CommandText = "INSERT INTO dbo.SERIALS (Id,SERIAL,UPDATED) "
                  + "VALUES(" + recordID + ",'" + serial + "','" + actDateTime + "')";
                  rowsAffected = cmd.ExecuteNonQuery();
                }
              }
            }
            else
            {
              Response.Write("<script>alert('No serial numbers found in SER02')</script>");
            }
          }
        conn.Close();
        }
      }
    }
    protected void ButtonOK_Click(object sender, EventArgs e)
    {
      marcatura = Request.Form["inpMarcatura"];
      string actDateTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
      cmd.CommandType = System.Data.CommandType.Text;
      cmd.CommandText = "UPDATE dbo.GENERAL SET MARC = '" + marcatura + "', UPDATED = '" + actDateTime
          + "' WHERE KUNNR = '" + customer
          + "' AND VBELN = '" + order.TrimStart('0')
          + "' AND POSNR = " + orderLin;
      cmd.Connection = conn;
      conn.Open();
      int rowsAffected = cmd.ExecuteNonQuery();
      conn.Close();
    }
    protected void ButtonOrder_Click(object sender, EventArgs e)
    {
      Response.Redirect("ShowSingleOrder.aspx");
    }
    protected void ButtonCollaudo_Click(object sender, EventArgs e)
    {
      //Session["RId"] = savRecordId.Text;
      Session["RId"] = recordID;
      Session["SeF"] = serialF;
      Session["SeT"] = serialT;
      Session["Cert"] = lblCertificateNr.Text;
      Session["CertDat"] = lblCertDataDat.Text;
      Response.Redirect("ShowCollaudo.aspx");
    }
    //private void LoadReport()
    //{

    //  sqlText = "SELECT * FROM GENERAL a JOIN COLLAUDO b on b.Id = a.Id WHERE KUNNR='" +
    //          customer + "' AND VBELN='" + order + "' AND POSNR='" + orderLin + "'";
    //  SqlCommand cmd = new SqlCommand(sqlText, conn);
    //  SqlDataAdapter da = new SqlDataAdapter(cmd);
    //  DataTable dt = new DataTable();
    //  da.Fill(dt);

    //  // ReportViewer setup
    //  ReportViewer1.ProcessingMode = ProcessingMode.Local;
    //  ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/datareport.rdlc");

    //  ReportDataSource rds = new ReportDataSource("DataSet1", dt);
    //  ReportViewer1.LocalReport.DataSources.Clear();
    //  ReportViewer1.LocalReport.DataSources.Add(rds);
    //  ReportViewer1.LocalReport.Refresh();

    //}
  }
}