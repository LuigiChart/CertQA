using Microsoft.IdentityModel.Tokens;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Metrics;
using System.Runtime.InteropServices;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Text.RegularExpressions;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Xml;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ToolTip;

namespace CertQA
{
  public partial class ShowFTJP02 : System.Web.UI.Page
  {
    static string _ENV;
    static int recordID;
    static string serialF = "";
    static string serialT = "";
    static string orderNr;
    static string orderLin;
    static string classe;
    static string orderERDAT = "";
    static string orderEDATU = "";

    static SqlConnection conn;
    static SqlCommand cmd = new SqlCommand();

    protected void Page_Load(object sender, EventArgs e)
    {

      string savSerie = "";
      string savSerieTrim = "";
      string savValveType = "";
      string savInletClass = "";
      string savInletSize = "";
      string savInletType = "";
      string savOutletClass = "";
      string savOutletSize = "";
      string savOutletType = "";
      string savOreficeLetter = "";
      string savSeatMtl = "";
      string savSpringMtl = "";
      string savLift = "";
      string savFamily = "";
      string Charge = "";

      if (!IsPostBack){
        _ENV = Convert.ToString(Session["ENV"]);
        recordID = Convert.ToInt32(Session["Id01"]);
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
        if(orderNr != "0") {
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
              lblSiglaVal.Text = order.ZZTAG.Replace("'", " ");
              lblSigla2Val.Text = order.ZZTAG.Replace("'", " ");
              lblControPressTVal.Text = order.ZZPRETOT.Replace("'", " ");
              lblControPressT1Val.Text = order.ZZPRETOT.Replace("'", " ");
              lblControPressIVal.Text = order.ZZPRESET.Replace("'", " ");
              lblControPressGVal.Text = order.ZZPREGEN.Replace("'", " ");
              savSpringMtl = order.ZZSPRING.Replace("'", " ");
              lblTaraturaNomVal.Text = order.ZZTARNOR.Replace("'", " ");
              lblTaratureMollaVal.Text = order.ZZPREMOL.Replace("'", " ");
              lblTaraturaBVal.Text = order.ZZTARBAN.Replace("'", " ");
              lblFluidGroupVal.Text = order.ZZGRPFLD.Replace("'", " ");
              lblFluidoScaricoVal.Text = order.ZZDISFLD.Replace("'", " ");
              lblStatoFisicoVal.Text = order.ZZSTATE.Replace("'", " ");
              lblTempScaricoVal.Text = order.ZZDISTEMP.Replace("'", " ");
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
              lblCommessaNbr.Text = "";
              lblPosNbr.Text = "";
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
              btOrder.Visible = false;
            }
          }
        }

