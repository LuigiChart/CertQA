using Microsoft.Ajax.Utilities;
//using Microsoft.Data.SqlClient;
using Microsoft.Reporting.WebForms;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Runtime.ConstrainedExecution;
using System.Runtime.InteropServices;
using System.Web.Configuration;
using System.Web.Services.Description;
using System.Windows.Forms;
using System.Xml;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ToolTip;


namespace CertQA
{
  public partial class ShowSafety : System.Web.UI.Page
  {
    static string _ENV;
    static int recordID;
    static string certNr;
    static string orderNr;
    static string orderLin;
    static string serialF;
    static string serialT;
    static string classe;
    static string orderERDAT = "";
    static string orderEDATU = "";
    static string savFamily = "";
    static string savInletClass = "";
    static string savOutletClass = "";
    static int maxPerdita = 0;
    static string stampBy = "P";
    static string revision = "N";
    static string hlpInpDate1 = "";
    static string hlpInpDate2 = "";

    static SqlConnection conn;
    static SqlCommand cmd = new SqlCommand();
    static string sqlText;
    static List<object> serialList;

    protected void Page_Load(object sender, EventArgs e)
    {
      string matMeins = "";
      string SiglaVal = "";
      string ControPressT = "";
      string ControPressI = "";
      string ControPressG = "";
      string Molla = "";
      string TaraturaNom = "";
      string TaratureMolla = "";
      string TaraturaB = "";
      string FluidGroup = "";
      string FluidoScarico = "";
      string StatoFisico = "";
      string TempScarico = "";
      int serialQty = 0;
      int serialCtr = 0;
      int serialInd = 0;
      string serialStr = "";
      string serialEnd = "";
      string[] serials = new string[12];
      string savSerie = "";
      string savSerieTrim = "";
      string savValveType = "";
      string savInletSize = "";
      string savInletType = "";
      string savOutletSize = "";
      string savOutletType = "";
      string savClasseP = "";
      string savOreficeLetter = "";
      string savSeatMtl = "";
      string savLift = "";
      string savCampoVal = "";
      string savCorpoVal = "";
      string savUgelloVal = "";
      string savCoefKGASVal = "";
      string savCoefKliqVal = "";
      string savDiametroVal = "";
      string savAreaVal = "";
      string savSovrapressioneVal = "";
      string savScartoVal = "";
      string savStelliteUVal = "";
      string savStelliteOVal = "";
      string savCappelloVal = "";
      string savOtturatoreVal = "";
      string savSoffiettoVal = "";
      string savMollaVal = "";
      string bancoI = "";
      string bancoT = "";
      string collName = "";
      string Charge = "";
      DateTime dataTenuta = DateTime.Now;

      if (!IsPostBack){
        _ENV = Convert.ToString(Session["ENV"]);
        orderNr = Convert.ToString(Session["Ord01"]);
        orderLin = Convert.ToString(Session["Lin"]);
        Charge = Convert.ToString(Session["Charg"]);
        recordID = Convert.ToInt32(Session["Id01"]);
        classe = Convert.ToString(Session["Class"]);
        lblClass.Text = classe;
        maxPerdita = 0;
        if (_ENV == "PRD")
        {
          conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BUSSQL01ConnectionPRD"].ConnectionString);
        }
        else
        {
          conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BUSSQL01Connection"].ConnectionString);
        }

        string actDate = DateTime.Now.ToString("yyyy-MM-dd");
        string actDateTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        cmd.CommandType = System.Data.CommandType.Text;
        // do we have FTJP? If yes, recover Id, otherwise create one
        if (recordID > 0) // this means we have already an FTJP
        {
          // retrieve order from FTJP
          cmd.CommandText = "SELECT * FROM dbo.FTJP WHERE Id = " + recordID;
        }
        else
        {
          // check FTJP with order
          cmd.CommandText = "SELECT * FROM dbo.FTJP WHERE VBELN = '" + orderNr.TrimStart('0') + "' AND POSNR = " + orderLin;
        }
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
            orderNr = reader["VBELN"].ToString();
            orderLin = reader["POSNR"].ToString();
            serialF = reader["ANZSNF"].ToString();
            serialT = reader["ANZSNT"].ToString();
            collName = reader["USERNAME"].ToString();
            bancoI = reader["PIDROBA"].ToString();
            bancoT = reader["PTENUBA"].ToString();
            dataTenuta = Convert.ToDateTime(reader["PTENUDT"]);
            recordID = Convert.ToInt32(reader["Id"]);
            // get the max lost bubbles
            if (Convert.ToInt32(reader["S01_BOLLE"]) > maxPerdita) { maxPerdita = Convert.ToInt32(reader["S01_BOLLE"]); }
            if (Convert.ToInt32(reader["S02_BOLLE"]) > maxPerdita) { maxPerdita = Convert.ToInt32(reader["S02_BOLLE"]); }
            if (Convert.ToInt32(reader["S03_BOLLE"]) > maxPerdita) { maxPerdita = Convert.ToInt32(reader["S03_BOLLE"]); }
            if (Convert.ToInt32(reader["S04_BOLLE"]) > maxPerdita) { maxPerdita = Convert.ToInt32(reader["S04_BOLLE"]); }
            if (Convert.ToInt32(reader["S05_BOLLE"]) > maxPerdita) { maxPerdita = Convert.ToInt32(reader["S05_BOLLE"]); }
            if (Convert.ToInt32(reader["S06_BOLLE"]) > maxPerdita) { maxPerdita = Convert.ToInt32(reader["S06_BOLLE"]); }
            if (Convert.ToInt32(reader["S07_BOLLE"]) > maxPerdita) { maxPerdita = Convert.ToInt32(reader["S07_BOLLE"]); }
            if (Convert.ToInt32(reader["S08_BOLLE"]) > maxPerdita) { maxPerdita = Convert.ToInt32(reader["S08_BOLLE"]); }
            if (Convert.ToInt32(reader["S09_BOLLE"]) > maxPerdita) { maxPerdita = Convert.ToInt32(reader["S09_BOLLE"]); }
            if (Convert.ToInt32(reader["S10_BOLLE"]) > maxPerdita) { maxPerdita = Convert.ToInt32(reader["S10_BOLLE"]); }
            if (Convert.ToInt32(reader["S11_BOLLE"]) > maxPerdita) { maxPerdita = Convert.ToInt32(reader["S11_BOLLE"]); }
            if (Convert.ToInt32(reader["S12_BOLLE"]) > maxPerdita) { maxPerdita = Convert.ToInt32(reader["S12_BOLLE"]); }
          }
        }
        else
        {
          reader.Close();
          // retrieve serials and create FTJP

          // retrieve serials
          serialF = "";
          serialT = "";
          string objectNr = SAPHelper.SAPReadSER02(orderNr, orderLin);
          if (objectNr != "")
          {
            serialList = SAPHelper.GetSerials(objectNr);
            // Clear the entire array
            Array.Clear(serials, 0, serials.Length);
            serialCtr = 0;
            if (serialList.Count == 0)
            {
              Response.Write("<script>alert('No serial numbers found in OBJK')</script>");
            }
            else
            {
              serialQty = serialList.Count;
              foreach (string serial in serialList)
              {
                serialCtr++;
                if (string.IsNullOrEmpty(serialF))
                {
                  serialF = serial.TrimStart('0');
                }
                serialT = serial.TrimStart('0');
                // create groups if more than 12
                if (serialStr == "")
                {
                  serialStr = serial.TrimStart('0');
                }
                serialEnd = serial.TrimStart('0');
                if (serialQty > 100)
                {
                  serialInd = serialCtr / 20;
                  if ((serialCtr % 20) > 0 || serialCtr == serialQty)
                  {
                    serials[serialInd - 1] = serialStr + " - " + serialEnd;
                    serialStr = "";
                    serialEnd = "";
                  }
                }
                else
                {
                  if (serialQty > 50)
                  {
                    serialInd = serialCtr / 10;
                    if ((serialCtr % 10) > 0 || serialCtr == serialQty)
                    {
                      serials[serialInd - 1] = serialStr + " - " + serialEnd;
                      serialStr = "";
                      serialEnd = "";
                    }
                  }
                  else
                  {
                    if (serialQty > 10)
                    {
                      serialInd = serialCtr / 5;
                      if ((serialCtr % 5) > 0 || serialCtr == serialQty)
                      {
                        serials[serialInd - 1] = serialStr + " - " + serialEnd;
                        serialStr = "";
                        serialEnd = "";
                      }
                    }
                    else
                    {
                      serials[serialCtr - 1] = serial.TrimStart('0');
                    }
                  }
                }
              }
            }
          }
          else
          {
            Response.Write("<script>alert('No serial numbers found in SER02')</script>");
          }

          // before creating FTJP we need to check if there is not already an FTJP for the production order related to the sales order (CHARGE)
          cmd.CommandText = "SELECT * FROM dbo.FTJP WHERE VBELN = '0' AND POSNR = 0 AND AUFNR = '" + Charge.TrimStart('0') + "'";
          reader = cmd.ExecuteReader();
          if (reader.HasRows)
          {
            while (reader.Read())
            {
              // if exists, use it as template for new order related FTJP
              // as Cristina does not really review the FTJP and we automatically extract values from it for certificate
              // we will keep all serial and related tests in detail
              recordID = Convert.ToInt32(reader["Id"]);
              collName = reader["USERNAME"].ToString();
              bancoI = reader["PIDROBA"].ToString();
              bancoT = reader["PTENUBA"].ToString();
              dataTenuta = Convert.ToDateTime(reader["PTENUDT"]);
              // get the max lost bubbles
              if (Convert.ToInt32(reader["S01_BOLLE"]) > maxPerdita) { maxPerdita = Convert.ToInt32(reader["S01_BOLLE"]); }
              if (Convert.ToInt32(reader["S02_BOLLE"]) > maxPerdita) { maxPerdita = Convert.ToInt32(reader["S02_BOLLE"]); }
              if (Convert.ToInt32(reader["S03_BOLLE"]) > maxPerdita) { maxPerdita = Convert.ToInt32(reader["S03_BOLLE"]); }
              if (Convert.ToInt32(reader["S04_BOLLE"]) > maxPerdita) { maxPerdita = Convert.ToInt32(reader["S04_BOLLE"]); }
              if (Convert.ToInt32(reader["S05_BOLLE"]) > maxPerdita) { maxPerdita = Convert.ToInt32(reader["S05_BOLLE"]); }
              if (Convert.ToInt32(reader["S06_BOLLE"]) > maxPerdita) { maxPerdita = Convert.ToInt32(reader["S06_BOLLE"]); }
              if (Convert.ToInt32(reader["S07_BOLLE"]) > maxPerdita) { maxPerdita = Convert.ToInt32(reader["S07_BOLLE"]); }
              if (Convert.ToInt32(reader["S08_BOLLE"]) > maxPerdita) { maxPerdita = Convert.ToInt32(reader["S08_BOLLE"]); }
              if (Convert.ToInt32(reader["S09_BOLLE"]) > maxPerdita) { maxPerdita = Convert.ToInt32(reader["S09_BOLLE"]); }
              if (Convert.ToInt32(reader["S10_BOLLE"]) > maxPerdita) { maxPerdita = Convert.ToInt32(reader["S10_BOLLE"]); }
              if (Convert.ToInt32(reader["S11_BOLLE"]) > maxPerdita) { maxPerdita = Convert.ToInt32(reader["S11_BOLLE"]); }
              if (Convert.ToInt32(reader["S12_BOLLE"]) > maxPerdita) { maxPerdita = Convert.ToInt32(reader["S12_BOLLE"]); }
              reader.Close();
              cmd.CommandText = "INSERT INTO dbo.FTJP (VBELN,POSNR,ANZSNF,ANZSNT,USERNAME,"
              + "CC1_COLATA,CC1_MATERIALE,CC1_MATRICOLA,CC2_COLATA,CC2_MATERIALE,CC2_MATRICOLA,CE1_COLATA,CE1_MATERIALE,CE1_MATRICOLA,"
              + "CE2_COLATA,CE2_MATERIALE,CE2_MATRICOLA,OT1_COLATA,OT1_MATERIALE,OT1_MATRICOLA,OT2_COLATA,OT2_MATERIALE,OT2_MATRICOLA,"
              + "UG1_COLATA,UG1_MATERIALE,UG1_MATRICOLA,UG2_COLATA,UG2_MATERIALE,UG2_MATRICOLA,ST1_COLATA,ST1_MATERIALE,ST1_MATRICOLA,"
              + "ST2_COLATA,ST2_MATERIALE,ST2_MATRICOLA,MO1_COLATA,MO1_MATERIALE,MO1_MATRICOLA,MO2_COLATA,MO2_MATERIALE,MO2_MATRICOLA,"
              + "S01_SERIAL,S01_PRVIDR,S01_BOLLE,S02_SERIAL,S02_PRVIDR,S02_BOLLE,S03_SERIAL,S03_PRVIDR,S03_BOLLE,S04_SERIAL,S04_PRVIDR,S04_BOLLE,"
              + "S05_SERIAL,S05_PRVIDR,S05_BOLLE,S06_SERIAL,S06_PRVIDR,S06_BOLLE,S07_SERIAL,S07_PRVIDR,S07_BOLLE,S08_SERIAL,S08_PRVIDR,S08_BOLLE,"
              + "S09_SERIAL,S09_PRVIDR,S09_BOLLE,S10_SERIAL,S10_PRVIDR,S10_BOLLE,S11_SERIAL,S11_PRVIDR,S11_BOLLE,S12_SERIAL,S12_PRVIDR,S12_BOLLE,"
              + "PIDROBA,PIDRODT,PTENUBA,PTENUDT,NOTA1,NOTA2,UPDATED,EXECUTED,AUFNR)"
              + "SELECT '" + orderNr + "'," + orderLin + ",'" + serialF + "','" + serialT + "'," + "USERNAME,"
              + "CC1_COLATA, CC1_MATERIALE, CC1_MATRICOLA, CC2_COLATA, CC2_MATERIALE, CC2_MATRICOLA, CE1_COLATA, CE1_MATERIALE, CE1_MATRICOLA,"
              + "CE2_COLATA, CE2_MATERIALE, CE2_MATRICOLA, OT1_COLATA, OT1_MATERIALE, OT1_MATRICOLA, OT2_COLATA, OT2_MATERIALE, OT2_MATRICOLA,"
              + "UG1_COLATA, UG1_MATERIALE, UG1_MATRICOLA, UG2_COLATA, UG2_MATERIALE, UG2_MATRICOLA, ST1_COLATA, ST1_MATERIALE, ST1_MATRICOLA,"
              + "ST2_COLATA, ST2_MATERIALE, ST2_MATRICOLA, MO1_COLATA, MO1_MATERIALE, MO1_MATRICOLA, MO2_COLATA, MO2_MATERIALE, MO2_MATRICOLA,"
              + "S01_SERIAL, S01_PRVIDR, S01_BOLLE, S02_SERIAL, S02_PRVIDR, S02_BOLLE, S03_SERIAL, S03_PRVIDR, S03_BOLLE, S04_SERIAL, S04_PRVIDR, S04_BOLLE,"
              + "S05_SERIAL, S05_PRVIDR, S05_BOLLE, S06_SERIAL, S06_PRVIDR, S06_BOLLE, S07_SERIAL, S07_PRVIDR, S07_BOLLE, S08_SERIAL, S08_PRVIDR, S08_BOLLE,"
              + "S09_SERIAL, S09_PRVIDR, S09_BOLLE, S10_SERIAL, S10_PRVIDR, S10_BOLLE, S11_SERIAL, S11_PRVIDR, S11_BOLLE, S12_SERIAL, S12_PRVIDR, S12_BOLLE,"
              + "PIDROBA, PIDRODT, PTENUBA, PTENUDT, NOTA1, NOTA2,'" + actDateTime + "','" + actDateTime + "','" + Charge.TrimStart('0') + "'" + " FROM dbo.FTJP WHERE Id = " + recordID + "; "
              + " SELECT SCOPE_IDENTITY();";
              recordID = Convert.ToInt32(cmd.ExecuteScalar());
              conn.Close();
              break;
            }
          }
          else
          {
            reader.Close();
            // create FTJP
            cmd.CommandText = "INSERT INTO dbo.FTJP (VBELN,POSNR,USERNAME,ANZSNF,ANZSNT,"
            + "CC1_COLATA,CC1_MATERIALE,CC1_MATRICOLA,CE1_COLATA,CE1_MATERIALE,CE1_MATRICOLA,OT1_COLATA,OT1_MATERIALE,OT1_MATRICOLA,"
            + "UG1_COLATA,UG1_MATERIALE,UG1_MATRICOLA,ST1_COLATA,ST1_MATERIALE,ST1_MATRICOLA,MO1_COLATA,MO1_MATERIALE,MO1_MATRICOLA,"
            + "CC2_COLATA,CC2_MATERIALE,CC2_MATRICOLA,CE2_COLATA,CE2_MATERIALE,CE2_MATRICOLA,OT2_COLATA,OT2_MATERIALE,OT2_MATRICOLA,"
            + "UG2_COLATA,UG2_MATERIALE,UG2_MATRICOLA,ST2_COLATA,ST2_MATERIALE,ST2_MATRICOLA,MO2_COLATA,MO2_MATERIALE,MO2_MATRICOLA,"
            + "S01_SERIAL,S02_SERIAL,S03_SERIAL,S04_SERIAL,S05_SERIAL,S06_SERIAL,S07_SERIAL,S08_SERIAL,S09_SERIAL,S10_SERIAL,S11_SERIAL,S12_SERIAL,"
            + "S01_PRVIDR,S02_PRVIDR,S03_PRVIDR,S04_PRVIDR,S05_PRVIDR,S06_PRVIDR,S07_PRVIDR,S08_PRVIDR,S09_PRVIDR,S10_PRVIDR,S11_PRVIDR,S12_PRVIDR,"
            + "S01_BOLLE,S02_BOLLE,S03_BOLLE,S04_BOLLE,S05_BOLLE,S06_BOLLE,S07_BOLLE,S08_BOLLE,S09_BOLLE,S10_BOLLE,S11_BOLLE,S12_BOLLE,"
            + "PIDROBA,PIDRODT,PTENUBA,PTENUDT,NOTA1,NOTA2,UPDATED,EXECUTED,AUFNR) "
            + " VALUES('" + orderNr + "'," + orderLin + ",'','" + serialF + "','" + serialT + "',"
            + "'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','"
            + serials[0] + "','" + serials[1] + "','" + serials[2] + "','" + serials[3] + "','" + serials[4] + "','" + serials[5] + "','" + serials[6] + "','" + serials[7] + "','" + serials[8] + "','" + serials[9] + "','" + serials[10] + "','" + serials[11] + "',"
            + "'','','','','','','','','','','','',"
            + "0,0,0,0,0,0,0,0,0,0,0,0,"
            + "'','" + actDateTime + "','','" + actDateTime + "','','','" + actDateTime + "','" + actDateTime + "','" + lblOdPVal.Text + "'); SELECT SCOPE_IDENTITY();";
            recordID = Convert.ToInt32(cmd.ExecuteScalar());
          }
        }
        reader.Close();
        lblMatricolaFromValue.Text = serialF;
        lblMatricolaToValue.Text = serialT;
        // At this point we have a recordId and order and serialf/t
        // check SERIAL, if does not exist, then create (we create an entry for each serial, therfore we have to read them all)
        cmd.CommandText = "SELECT * FROM dbo.SERIALS WHERE Id = " + recordID;
        cmd.Connection = conn;
        if (conn.State != ConnectionState.Open)
        {
          conn.Close();
          conn.Open();
        }
        reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
          // do nothing
        }
        else
        {
          if (serialList == null)
          {
            string objectNr = SAPHelper.SAPReadSER02(orderNr, orderLin);
            if (objectNr != "")
            {
              serialList = SAPHelper.GetSerials(objectNr);
            }
          }
          if (serialList != null)
          {
            reader.Close();
            foreach (string serial in serialList)
            {
              cmd.CommandText = "INSERT INTO dbo.SERIALS (Id,SERIAL,UPDATED) VALUES(" + recordID + ",'" + serial.TrimStart('0') + "','" + actDateTime + "')";
              int rowsAffected = cmd.ExecuteNonQuery();
            }
          }
        }
        reader.Close();

        // check GENERAL, if does not exist, then create
        cmd.CommandText = "SELECT * FROM dbo.General WHERE Id = " + recordID;
        cmd.Connection = conn;
        if (conn.State != ConnectionState.Open)
        {
          conn.Close();
          conn.Open();
        }
        reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
          while (reader.Read())
          {
            lblCustomerNbr.Text = reader["KUNNR"].ToString();
            lblCustomerName.Text = reader["NAME1"].ToString();
            lblOrderNbr.Text = reader["BSTKD"].ToString();
            lblCommessaNbr.Text = reader["VBELN"].ToString();
            lblPosNbr.Text = reader["POSNR"].ToString();
            DateTime dob = reader.GetDateTime(reader.GetOrdinal("ERDAT")); // order date
            orderERDAT = dob.ToString("dd.MM.yyyy");
            lblDocDatedmy.Text = orderERDAT;
            dob = reader.GetDateTime(reader.GetOrdinal("EDATU")); // delivery date
            orderEDATU = dob.ToString("dd.MM.yyyy");
            lblDelDateVal.Text = orderEDATU;
            lblItemNbr.Text = reader["MATNR"].ToString();
            lblItemDesc.Text = reader["ARKTX"].ToString();
            lblItemQty.Text = reader["KWMENG"].ToString();
            lblITPVal.Text = reader["ZZITP"].ToString();
            lblQPVal.Text = reader["ZZQP"].ToString();
            lblOdPVal.Text = reader["AUFNR"].ToString();
            TaraturaB = reader["ZZTARBAN"].ToString();
            savFamily = reader["VALVE_FAMILY"].ToString();
            savInletClass = reader["INLET_CLASS_THREAD"].ToString();
            savOutletClass = reader["OUTLET_CLASS_THREAD"].ToString();
            if (savFamily == "2000" || savFamily == "3000")
            {
              savClasseP = savInletClass + " x " + savOutletClass;
            }
            else
            {
              savClasseP = "";
            }
          }

        }
        else
        {
          reader.Close();
          // Get order data
          List<object> orderList = SAPHelper.GetOrderDetailF007(orderNr, orderLin, "");
          foreach (F007 order in orderList)
          {
            lblCustomerNbr.Text = order.KUNNR;
            lblCustomerName.Text = order.NAME1.Replace("'", " ");
            lblOrderNbr.Text = order.BSTKD.Replace("'", " ");
            lblCommessaNbr.Text = orderNr;
            lblPosNbr.Text = orderLin;
            orderERDAT = order.ERDAT;
            lblDocDatedmy.Text = order.ERDAT.Substring(6, 2) + "." + order.ERDAT.Substring(4, 2) + "." + order.ERDAT.Substring(0, 4);
            orderEDATU = order.EDATU;
            lblDelDateVal.Text = order.EDATU.Substring(6, 2) + "." + order.EDATU.Substring(4, 2) + "." + order.EDATU.Substring(0, 4);
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
            lblITPVal.Text = order.ZZITP;
            lblQPVal.Text = order.ZZQP;
            lblOdPVal.Text = order.AUFNR.Replace("'", " ");
            matMeins = order.MEINS;
            SiglaVal = order.ZZTAG.Replace("'", " ");
            ControPressT = order.ZZPRETOT.Replace("'", " ");
            ControPressI = order.ZZPRESET.Replace("'", " ");
            ControPressG = order.ZZPREGEN.Replace("'", " ");
            Molla = order.ZZSPRING.Replace("'", " ");
            TaraturaNom = order.ZZTARNOR.Replace("'", " ");
            TaratureMolla = order.ZZPREMOL.Replace("'", " ");
            TaraturaB = order.ZZTARBAN.Replace("'", " ");
            FluidGroup = order.ZZGRPFLD.Replace("'", " ");
            FluidoScarico = order.ZZDISFLD.Replace("'", " "); 
            StatoFisico = order.ZZSTATE.Replace("'", " ");
            TempScarico = order.ZZDISTEMP.Replace("'", " ");
          }
          // retrieve material class
//          classe = SAPHelper.GetMaterialClass(lblItemNbr.Text);
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
                savCampoVal = Characteristic.CVALUE.Replace("'", " ");
                break;
              case "BODY_MTL":
                savCorpoVal = Characteristic.CVALUE.Replace("'", " ");
                break;
              case "NOZZLE_MTL":
                savUgelloVal = Characteristic.CVALUE.Replace("'", " ");
                break;
              case "DISC_COEFF_GAS":
                savCoefKGASVal = Characteristic.CVALUE.Replace("'", " ");
                break;
              case "DISC_COEFF_LIQ":
                savCoefKliqVal = Characteristic.CVALUE.Replace("'", " ");
                break;
              case "ORIFICE_DIA_MM":
                savDiametroVal = Characteristic.CVALUE.Replace("'", " ");
                break;
              case "AREA_CM2":
                savAreaVal = Characteristic.CVALUE.Replace("'", " ");
                break;
              case "OVERPRESSURE":
                savSovrapressioneVal = Characteristic.CVALUE.Replace("'", " ");
                break;
              case "BLOWDOWN":
                savScartoVal = Characteristic.CVALUE.Replace("'", " ");
                break;
              case "STELLITE_SEAT_NOZZLE":
                savStelliteUVal = Characteristic.CVALUE.Replace("'", " ");
                break;
              case "STELLITE_SEAT_DISC":
                savStelliteOVal = Characteristic.CVALUE.Replace("'", " ");
                break;
              case "BONNET_MTL":
                savCappelloVal = Characteristic.CVALUE.Replace("'", " ");
                break;
              case "DISC_MTL":
                savOtturatoreVal = Characteristic.CVALUE.Replace("'", " ");
                break;
              case "BELLOWS":
                savSoffiettoVal = Characteristic.CVALUE.Replace("'", " ");
                break;
              case "OREFICE_LETTER":
                savOreficeLetter = Characteristic.CVALUE.Replace("'", " ");
                break;
              case "SEAT_SOFT_MTL":
                savSeatMtl = Characteristic.CVALUE.Replace("'", " ");
                break;
              case "SPRING_MTL":
                savMollaVal = Characteristic.CVALUE.Replace("'", " ");
                break;
              case "LIFT":
                savLift = Characteristic.CVALUE.Replace("'", " ");
                break;
            }
          }
          if(savFamily == "2000" || savFamily == "3000"){
            savClasseP = savInletClass + " x " + savOutletClass;
          }
          else{
            savClasseP = "";
          }
          // create General with same Id
          cmd.CommandText = "INSERT INTO dbo.GENERAL (Id,VBELN,POSNR,MATNR,ARKTX,ERDAT,EDATU,KWMENG,MEINS,AUFNR,BSTKD,KUNNR,NAME1,ZZTAG,ZZTARNOR,ZZTARBAN,ZZPRESET,"
            + "ZZPREGEN,ZZPRETOT,ZZPREMOL,ZZSPRING,ZZQP,ZZITP,ZZGRPFLD,ZZDISFLD,ZZSTATE,ZZDISTEMP,ANZSNF,ANZSNT,"
            + "AREA_CM2,LIFT,ORIFICE_DIA_MM,BELLOWS,BLOWDOWN,BODY_MTL,BONNET_MTL,DISC_COEFF_GAS,DISC_COEFF_LIQ,"
            + "DISC_MTL,INLET_CLASS_THREAD,INLET_SIZE,INLET_TYPE,NOZZLE_MTL,OREF_LETTER,OUTLET_CLASS_THREAD,OUTLET_SIZE,OUTLET_TYPE,"
            + "OVERPRESSURE,SEAT_SOFT_MTL,SPRING_MTL,STELLITE_SEAT_DISC,STELLITE_SEAT_NOZZLE,TEMP_RANGE,VALVE_FAMILY,VALVE_SERIE,VALVE_SERIE_TRIM,"
            + "VALVE_TYPE,UPDATED) VALUES("
            + recordID + ",'" + orderNr + "'," + orderLin + ",'" + lblItemNbr.Text + "','" + lblItemDesc.Text + "','" + orderERDAT + "','" + orderEDATU + "',"
            + lblItemQty.Text + ",'" + matMeins + "','" + lblOdPVal.Text + "','" + lblOrderNbr.Text + "','" + lblCustomerNbr.Text + "','" + lblCustomerName.Text + "','"
            + SiglaVal + "','" + TaraturaNom + "','" + TaraturaB + "','" + ControPressI + "','" + ControPressG + "','" + ControPressT + "','" + TaratureMolla + "','" + Molla + "','"
            + lblQPVal.Text + "','" + lblITPVal.Text + "','" + FluidGroup + "','" + FluidoScarico + "','" + StatoFisico + "','" + TempScarico + "','" + serialF + "','" + serialT + "','"
            + savAreaVal + "','" + savLift + "','" + savDiametroVal + "','" + savSoffiettoVal + "','" + savScartoVal + "','" + savCorpoVal + "','" + savCappelloVal + "','" + savCoefKGASVal + "','" + savCoefKliqVal + "','"
            + savOtturatoreVal + "','" + savInletClass + "','" + savInletSize + "','" + savInletType + "','" + savUgelloVal + "','" + savOreficeLetter + "','" + savOutletClass + "','" + savOutletSize + "','" + savOutletType + "','"
            + savSovrapressioneVal + "','" + savSeatMtl + "','" + savMollaVal + "','" + savStelliteOVal + "','" + savStelliteUVal + "','" + savCampoVal + "','" + savFamily + "','" + savSerie + "','" + savSerieTrim + "','"
            + savValveType + "','" + actDateTime + "')";
          int rowsAffected = cmd.ExecuteNonQuery();
          reader.Close();
        }
        reader.Close();

      // check COLLAUDO, if does not exist, then create
        cmd.CommandText = "SELECT * FROM dbo.Collaudo WHERE Id = " + recordID;
        cmd.Connection = conn;
        if (conn.State != ConnectionState.Open)
        {
          conn.Close();
          conn.Open();
        }
        reader = cmd.ExecuteReader();
        if (reader.HasRows){
          while (reader.Read())
          {
            lblCertificateNr.Text = reader["CERT"].ToString();
            DateTime test01 = Convert.ToDateTime(reader["DATCER"]);
            lblCertDataDat.Text = test01.ToString("dd.MM.yyyy");
            inpPortataMax.Value = reader["PORMXV"].ToString();
            inpBPortataMax.Value = "";
            inpPortataMaxRes.Value = "";
            inpCappuccio.Value = reader["CAPPUV"].ToString();
            inpBCappuccio.Value = "";
            inpCappuccioRes.Value = "";
            inpClassePV.Value = reader["CONNEV"].ToString();
            inpBClasseP.Value = "";
            inpClassePRes.Value = "";
            inpPortata.Value = reader["PORTAV"].ToString();
            inpBPortata.Value = "";
            inpPortataRes.Value = "";
            inpBControllo.Value = "";
            if (reader["CTRVIS"].ToString().IsNullOrWhiteSpace())
            { inpControlloRes.Checked = false; }
            else { inpControlloRes.Checked = true; }
            inpPuliziaONorm.Value = reader["PULOSV"].ToString();
            inpBPuliziaONorm.Value = "";
            if (reader["PULOSC"].ToString().IsNullOrWhiteSpace())
            { inpPuliziaONormRes.Checked = false; }
            else { inpPuliziaONormRes.Checked = true; }
            inpProvaIdrostatica.Value = reader["PIDROV"].ToString();
            if (reader["PIDROV"].ToString().IsNullOrWhiteSpace())
            { inpProvaIdrostatica.Value = "STD-606_16"; }
            else { inpProvaIdrostatica.Value = reader["PIDROV"].ToString(); }
            if (reader["PIDROB"].ToString().IsNullOrWhiteSpace())
            { inpBPIdrostatica.Value = bancoI; }
            else { inpBPIdrostatica.Value = reader["PIDROB"].ToString(); }
            if (reader["PIDROC"].ToString().IsNullOrWhiteSpace())
            { inpProvaIdrostaticaRes.Checked = false; }
            else { inpProvaIdrostaticaRes.Checked = true; }
            inpCorpo.Value = reader["CORPOV"].ToString();
            inpBCorpo.Value = reader["CORPOB"].ToString();
            if (reader["CORPOC"].ToString().IsNullOrWhiteSpace())
            { inpCorpoRes.Checked = false; }
            else { inpCorpoRes.Checked = true; }
            inpIncamiciatura.Value = reader["INCAMV"].ToString();
            inpBIncamiciatura.Value = reader["INCAMB"].ToString();
            if (reader["INCAMC"].ToString().IsNullOrWhiteSpace())
            { inpIncamiciaturaRes.Checked = false; }
            else { inpIncamiciaturaRes.Checked = true; }
            inpBoccaglio.Value = reader["BOCCAV"].ToString();
            inpBBoccaglio.Value = reader["BOCCAB"].ToString();
            if (reader["BOCCAC"].ToString().IsNullOrWhiteSpace())
            { inpBoccaglioRes.Checked = false; }
            else { inpBoccaglioRes.Checked = true; }
            inpBSoffietto.Value = reader["TSOFFV"].ToString();
            if (reader["TSOFFC"].ToString().IsNullOrWhiteSpace())
            { inpSoffiettoRes.Checked = false; }
            else { inpSoffiettoRes.Checked = true; }
            inpValvola.Value = reader["VALVEV"].ToString();
            if (reader["VALVEB"].ToString().IsNullOrWhiteSpace())
            { inpBValvola.Value = bancoT; }
            else { inpBValvola.Value = reader["VALVEB"].ToString(); }
            if (reader["VALVEC"].ToString().IsNullOrWhiteSpace())
            { inpValvolaRes.Checked = false; }
            else { inpValvolaRes.Checked = true; }
            inpTenuta.Value = reader["TGUARV"].ToString();
            inpBTenuta.Value = reader["TGUARB"].ToString();
            if (reader["TGUARC"].ToString().IsNullOrWhiteSpace())
            { inpTenutaRes.Checked = false; }
            else { inpTenutaRes.Checked = true; }
            if (reader["PSTARV"].ToString().IsNullOrWhiteSpace())
            { inpCDTPV.Value = TaraturaB; }
            else { inpCDTPV.Value = reader["PSTARV"].ToString(); }
            if (reader["PSTARC"].ToString().IsNullOrWhiteSpace())
            { inpCDTPRes.Checked = false; }
            else { inpCDTPRes.Checked = true; }
            if (reader["PSEDEV"].ToString().IsNullOrWhiteSpace())
            {
              if (inpCDTPV.Value.IsNullOrWhiteSpace())
              {
              }
              else
              {
                if (IsNumeric(inpCDTPV.Value))
                {
                  double per90;
                  per90 = (Convert.ToDouble(inpCDTPV.Value) * .9);
                  inpPerdita90.Value = per90.ToString("F1");
                }
              }
            }
            else { inpPerdita90.Value = reader["PSEDEV"].ToString(); }
            if (reader["PSEDEB"].ToString().IsNullOrWhiteSpace())
            { inBPerdita.Value = "API 527"; }
            else { inBPerdita.Value = reader["PSEDEB"].ToString(); }
            if (reader["PSEDEC"].ToString().IsNullOrWhiteSpace())
            { inpPerditaRes.Checked = false; }
            else { inpPerditaRes.Checked = true; }
            inpPdtA.Value = reader["PERARV"].ToString();
            if (reader["PERARB"].ToString() == "0")
            { inpPdtR.Value = maxPerdita.ToString(); }
            else { inpPdtR.Value = reader["PERARB"].ToString(); }
            if (reader["COFEMA"].ToString().IsNullOrWhiteSpace())
            { inpUser1.Value = collName; }
            else { inpUser1.Value = reader["COFEMA"].ToString(); }
            test01 = Convert.ToDateTime(reader["DATCFE"]);
            if (test01.ToString("yyyy-MM-dd") == "1900-01-01")
            { inpDateU1.Value = dataTenuta.ToString("dd.MM.yyyy"); }
            else { inpDateU1.Value = test01.ToString("dd.MM.yyyy"); }
            inpFemaRes.Value = "";
            inpUser2.Value = reader["COCLNT"].ToString();
            test01 = Convert.ToDateTime(reader["DATCCL"]);
            inpDateU2.Value = test01.ToString("dd.MM.yyyy");
          }
          reader.Close();
        }
        else
        {
          // generate a new certificate number (last + 1 for current year)
          reader.Close();
          int certNrMin = (DateTime.Now.Year - 2000) * 10000;
          int certNrMax = ((DateTime.Now.Year - 2000) * 10000) + 9999;
          cmd.CommandText = "SELECT MAX(CERT) MXCERT FROM dbo.COLLAUDO WHERE CERT BETWEEN " + certNrMin + " AND " + certNrMax;
          reader = cmd.ExecuteReader();
          if (reader.HasRows)
          {
            while (reader.Read())
            {
              var sqlValue = reader["MXCERT"];
              if (sqlValue == DBNull.Value)
              {
                certNr = (certNrMin + 1).ToString();
              }
              else
              {
                certNr = (Convert.ToInt32(reader["MXCERT"]) + 1).ToString();
              }
            }
          }
          else
          {
            certNr = (certNrMin + 1).ToString();
          }
          reader.Close();
          lblCertificateNr.Text = certNr;
          lblCertDataDat.Text = DateTime.Now.ToString("dd.MM.yyyy");
          // create Collaudo with same Id
          cmd.CommandText = "INSERT INTO dbo.COLLAUDO (Id,CERT,DATCER,"
          + "PORMXV,CAPPUV,CONNEV,PORTAV,PIDROV,PIDROB,PIDROC,CORPOV,CORPOB,CORPOC,INCAMV,INCAMB,INCAMC,BOCCAV,BOCCAB,BOCCAC,TSOFFV,TSOFFB,TSOFFC,VALVEV,VALVEB,VALVEC,"
          + "TGUARV,TGUARB,TGUARC,PSTARV,PSTARC,PSEDEV,PSEDEB,PSEDEC,PERARV,PERARB,PERARC,CTRVIS,PULOSV,PULOSC,COFEMA,DATCFE,DATCRV,COCLNT,DATCCL,"
          + "CLASSPU,CLASSPV,VOLAF,RIDUF,RMATV,RTIPOV,ATTF,AMATV,ATIPOV,DNOMV,PNOMV,AZMOLLAV,CPMOLLAV,DPMAXV,TUBOV,PVALLEV,PVALLEB,PVALLEF,PVALLEA,PVALLER,PVALLEARF,"
          + "CICLIV,CICLIB,CICLIF,CORSAA,CORSAR,CORSAF,NOTEV,NOTEF,"
          + "UPDATED) "
          + "VALUES(" + recordID + "," + certNr + ",'" + actDateTime + "'," 
          + "'','','" + savClasseP + "','','','" + bancoI + "','','','','','','','','','','','','','','','" + bancoT + "','',"
          + "'','','','" + TaraturaB + "','','','','','','" + maxPerdita.ToString() + "','','','','','" + collName + "','" + dataTenuta.ToString("yyyy-MM-dd") + "','1900-01-01','','1900-01-01',"
          + "'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','"
          + actDateTime + "')";
          int rowsAffected = cmd.ExecuteNonQuery();
          inpClassePV.Value = savClasseP;
          inpBPIdrostatica.Value = bancoI;
          inpBValvola.Value = bancoT;
          inpCDTPV.Value = TaraturaB;
          inpPdtR.Value = maxPerdita.ToString();        
          inpUser1.Value = collName;
          inpDateU1.Value = dataTenuta.ToString("dd.MM.yyyy");
        }
        reader.Close();
        conn.Close();
      }
    }
    protected void SaveData()
    {
      string chk0 = "";
      string chk1 = "";
      string chk2 = "";
      string chk3 = "";
      string chk4 = "";
      string chk5 = "";
      string chk6 = "";
      string chk7 = "";
      string chk8 = "";
      string chk9 = "";
      string chk10 = "";

// update the calculated bubble quantity
      if (inpCDTPV.Value.IsNullOrWhiteSpace())
      {
      }
      else
      {
        if(IsNumeric(inpCDTPV.Value)){
          double per90;
          per90 = (Convert.ToDouble(inpCDTPV.Value) * .9);
          inpPerdita90.Value = per90.ToString("F1");
        }
      }
      if (Request.Form["inpControlloRes"].IsNullOrWhiteSpace()) { chk0 = " "; } else { chk0 = "X"; }
      if (Request.Form["inpPuliziaONormRes"].IsNullOrWhiteSpace()) { chk1 = " "; } else { chk1 = "X"; }
      if (Request.Form["inpProvaIdrostaticaRes"].IsNullOrWhiteSpace()) { chk2 = " "; } else { chk2 = "X"; }
      if (Request.Form["inpCorpoRes"].IsNullOrWhiteSpace()) { chk3 = " "; } else { chk3 = "X"; }
      if (Request.Form["inpIncamiciaturaRes"].IsNullOrWhiteSpace()) { chk4 = " "; } else { chk4 = "X"; }
      if (Request.Form["inpBoccaglioRes"].IsNullOrWhiteSpace()) { chk5 = " "; } else { chk5 = "X"; }
      if (Request.Form["inpSoffiettoRes"].IsNullOrWhiteSpace()) { chk6 = " "; } else { chk6 = "X"; }
      if (Request.Form["inpValvolaRes"].IsNullOrWhiteSpace()) { chk7 = " "; } else { chk7 = "X"; }
      if (Request.Form["inpTenutaRes"].IsNullOrWhiteSpace()) { chk8 = " "; } else { chk8 = "X"; }
      if (Request.Form["inpCDTPRes"].IsNullOrWhiteSpace()) { chk10 = " "; } else { chk10 = "X"; }
      if (Request.Form["inpPerditaRes"].IsNullOrWhiteSpace()) { chk9 = " "; } else { chk9 = "X"; }
      if (Request.Form["inpPerdita90"].IsNullOrWhiteSpace())
      {
        if (Request.Form["inpCDTPV"].IsNullOrWhiteSpace())
        {
        }
        else
        {
          double per90;
          per90 = (Convert.ToDouble(Request.Form["inpCDTPV"]) * .9);
          inpPerdita90.Value = per90.ToString("F1");
        }
      }
      if (Request.Form["inpDateU1"].IsNullOrWhiteSpace()) { hlpInpDate1 = "1900-01-01"; } else { hlpInpDate1 = Request.Form["inpDateU1"].Substring(6, 4) + "-" + Request.Form["inpDateU1"].Substring(3, 2) + "-" + Request.Form["inpDateU1"].Substring(0, 2); }
      if (Request.Form["inpDateU2"].IsNullOrWhiteSpace()) { hlpInpDate2 = "1900-01-01"; } else { hlpInpDate2 = Request.Form["inpDateU2"].Substring(6, 4) + "-" + Request.Form["inpDateU2"].Substring(3, 2) + "-" + Request.Form["inpDateU2"].Substring(0, 2); }
      string actDateTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
      cmd.CommandType = System.Data.CommandType.Text;
      cmd.CommandText = "UPDATE dbo.COLLAUDO SET "
      + "PORMXV = '" + Request.Form["inpPortataMax"] + "',"
      + "CAPPUV = '" + Request.Form["inpCappuccio"] + "',"
      + "CONNEV = '" + Request.Form["inpClassePV"] + "',"
      + "PORTAV = '" + Request.Form["inpPortata"] + "',"
      + "PIDROV = '" + Request.Form["inpProvaIdrostatica"] + "',"
      + "PIDROB = '" + Request.Form["inpBPIdrostatica"] + "',"
      + "PIDROC = '" + chk2 + "',"
      + "CORPOV = '" + Request.Form["inpCorpo"] + "',"
      + "CORPOB = '" + Request.Form["inpBCorpo"] + "',"
      + "CORPOC = '" + chk3 + "',"
      + "INCAMV = '" + Request.Form["inpIncamiciatura"] + "',"
      + "INCAMB = '" + Request.Form["inpBIncamiciatura"] + "',"
      + "INCAMC = '" + chk4 + "',"
      + "BOCCAV = '" + Request.Form["inpBoccaglio"] + "',"
      + "BOCCAB = '" + Request.Form["inpBBoccaglio"] + "',"
      + "BOCCAC = '" + chk5 + "',"
      + "TSOFFV = '" + lblSoffiettoV.Text + "',"
      + "TSOFFB = '" + Request.Form["inpBSoffietto"] + "',"
      + "TSOFFC = '" + chk6 + "',"
      + "VALVEV = '" + Request.Form["inpValvola"] + "',"
      + "VALVEB = '" + Request.Form["inpBValvola"] + "',"
      + "VALVEC = '" + chk7 + "',"
      + "TGUARV = '" + Request.Form["inpTenuta"] + "',"
      + "TGUARB = '" + Request.Form["inpBTenuta"] + "',"
      + "TGUARC = '" + chk8 + "',"
      + "PSTARV = '" + Request.Form["inpCDTPV"] + "',"
      + "PSTARC = '" + chk10 + "',"
      + "PSEDEV = '" + inpPerdita90.Value + "',"
      + "PSEDEB = '" + Request.Form["inBPerdita"] + "',"
      + "PSEDEC = '" + chk9 + "',"
      + "PERARV = '" + Request.Form["inpPdtA"] + "',"
      + "PERARB = '" + Request.Form["inpPdtR"] + "',"
      + "PERARC = '',"
      + "CTRVIS = '" + chk0 + "',"
      + "PULOSV = '" + Request.Form["inpPuliziaONorm"] + "',"
      + "PULOSC = '" + chk1 + "',"
      + "COFEMA = '" + Request.Form["inpUser1"] + "',"
      + "DATCFE = '" + hlpInpDate1 + "',"
      + "COCLNT = '" + Request.Form["inpUser2"] + "',"
      + "DATCCL = '" + hlpInpDate2 + "',"
      + "UPDATED = '" + actDateTime + "' "
      + "WHERE Id = " + recordID;
      cmd.Connection = conn;
      if (conn.State != ConnectionState.Open)
      {
        conn.Close();
        conn.Open();
      }
      int rowsAffected = cmd.ExecuteNonQuery();
      conn.Close();
    }
    protected void ButtonStart_Click(object sender, EventArgs e)
    {
      Response.Redirect("Default.aspx");
    }
    protected void ButtonOK_Click(object sender, EventArgs e)
    {
      SaveData();
    }
    protected void ButtonOrder_Click(object sender, EventArgs e)
    {
      conn.Close();
      Response.Redirect("ShowSingleOrder.aspx");
    }
    protected void ButtonGenerale_Click(object sender, EventArgs e)
    {
      conn.Close();
      Response.Redirect("ShowGenerale.aspx");
    }
    protected void btnExportPDF_P_Click(object sender, EventArgs e)
    {
      stampBy = "P";
      SaveData();
      LoadReport(0);
    }
    protected void btnExportPDF_R_Click(object sender, EventArgs e)
    {
      stampBy = "R";
      SaveData();
      LoadReport(0);
    }
    private void LoadReport(int serial)
    {
      sqlText = "SELECT * FROM PrintView where Id = " + recordID;
      SqlCommand cmd = new SqlCommand(sqlText, conn);
      SqlDataAdapter da = new SqlDataAdapter(cmd);
      DataTable dt = new DataTable();
      da.Fill(dt);

      // ReportViewer setup
      ReportViewer1.ProcessingMode = ProcessingMode.Local;
      // Prepare multiple parameters
      var parameters = new List<ReportParameter>
                {
                    new ReportParameter("StampBy", stampBy),
                    new ReportParameter("Revision", revision)
                };
      if (_ENV == "PRD")
      {
        ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/SafetyPRD.rdlc");
        // Assign the parameter to the report
        ReportViewer1.LocalReport.SetParameters(parameters);
        ReportViewer1.LocalReport.DataSources.Clear();
        ReportDataSource rds = new ReportDataSource("PrintDataSetPRD", dt);
        ReportViewer1.LocalReport.DataSources.Add(rds);
      }
      else
      {
        ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Safety.rdlc");
        // Assign the parameter to the report
        ReportViewer1.LocalReport.SetParameters(parameters);
        ReportViewer1.LocalReport.DataSources.Clear();
        ReportDataSource rds = new ReportDataSource("PrintDataSet", dt);
        ReportViewer1.LocalReport.DataSources.Add(rds);
      }
      ReportViewer1.LocalReport.DisplayName = "CertQA";
      ReportViewer1.LocalReport.Refresh();
      Warning[] warnings;
      string[] streamIds;
      string mimeType, encoding, extension;
      string fileName = lblCustomerName.Text.Substring(0, 3) + "_" + orderNr.Trim(' ') + orderLin.Trim(' ');
      byte[] bytes = ReportViewer1.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

      Response.Clear();
      Response.ContentType = "application/pdf";
      Response.AddHeader("content-disposition", "inline; filename=" + fileName + ".pdf");
      Response.BinaryWrite(bytes);
      Response.Flush();
      Response.End();
    }
    static bool IsNumeric(string input)
    {
      if (string.IsNullOrWhiteSpace(input))
        return false;
      // Try parsing as double with invariant culture to avoid locale issues
      double number;
      return double.TryParse(
          input,
          NumberStyles.Float | NumberStyles.AllowThousands,
          CultureInfo.InvariantCulture,
          out number
      );
    }
  }
}