        // retrieve material class
//        classe = SAPHelper.GetMaterialClass(lblItemNbr.Text);
        List<object> matChar = SAPHelper.GetClassCharacteristics(classe, lblItemNbr.Text);
        // assign characteristic to screen fields
        foreach (MClass Characteristic in matChar)
        {
          switch (Characteristic.CNAME)
          {
            case "VALVE_FAMILY":
              savFamily = Characteristic.CVALUE.Replace("'", " ");
              break;
            case "VALVE_SERIE":
              savSerie = Characteristic.CVALUE.Replace("'", " ");
              break;
            case "VALVE_SERIE_TRIM":
              savSerieTrim = Characteristic.CVALUE.Replace("'", " ");
              break;
            case "VALVE_TYPE":
              savValveType = Characteristic.CVALUE.Replace("'", " ");
              break;
            case "INLET_CLASS_THREAD":
              savInletClass = Characteristic.CVALUE.Replace("'", " ");
              break;
            case "INLET_SIZE":
              savInletSize = Characteristic.CVALUE.Replace("'", " ");
              break;
            case "INLET_TYPE":
              savInletType = Characteristic.CVALUE.Replace("'", " ");
              break;
            case "OUTLET_CLASS_THREAD":
              savOutletClass = Characteristic.CVALUE.Replace("'", " ");
              break;
            case "OUTLET_SIZE":
              savOutletSize = Characteristic.CVALUE.Replace("'", " ");
              break;
            case "OUTLET_TYPE":
              savOutletType = Characteristic.CVALUE.Replace("'", " ");
              break;
            case "TEMP_RANGE":
              lblCampoVal.Text = Characteristic.CVALUE.Replace("'", " ");
              lblCampo2Val.Text = Characteristic.CVALUE.Replace("'", " ");
              break;
            case "BODY_MTL":
              lblCorpoVal.Text = Characteristic.CVALUE.Replace("'", " ");
              lblCorpo2Val.Text = Characteristic.CVALUE.Replace("'", " ");
              break;
            case "NOZZLE_MTL":
              lblUgelloVal.Text = Characteristic.CVALUE.Replace("'", " ");
              lblUgello2Val.Text = Characteristic.CVALUE.Replace("'", " ");
              break;
            case "DISC_COEFF_GAS":
              lblCoefKGASVal.Text = Characteristic.CVALUE.Replace("'", " ");
              lblCoefKGAS2Val.Text = Characteristic.CVALUE.Replace("'", " ");
              break;
            case "DISC_COEFF_LIQ":
              lblCoefKliqVal.Text = Characteristic.CVALUE.Replace("'", " ");
              lblCoefKliq2Val.Text = Characteristic.CVALUE.Replace("'", " ");
              break;
            case "ORIFICE_DIA_MM":
              lblDiametroVal.Text = Characteristic.CVALUE.Replace("'", " ");
              break;
            case "AREA_CM2":
              lblAreaVal.Text = Characteristic.CVALUE.Replace("'", " ");
              break;
            case "OVERPRESSURE":
              lblSovrapressioneVal.Text = Characteristic.CVALUE.Replace("'", " ");
              break;
            case "BLOWDOWN":
              lblScartoVal.Text = Characteristic.CVALUE.Replace("'", " ");
              break;
            case "STELLITE_SEAT_NOZZLE":
              lblStelliteUVal.Text = Characteristic.CVALUE.Replace("'", " ");
              break;
            case "STELLITE_SEAT_DISC":
              lblStelliteOVal.Text = Characteristic.CVALUE.Replace("'", " ");
              break;
            case "BONNET_MTL":
              lblCappelloVal.Text = Characteristic.CVALUE.Replace("'", " ");
              break;
            case "DISC_MTL":
              lblOtturatoreVal.Text = Characteristic.CVALUE.Replace("'", " ");
              break;
            case "BELLOWS":
              lblSoffiettoVal.Text = Characteristic.CVALUE.Replace("'", " ");
              break;
            case "OREFICE_LETTER":
              savOreficeLetter = Characteristic.CVALUE.Replace("'", " ");
              break;
            case "SEAT_SOFT_MTL":
              savSeatMtl = Characteristic.CVALUE.Replace("'", " ");
              break;
            case "SPRING_MTL":
              lblMollaVal.Text = Characteristic.CVALUE.Replace("'", " ");
              break;
            case "LIFT":
              savLift = Characteristic.CVALUE.Replace("'", " ");
              break;
          }
        }
        lblSerieVal.Text = savValveType + " " + savSerie + " " + savSerieTrim; //VALVE_SERIE VALVE_SERIE_TRIM VALVE_TYPE
        lblSerie2Val.Text = savValveType + " " + savSerie + " " + savSerieTrim;
        lblIngressoVal.Text = savInletClass + " " + savInletSize + " " + savInletType;  //INLET_CLASS_THREAD INLET_SIZE INLET_TYPE
        lblIngresso2Val.Text = savInletClass + " " + savInletSize + " " + savInletType;  //INLET_CLASS_THREAD INLET_SIZE INLET_TYPE
        lblUscitaVal.Text = savOutletClass + " " + savOutletSize + " " + savOutletType;  //OUTLET_CLASS_THREAD OUTLET_SIZE OUTLET_TYPE
        lblUscita2Val.Text = savOutletClass + " " + savOutletSize + " " + savOutletType;  //OUTLET_CLASS_THREAD OUTLET_SIZE OUTLET_TYPE
        lblMolla1Val.Text = savSpringMtl + " " + lblMollaVal.Text;
        lblMolla2Val.Text = savSpringMtl + " " + lblMollaVal.Text;
        // update General with characteristics
        cmd.CommandText = "UPDATE dbo.GENERAL SET "
        + "AREA_CM2 = '" + lblAreaVal.Text + "',LIFT = '" + savLift + "',ORIFICE_DIA_MM = '" + lblDiametroVal.Text + "',BELLOWS = '" + lblSoffiettoVal.Text + "',BLOWDOWN = '" + lblScartoVal.Text
        + "',BODY_MTL = '" + lblCorpoVal.Text + "',BONNET_MTL = '" + lblCappelloVal.Text + "',DISC_COEFF_GAS = '" + lblCoefKGASVal.Text + "',DISC_COEFF_LIQ = '" + lblCoefKliqVal.Text
        + "',DISC_MTL = '" + lblOtturatoreVal.Text + "',INLET_CLASS_THREAD = '" + savInletClass + "',INLET_SIZE = '" + savInletSize + "',INLET_TYPE = '" + savInletType
        + "',NOZZLE_MTL = '" + lblUgelloVal.Text + "',OREF_LETTER = '" + savOreficeLetter + "',OUTLET_CLASS_THREAD = '" + savOutletClass + "',OUTLET_SIZE = '" + savOutletSize
        + "',OUTLET_TYPE = '" + savOutletType + "',OVERPRESSURE = '" + lblSovrapressioneVal.Text + "',SEAT_SOFT_MTL = '" + savSeatMtl + "',SPRING_MTL = '" + lblMollaVal.Text
        + "',STELLITE_SEAT_DISC = '" + lblStelliteOVal.Text + "',STELLITE_SEAT_NOZZLE = '" + lblStelliteUVal.Text + "',TEMP_RANGE = '" + lblCampoVal.Text + "',VALVE_FAMILY = '" + savFamily
        + "',VALVE_SERIE = '" + savSerie + "',VALVE_SERIE_TRIM = '" + savSerieTrim + "',VALVE_TYPE = '" + savValveType
        + "' WHERE Id = " + recordID;
        cmd.Connection = conn;
        conn.Open();
        int rowsAffected = cmd.ExecuteNonQuery();
        conn.Close();
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
    protected void ButtonNext_Click(object sender, EventArgs e)
    {
      Session["Id01"] = recordID;
      Session["SeF"] = serialF;
      Session["SeT"] = serialT;
      Response.Redirect("ShowFTJP03.aspx");
    }
  }
}