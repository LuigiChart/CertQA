using Microsoft.Ajax.Utilities;
using System;
using System.CodeDom.Compiler;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Windows.Forms;
using static System.Net.WebRequestMethods;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ToolTip;

namespace CertQA
{
  public partial class ShowFTJP01 : System.Web.UI.Page
  {
    static int recordID;
    static string _ENV;
    static string matuom;
    static string orderAFPO;
    static string orderNr;
    static string orderLin;
    static string materialAlt;
    static string serialF = "";
    static string serialT = "";
    static string project;
    static string orderERDAT = "";
    static string orderEDATU = "";
    static string hlpInpDate1 = "";
    static string hlpInpDate2 = "";
    static string hlpInpDate3 = "";
    static string classe = "";

    static SqlConnection conn;
    static SqlCommand cmd = new SqlCommand();
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
      string Charge = "";
      bool orderFound = false;
      int serialQty = 0;
      int serialCtr = 0;
      int serialInd = 0;
      string serialStr = "";
      string serialEnd = "";
      string[] serials = new string[12];
      if (!IsPostBack){
        _ENV = Convert.ToString(Session["ENV"]);
        matuom = Convert.ToString(Session["Uom"]);
        //matdescription = SAPHelper.SAPReadMAKT(material);
        //matdescription = matdescription.Replace("&quot;", "\"");
        orderAFPO = Convert.ToString(Session["AFPO"]);
        orderNr = Convert.ToString(Session["Ord01"]);
        orderLin = Convert.ToString(Session["Lin"]);
        recordID = Convert.ToInt32(Session["Id01"]);
        project = Convert.ToString(Session["Prj01"]);
        materialAlt = Convert.ToString(Session["MatAlt"]);
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

        // Get missing order line data
        orderFound = false;
        if (orderAFPO=="0"){
          List<object> orderList = SAPHelper.GetOrderDetailF007(orderNr, orderLin, "");
          if (orderList.Count > 0)
          {
            orderFound = true;
            foreach (F007 order in orderList) {
              lblCustomerNbr.Text = order.KUNNR.TrimStart('0').Trim();
              lblCustomerName.Text = order.NAME1.Trim().Replace("'", " "); 
              lblOrderNbr.Text = order.BSTKD.Trim().Replace("'", " ");
              lblCommessaNbr.Text = orderNr.Trim();
              lblPosNbr.Text = orderLin;
              orderERDAT = order.ERDAT; // order date
              lblDocDatedmy.Text = order.ERDAT.Substring(6, 2) + "." + order.ERDAT.Substring(4, 2) + "." + order.ERDAT.Substring(0, 4);
              orderEDATU = order.EDATU; // delivery date
              lblDelDateVal.Text = order.EDATU.Substring(6,2) + "." + order.EDATU.Substring(4, 2) + "." + order.EDATU.Substring(0, 4);
              //if(order.KDMAT != ""){
              //  lblItemNbr.Text = order.KDMAT.TrimStart('0').Trim();
              //  lblItemDesc.Text = SAPHelper.SAPReadMAKT(order.KDMAT); //.Replace("\"","&quot;");
              //}
              //else
              //{
              lblItemNbr.Text = order.MATNR.TrimStart('0').Trim();
              lblItemDesc.Text = order.DESCRIPTION.Trim().Replace("'", " ");//.Replace("\"","&quot;");
              //}
              lblItemQty.Text = order.KWMENG;
              lblITPVal.Text = order.ZZITP.Trim();
              lblQPVal.Text = order.ZZQP.Trim();
              lblOdPVal.Text = order.AUFNR.Trim();
              matMeins = order.MEINS.Trim();
              SiglaVal = order.ZZTAG.Trim();
              ControPressT = order.ZZPRETOT.Trim().Replace("'", " ");
              ControPressI = order.ZZPRESET.Trim().Replace("'", " ");
              ControPressG = order.ZZPREGEN.Trim().Replace("'", " ");
              Molla = order.ZZSPRING.Trim().Replace("'", " ");
              TaraturaNom = order.ZZTARNOR.Trim().Replace("'", " ");
              TaratureMolla = order.ZZPREMOL.Trim().Replace("'", " ");
              TaraturaB = order.ZZTARBAN.Trim().Replace("'", " ");
              FluidGroup = order.ZZGRPFLD.Trim().Replace("'", " ");
              FluidoScarico = order.ZZDISFLD.Trim().Replace("'", " ");
              StatoFisico = order.ZZSTATE.Trim().Replace("'", " ");
              TempScarico = order.ZZDISTEMP.Trim().Replace("'", " ");
              Charge = order.CHARG.Trim().Replace("'", " ");
            }
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
                    lblMatricolaFromValue.Text = serialF;
                  }
                  serialT = serial.TrimStart('0');
                  lblMatricolaToValue.Text = serialT;
                // create groups if more than 12
                  if(serialStr == ""){
                    serialStr = serial.TrimStart('0');
                  }
                  serialEnd = serial.TrimStart('0');
                  if(serialQty > 100){
                    serialInd = serialCtr / 20;
                    if (serialInd >= 1)
                    {
                      if ((serialCtr % 20) == 0 || serialCtr == serialQty)
                      {
                        serials[serialInd - 1] = serialStr + " - " + serialEnd;
                        serialStr = "";
                        serialEnd = "";
                      }
                    }
                  }
                  else
                  {
                    if (serialQty > 50)
                    {
                      serialInd = serialCtr / 10;
                      if (serialInd >= 1)
                      {
                        if ((serialCtr % 10) == 0 || serialCtr == serialQty)
                        {
                          serials[serialInd - 1] = serialStr + " - " + serialEnd;
                          serialStr = "";
                          serialEnd = "";
                        }
                      }
                    }
                    else
                    {
                      if (serialQty > 10)
                      {
                        serialInd = serialCtr / 5;
                        if(serialInd >= 1)
                        {
                          if ((serialCtr % 5) == 0|| serialCtr == serialQty)
                          {
                            serials[serialInd - 1] = serialStr + " - " + serialEnd;
                            serialStr = "";
                            serialEnd = "";
                          }
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
          }
        }
        else {
          orderNr = "0";
          orderLin = "0";
          List<object> orderList = SAPHelper.GetProductionOrderDetail(orderAFPO);
          if (orderList.Count>0) {
            orderFound = true;
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
              Charge = order.AUFNR.Trim();
              matMeins = order.MEINS.Trim();
            }
          // retrieve serials
            serialF = "";
            serialT = "";
            string objectNr = SAPHelper.SAPReadSER05(orderAFPO);
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
                    lblMatricolaFromValue.Text = serialF;
                  }
                  serialT = serial.TrimStart('0');
                  lblMatricolaToValue.Text = serialT;
                  // create groups if more than 12
                  if (serialStr == "")
                  {
                    serialStr = serial.TrimStart('0');
                  }
                  serialEnd = serial.TrimStart('0');
                  if (serialQty > 100)
                  {
                    serialInd = serialCtr / 20;
                    if (serialInd >= 1)
                    {
                      if ((serialCtr % 20) == 0 || serialCtr == serialQty)
                      {
                        serials[serialInd - 1] = serialStr + " - " + serialEnd;
                        serialStr = "";
                        serialEnd = "";
                      }
                    }
                  }
                  else
                  {
                    if (serialQty > 50)
                    {
                      serialInd = serialCtr / 10;
                      if (serialInd >= 1)
                      {
                        if ((serialCtr % 10) == 0 || serialCtr == serialQty)
                        {
                          serials[serialInd - 1] = serialStr + " - " + serialEnd;
                          serialStr = "";
                          serialEnd = "";
                        }
                      }
                    }
                    else
                    {
                      if (serialQty > 10)
                      {
                        serialInd = serialCtr / 5;
                        if (serialInd >= 1)
                        {
                          if ((serialCtr % 5) == 0 || serialCtr == serialQty)
                          {
                            serials[serialInd - 1] = serialStr + " - " + serialEnd;
                            serialStr = "";
                            serialEnd = "";
                          }
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
              Response.Write("<script>alert('No serial numbers found in SER05')</script>");
            }
          }
          else{
            Response.Write("<script>alert('No production order found in AFPO')</script>");
          }
        }
        if(orderFound){
        // Do we have an FTJP already?
          cmd.CommandType = System.Data.CommandType.Text;
          cmd.Connection = conn;
          if (conn.State != ConnectionState.Open)
          {
            conn.Close();
            conn.Open();
          }
          if (recordID > 0)
          {
            cmd.CommandText = "SELECT * FROM dbo.FTJP WHERE Id = " + recordID;
          }
          else if (orderAFPO == "0")
          {
            cmd.CommandText = "SELECT * FROM dbo.FTJP WHERE VBELN = '" + orderNr.TrimStart('0') + "' AND POSNR = " + orderLin;
          }
          else
          {
            cmd.CommandText = "SELECT * FROM dbo.FTJP WHERE VBELN = '0' AND POSNR = 0 AND AUFNR = '" + Charge.TrimStart('0') + "'";
          }
          SqlDataReader reader = cmd.ExecuteReader();
          if (reader.HasRows)
          {
            while (reader.Read())
            {
              recordID = Convert.ToInt32(reader["Id"]);
              savRecordId.Text = recordID.ToString();
              inpMontatore.Value = reader["USERNAME"].ToString();
              inpColataCC1.Value = reader["CC1_COLATA"].ToString();
              inpMaterialeCC1.Value = reader["CC1_MATERIALE"].ToString();
              inpMatricolaCC1.Value = reader["CC1_MATRICOLA"].ToString();
              inpColataCE1.Value = reader["CE1_COLATA"].ToString();
              inpMaterialeCE1.Value = reader["CE1_MATERIALE"].ToString();
              inpMatricolaCE1.Value = reader["CE1_MATRICOLA"].ToString();
              inpColataOT1.Value = reader["OT1_COLATA"].ToString();
              inpMaterialeOT1.Value = reader["OT1_MATERIALE"].ToString();
              inpMatricolaOT1.Value = reader["OT1_MATRICOLA"].ToString();
              inpColataUG1.Value = reader["UG1_COLATA"].ToString();
              inpMaterialeUG1.Value = reader["UG1_MATERIALE"].ToString();
              inpMatricolaUG1.Value = reader["UG1_MATRICOLA"].ToString();
              inpColataST1.Value = reader["ST1_COLATA"].ToString();
              inpMaterialeST1.Value = reader["ST1_MATERIALE"].ToString();
              inpMatricolaST1.Value = reader["ST1_MATRICOLA"].ToString();
              inpColataMO1.Value = reader["MO1_COLATA"].ToString();
              inpMaterialeMO1.Value = reader["MO1_MATERIALE"].ToString();
              inpMatricolaMO1.Value = reader["MO1_MATRICOLA"].ToString();
              inpColataCC2.Value = reader["CC2_COLATA"].ToString();
              inpMaterialeCC2.Value = reader["CC2_MATERIALE"].ToString();
              inpMatricolaCC2.Value = reader["CC2_MATRICOLA"].ToString();
              inpColataCE2.Value = reader["CE2_COLATA"].ToString();
              inpMaterialeCE2.Value = reader["CE2_MATERIALE"].ToString();
              inpMatricolaCE2.Value = reader["CE2_MATRICOLA"].ToString();
              inpColataOT2.Value = reader["OT2_COLATA"].ToString();
              inpMaterialeOT2.Value = reader["OT2_MATERIALE"].ToString();
              inpMatricolaOT2.Value = reader["OT2_MATRICOLA"].ToString();
              inpColataUG2.Value = reader["UG2_COLATA"].ToString();
              inpMaterialeUG2.Value = reader["UG2_MATERIALE"].ToString();
              inpMatricolaUG2.Value = reader["UG2_MATRICOLA"].ToString();
              inpColataST2.Value = reader["ST2_COLATA"].ToString();
              inpMaterialeST2.Value = reader["ST2_MATERIALE"].ToString();
              inpMatricolaST2.Value = reader["ST2_MATRICOLA"].ToString();
              inpColataMO2.Value = reader["MO2_COLATA"].ToString();
              inpMaterialeMO2.Value = reader["MO2_MATERIALE"].ToString();
              inpMatricolaMO2.Value = reader["MO2_MATRICOLA"].ToString();
              inpNote1.InnerText = reader["NOTA1"].ToString();
              inpNote2.InnerText = reader["NOTA2"].ToString();
              inpBancoPIdraulica.Value = reader["PIDROBA"].ToString();
              inpBancoPTenuta.Value = reader["PTENUBA"].ToString();
              DateTime test01 = Convert.ToDateTime(reader["PIDRODT"]);
              inpDatePIdraulica.Value = test01.ToString("dd.MM.yyyy");
              test01 = Convert.ToDateTime(reader["PTENUDT"]);
              inpDatePTenuta.Value = test01.ToString("dd.MM.yyyy");
              test01 = Convert.ToDateTime(reader["EXECUTED"]);
              inpDateCollaudo.Value = test01.ToString("dd.MM.yyyy");
              inpSeriale01.Value = reader["S01_SERIAL"].ToString();
              inpSeriale02.Value = reader["S02_SERIAL"].ToString();
              inpSeriale03.Value = reader["S03_SERIAL"].ToString();
              inpSeriale04.Value = reader["S04_SERIAL"].ToString();
              inpSeriale05.Value = reader["S05_SERIAL"].ToString();
              inpSeriale06.Value = reader["S06_SERIAL"].ToString();
              inpSeriale07.Value = reader["S07_SERIAL"].ToString();
              inpSeriale08.Value = reader["S08_SERIAL"].ToString();
              inpSeriale09.Value = reader["S09_SERIAL"].ToString();
              inpSeriale10.Value = reader["S10_SERIAL"].ToString();
              inpSeriale11.Value = reader["S11_SERIAL"].ToString();
              inpSeriale12.Value = reader["S12_SERIAL"].ToString();
              inpProvaIdro01.Value = reader["S01_PRVIDR"].ToString();
              inpProvaIdro02.Value = reader["S02_PRVIDR"].ToString();
              inpProvaIdro03.Value = reader["S03_PRVIDR"].ToString();
              inpProvaIdro04.Value = reader["S04_PRVIDR"].ToString();
              inpProvaIdro05.Value = reader["S05_PRVIDR"].ToString();
              inpProvaIdro06.Value = reader["S06_PRVIDR"].ToString();
              inpProvaIdro07.Value = reader["S07_PRVIDR"].ToString();
              inpProvaIdro08.Value = reader["S08_PRVIDR"].ToString();
              inpProvaIdro09.Value = reader["S09_PRVIDR"].ToString();
              inpProvaIdro10.Value = reader["S10_PRVIDR"].ToString();
              inpProvaIdro11.Value = reader["S11_PRVIDR"].ToString();
              inpProvaIdro12.Value = reader["S12_PRVIDR"].ToString();
              inpProvaTen01.Value = Convert.ToInt32(reader["S01_BOLLE"]).ToString();
              inpProvaTen02.Value = Convert.ToInt32(reader["S02_BOLLE"]).ToString();
              inpProvaTen03.Value = Convert.ToInt32(reader["S03_BOLLE"]).ToString();
              inpProvaTen04.Value = Convert.ToInt32(reader["S04_BOLLE"]).ToString();
              inpProvaTen05.Value = Convert.ToInt32(reader["S05_BOLLE"]).ToString();
              inpProvaTen06.Value = Convert.ToInt32(reader["S06_BOLLE"]).ToString();
              inpProvaTen07.Value = Convert.ToInt32(reader["S07_BOLLE"]).ToString();
              inpProvaTen08.Value = Convert.ToInt32(reader["S08_BOLLE"]).ToString();
              inpProvaTen09.Value = Convert.ToInt32(reader["S09_BOLLE"]).ToString();
              inpProvaTen10.Value = Convert.ToInt32(reader["S10_BOLLE"]).ToString();
              inpProvaTen11.Value = Convert.ToInt32(reader["S11_BOLLE"]).ToString();
              inpProvaTen12.Value = Convert.ToInt32(reader["S12_BOLLE"]).ToString();
              // retrieve serials from General
            }
            reader.Close();
            conn.Close();
          }
          else
          // if no record is returned, then create FTJP
          {
            reader.Close();
            string actDate = DateTime.Now.ToString("yyyy-MM-dd");
            string actDateTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
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
                inpMontatore.Value = reader["USERNAME"].ToString();
                inpColataCC1.Value = reader["CC1_COLATA"].ToString();
                inpMaterialeCC1.Value = reader["CC1_MATERIALE"].ToString();
                inpMatricolaCC1.Value = reader["CC1_MATRICOLA"].ToString();
                inpColataCE1.Value = reader["CE1_COLATA"].ToString();
                inpMaterialeCE1.Value = reader["CE1_MATERIALE"].ToString();
                inpMatricolaCE1.Value = reader["CE1_MATRICOLA"].ToString();
                inpColataOT1.Value = reader["OT1_COLATA"].ToString();
                inpMaterialeOT1.Value = reader["OT1_MATERIALE"].ToString();
                inpMatricolaOT1.Value = reader["OT1_MATRICOLA"].ToString();
                inpColataUG1.Value = reader["UG1_COLATA"].ToString();
                inpMaterialeUG1.Value = reader["UG1_MATERIALE"].ToString();
                inpMatricolaUG1.Value = reader["UG1_MATRICOLA"].ToString();
                inpColataST1.Value = reader["ST1_COLATA"].ToString();
                inpMaterialeST1.Value = reader["ST1_MATERIALE"].ToString();
                inpMatricolaST1.Value = reader["ST1_MATRICOLA"].ToString();
                inpColataMO1.Value = reader["MO1_COLATA"].ToString();
                inpMaterialeMO1.Value = reader["MO1_MATERIALE"].ToString();
                inpMatricolaMO1.Value = reader["MO1_MATRICOLA"].ToString();
                inpColataCC2.Value = reader["CC2_COLATA"].ToString();
                inpMaterialeCC2.Value = reader["CC2_MATERIALE"].ToString();
                inpMatricolaCC2.Value = reader["CC2_MATRICOLA"].ToString();
                inpColataCE2.Value = reader["CE2_COLATA"].ToString();
                inpMaterialeCE2.Value = reader["CE2_MATERIALE"].ToString();
                inpMatricolaCE2.Value = reader["CE2_MATRICOLA"].ToString();
                inpColataOT2.Value = reader["OT2_COLATA"].ToString();
                inpMaterialeOT2.Value = reader["OT2_MATERIALE"].ToString();
                inpMatricolaOT2.Value = reader["OT2_MATRICOLA"].ToString();
                inpColataUG2.Value = reader["UG2_COLATA"].ToString();
                inpMaterialeUG2.Value = reader["UG2_MATERIALE"].ToString();
                inpMatricolaUG2.Value = reader["UG2_MATRICOLA"].ToString();
                inpColataST2.Value = reader["ST2_COLATA"].ToString();
                inpMaterialeST2.Value = reader["ST2_MATERIALE"].ToString();
                inpMatricolaST2.Value = reader["ST2_MATRICOLA"].ToString();
                inpColataMO2.Value = reader["MO2_COLATA"].ToString();
                inpMaterialeMO2.Value = reader["MO2_MATERIALE"].ToString();
                inpMatricolaMO2.Value = reader["MO2_MATRICOLA"].ToString();
                inpNote1.InnerText = reader["NOTA1"].ToString();
                inpNote2.InnerText = reader["NOTA2"].ToString();
                inpBancoPIdraulica.Value = reader["PIDROBA"].ToString();
                inpBancoPTenuta.Value = reader["PTENUBA"].ToString();
                DateTime test01 = Convert.ToDateTime(reader["PIDRODT"]);
                inpDatePIdraulica.Value = test01.ToString("dd.MM.yyyy");
                test01 = Convert.ToDateTime(reader["PTENUDT"]);
                inpDatePTenuta.Value = test01.ToString("dd.MM.yyyy");
                test01 = Convert.ToDateTime(reader["EXECUTED"]);
                inpDateCollaudo.Value = test01.ToString("dd.MM.yyyy");
                inpSeriale01.Value = reader["S01_SERIAL"].ToString();
                inpSeriale02.Value = reader["S02_SERIAL"].ToString();
                inpSeriale03.Value = reader["S03_SERIAL"].ToString();
                inpSeriale04.Value = reader["S04_SERIAL"].ToString();
                inpSeriale05.Value = reader["S05_SERIAL"].ToString();
                inpSeriale06.Value = reader["S06_SERIAL"].ToString();
                inpSeriale07.Value = reader["S07_SERIAL"].ToString();
                inpSeriale08.Value = reader["S08_SERIAL"].ToString();
                inpSeriale09.Value = reader["S09_SERIAL"].ToString();
                inpSeriale10.Value = reader["S10_SERIAL"].ToString();
                inpSeriale11.Value = reader["S11_SERIAL"].ToString();
                inpSeriale12.Value = reader["S12_SERIAL"].ToString();
                inpProvaIdro01.Value = reader["S01_PRVIDR"].ToString();
                inpProvaIdro02.Value = reader["S02_PRVIDR"].ToString();
                inpProvaIdro03.Value = reader["S03_PRVIDR"].ToString();
                inpProvaIdro04.Value = reader["S04_PRVIDR"].ToString();
                inpProvaIdro05.Value = reader["S05_PRVIDR"].ToString();
                inpProvaIdro06.Value = reader["S06_PRVIDR"].ToString();
                inpProvaIdro07.Value = reader["S07_PRVIDR"].ToString();
                inpProvaIdro08.Value = reader["S08_PRVIDR"].ToString();
                inpProvaIdro09.Value = reader["S09_PRVIDR"].ToString();
                inpProvaIdro10.Value = reader["S10_PRVIDR"].ToString();
                inpProvaIdro11.Value = reader["S11_PRVIDR"].ToString();
                inpProvaIdro12.Value = reader["S12_PRVIDR"].ToString();
                inpProvaTen01.Value = Convert.ToInt32(reader["S01_BOLLE"]).ToString();
                inpProvaTen02.Value = Convert.ToInt32(reader["S02_BOLLE"]).ToString();
                inpProvaTen03.Value = Convert.ToInt32(reader["S03_BOLLE"]).ToString();
                inpProvaTen04.Value = Convert.ToInt32(reader["S04_BOLLE"]).ToString();
                inpProvaTen05.Value = Convert.ToInt32(reader["S05_BOLLE"]).ToString();
                inpProvaTen06.Value = Convert.ToInt32(reader["S06_BOLLE"]).ToString();
                inpProvaTen07.Value = Convert.ToInt32(reader["S07_BOLLE"]).ToString();
                inpProvaTen08.Value = Convert.ToInt32(reader["S08_BOLLE"]).ToString();
                inpProvaTen09.Value = Convert.ToInt32(reader["S09_BOLLE"]).ToString();
                inpProvaTen10.Value = Convert.ToInt32(reader["S10_BOLLE"]).ToString();
                inpProvaTen11.Value = Convert.ToInt32(reader["S11_BOLLE"]).ToString();
                inpProvaTen12.Value = Convert.ToInt32(reader["S12_BOLLE"]).ToString();
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
                savRecordId.Text = recordID.ToString();
                // create GENERAL with same Id
                cmd.CommandText = "INSERT INTO dbo.GENERAL (Id,VBELN,POSNR,MATNR,ARKTX,ERDAT,EDATU,KWMENG,MEINS,AUFNR,BSTKD,KUNNR,NAME1,ZZTAG,ZZTARNOR,ZZTARBAN,ZZPRESET,"
                + "ZZPREGEN,ZZPRETOT,ZZPREMOL,ZZSPRING,ZZQP,ZZITP,ZZGRPFLD,ZZDISFLD,ZZSTATE,ZZDISTEMP,ANZSNF,ANZSNT,AREA_CM2,LIFT,ORIFICE_DIA_MM,BELLOWS,BLOWDOWN,BODY_MTL,BONNET_MTL,"
                + "DISC_COEFF_GAS,DISC_COEFF_LIQ,DISC_MTL,INLET_CLASS_THREAD,INLET_SIZE,INLET_TYPE,NOZZLE_MTL,OREF_LETTER,OUTLET_CLASS_THREAD,OUTLET_SIZE,OUTLET_TYPE,OVERPRESSURE,"
                + "SEAT_SOFT_MTL,SPRING_MTL,STELLITE_SEAT_DISC,STELLITE_SEAT_NOZZLE,TEMP_RANGE,VALVE_FAMILY,VALVE_SERIE,VALVE_SERIE_TRIM,VALVE_TYPE,UPDATED) VALUES("
                + recordID + ",'" + orderNr + "'," + orderLin + ",'" + lblItemNbr.Text + "','" + lblItemDesc.Text + "','" + orderERDAT + "','" + orderEDATU + "'," + lblItemQty.Text + ",'"
                + matMeins + "','" + lblOdPVal.Text + "','" + lblOrderNbr.Text + "','" + lblCustomerNbr.Text + "','" + lblCustomerName.Text + "','"
                + SiglaVal + "','" + TaraturaNom + "','" + TaraturaB + "','" + ControPressI + "','" + ControPressG + "','" + ControPressT + "','" + TaratureMolla + "','" + Molla + "','"
                + lblQPVal.Text + "','" + lblITPVal.Text + "','" + FluidGroup + "','" + FluidoScarico + "','" + StatoFisico + "','" + TempScarico + "','" + serialF + "','" + serialT + "','"
                + "','','','','','','','','','','','','','','','','','','','','','','','','','','','','"
                + actDateTime + "')";
                int rowsAffected = cmd.ExecuteNonQuery();
                conn.Close();
                break;
              }
              reader.Close();
            }
            else
            {
              reader.Close();
              if (serialList != null){
                inpSeriale01.Value = serials[0];
                inpSeriale02.Value = serials[1];
                inpSeriale03.Value = serials[2];
                inpSeriale04.Value = serials[3];
                inpSeriale05.Value = serials[4];
                inpSeriale06.Value = serials[5];
                inpSeriale07.Value = serials[6];
                inpSeriale08.Value = serials[7];
                inpSeriale09.Value = serials[8];
                inpSeriale10.Value = serials[9];
                inpSeriale11.Value = serials[10];
                inpSeriale12.Value = serials[11];
              }
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
              savRecordId.Text = recordID.ToString();
              // create GENERAL with same Id
              cmd.CommandText = "INSERT INTO dbo.GENERAL (Id,VBELN,POSNR,MATNR,ARKTX,ERDAT,EDATU,KWMENG,MEINS,AUFNR,BSTKD,KUNNR,NAME1,ZZTAG,ZZTARNOR,ZZTARBAN,ZZPRESET,"
              + "ZZPREGEN,ZZPRETOT,ZZPREMOL,ZZSPRING,ZZQP,ZZITP,ZZGRPFLD,ZZDISFLD,ZZSTATE,ZZDISTEMP,ANZSNF,ANZSNT,AREA_CM2,LIFT,ORIFICE_DIA_MM,BELLOWS,BLOWDOWN,BODY_MTL,BONNET_MTL,"
              + "DISC_COEFF_GAS,DISC_COEFF_LIQ,DISC_MTL,INLET_CLASS_THREAD,INLET_SIZE,INLET_TYPE,NOZZLE_MTL,OREF_LETTER,OUTLET_CLASS_THREAD,OUTLET_SIZE,OUTLET_TYPE,OVERPRESSURE,"
              + "SEAT_SOFT_MTL,SPRING_MTL,STELLITE_SEAT_DISC,STELLITE_SEAT_NOZZLE,TEMP_RANGE,VALVE_FAMILY,VALVE_SERIE,VALVE_SERIE_TRIM,VALVE_TYPE,UPDATED) VALUES("
              + recordID + ",'" + orderNr + "'," + orderLin + ",'" + lblItemNbr.Text + "','" + lblItemDesc.Text + "','" + orderERDAT + "','" + orderEDATU + "'," + lblItemQty.Text + ",'"  
              + matMeins + "','" + lblOdPVal.Text + "','" + lblOrderNbr.Text + "','" + lblCustomerNbr.Text + "','" + lblCustomerName.Text + "','"
              + SiglaVal + "','" + TaraturaNom + "','" + TaraturaB + "','" + ControPressI + "','" + ControPressG + "','" + ControPressT + "','" + TaratureMolla + "','" + Molla + "','"
              + lblQPVal.Text + "','" + lblITPVal.Text + "','" + FluidGroup + "','" + FluidoScarico + "','" + StatoFisico + "','" + TempScarico + "','" + serialF + "','" + serialT + "','"
              + "','','','','','','','','','','','','','','','','','','','','','','','','','','','','"
              + actDateTime + "')";
              int rowsAffected = cmd.ExecuteNonQuery();
              reader.Close();
            }
            // create SERIALS with same Id
            if (serialList != null && orderAFPO == "0")
            {
              if (conn.State != ConnectionState.Open)
              {
                conn.Close();
                conn.Open();
              }
              foreach (string serial in serialList)
              {
                cmd.CommandText = "INSERT INTO dbo.SERIALS (Id,SERIAL,UPDATED) VALUES(" + recordID + ",'" + serial.TrimStart('0') + "','" + actDateTime + "')";
                int rowsAffected = cmd.ExecuteNonQuery();
              }
            }
          }
        }
        else{
          // no order found
          btOK.Visible = false;
          btNext.Visible = false;
        }
      }
    }
    protected void SaveData(){
      string actDateTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
      if (Request.Form["inpDateCollaudo"].IsNullOrWhiteSpace()) { hlpInpDate1 = "1900-01-01"; } else { hlpInpDate1 = Request.Form["inpDateCollaudo"].Substring(6, 4) + "-" + Request.Form["inpDateCollaudo"].Substring(3, 2) + "-" + Request.Form["inpDateCollaudo"].Substring(0, 2); }
      if (Request.Form["inpDatePIdraulica"].IsNullOrWhiteSpace()) { hlpInpDate2 = "1900-01-01"; } else { hlpInpDate2 = Request.Form["inpDatePIdraulica"].Substring(6, 4) + "-" + Request.Form["inpDatePIdraulica"].Substring(3, 2) + "-" + Request.Form["inpDatePIdraulica"].Substring(0, 2); }
      if (Request.Form["inpDatePTenuta"].IsNullOrWhiteSpace()) { hlpInpDate3 = "1900-01-01"; } else { hlpInpDate3 = Request.Form["inpDatePTenuta"].Substring(6, 4) + "-" + Request.Form["inpDatePTenuta"].Substring(3, 2) + "-" + Request.Form["inpDatePTenuta"].Substring(0, 2); }
      cmd.CommandType = System.Data.CommandType.Text;
      cmd.CommandText = "SET ANSI_WARNINGS OFF; UPDATE dbo.FTJP SET "
        + " USERNAME = '" + Request.Form["inpMontatore"].Trim() 
        + "', CC1_COLATA = '" + Request.Form["inpColataCC1"].Trim()
        + "', CC1_MATERIALE = '" + Request.Form["inpMaterialeCC1"].Trim()
        + "', CC1_MATRICOLA = '" + Request.Form["inpMatricolaCC1"].Trim()
        + "', CE1_COLATA = '" + Request.Form["inpColataCE1"].Trim()
        + "', CE1_MATERIALE = '" + Request.Form["inpMaterialeCE1"].Trim()
        + "', CE1_MATRICOLA = '" + Request.Form["inpMatricolaCE1"].Trim()
        + "', OT1_COLATA = '" + Request.Form["inpColataOT1"].Trim()
        + "', OT1_MATERIALE = '" + Request.Form["inpMaterialeOT1"].Trim()
        + "', OT1_MATRICOLA = '" + Request.Form["inpMatricolaOT1"].Trim()
        + "', UG1_COLATA = '" + Request.Form["inpColataUG1"].Trim()
        + "', UG1_MATERIALE = '" + Request.Form["inpMaterialeUG1"].Trim()
        + "', UG1_MATRICOLA = '" + Request.Form["inpMatricolaUG1"].Trim()
        + "', ST1_COLATA = '" + Request.Form["inpColataST1"].Trim()
        + "', ST1_MATERIALE = '" + Request.Form["inpMaterialeST1"].Trim()
        + "', ST1_MATRICOLA = '" + Request.Form["inpMatricolaST1"].Trim()
        + "', MO1_COLATA = '" + Request.Form["inpColataMO1"].Trim()
        + "', MO1_MATERIALE = '" + Request.Form["inpMaterialeMO1"].Trim()
        + "', MO1_MATRICOLA = '" + Request.Form["inpMatricolaMO1"].Trim()
        + "', CC2_COLATA = '" + Request.Form["inpColataCC2"].Trim()
        + "', CC2_MATERIALE = '" + Request.Form["inpMaterialeCC2"].Trim()
        + "', CC2_MATRICOLA = '" + Request.Form["inpMatricolaCC2"].Trim()
        + "', CE2_COLATA = '" + Request.Form["inpColataCE2"].Trim()
        + "', CE2_MATERIALE = '" + Request.Form["inpMaterialeCE2"].Trim()
        + "', CE2_MATRICOLA = '" + Request.Form["inpMatricolaCE2"].Trim()
        + "', OT2_COLATA = '" + Request.Form["inpColataOT2"].Trim()
        + "', OT2_MATERIALE = '" + Request.Form["inpMaterialeOT2"].Trim()
        + "', OT2_MATRICOLA = '" + Request.Form["inpMatricolaOT2"].Trim()
        + "', ST2_COLATA = '" + Request.Form["inpColataST2"].Trim()
        + "', ST2_MATERIALE = '" + Request.Form["inpMaterialeST2"].Trim()
        + "', ST2_MATRICOLA = '" + Request.Form["inpMatricolaST2"].Trim()
        + "', UG2_COLATA = '" + Request.Form["inpColataUG2"].Trim()
        + "', UG2_MATERIALE = '" + Request.Form["inpMaterialeUG2"].Trim()
        + "', UG2_MATRICOLA = '" + Request.Form["inpMatricolaUG2"].Trim()
        + "', MO2_COLATA = '" + Request.Form["inpColataMO2"].Trim()
        + "', MO2_MATERIALE = '" + Request.Form["inpMaterialeMO2"].Trim()
        + "', MO2_MATRICOLA = '" + Request.Form["inpMatricolaMO2"].Trim()
        + "', NOTA1 = '" + Request.Form["inpNote1"].Trim().Replace("'", "")
        + "', NOTA2 = '" + Request.Form["inpNote2"].Trim().Replace("'", "")
        + "', S01_PRVIDR = '" + Request.Form["inpProvaIdro01"].Trim()
        + "', S02_PRVIDR = '" + Request.Form["inpProvaIdro02"].Trim()
        + "', S03_PRVIDR = '" + Request.Form["inpProvaIdro03"].Trim()
        + "', S04_PRVIDR = '" + Request.Form["inpProvaIdro04"].Trim()
        + "', S05_PRVIDR = '" + Request.Form["inpProvaIdro05"].Trim()
        + "', S06_PRVIDR = '" + Request.Form["inpProvaIdro06"].Trim()
        + "', S07_PRVIDR = '" + Request.Form["inpProvaIdro07"].Trim()
        + "', S08_PRVIDR = '" + Request.Form["inpProvaIdro08"].Trim()
        + "', S09_PRVIDR = '" + Request.Form["inpProvaIdro09"].Trim()
        + "', S10_PRVIDR = '" + Request.Form["inpProvaIdro10"].Trim()
        + "', S11_PRVIDR = '" + Request.Form["inpProvaIdro11"].Trim()
        + "', S12_PRVIDR = '" + Request.Form["inpProvaIdro12"].Trim()
        + "', S01_BOLLE = '" + Request.Form["inpProvaTen01"].Trim()
        + "', S02_BOLLE = '" + Request.Form["inpProvaTen02"].Trim()
        + "', S03_BOLLE = '" + Request.Form["inpProvaTen03"].Trim()
        + "', S04_BOLLE = '" + Request.Form["inpProvaTen04"].Trim()
        + "', S05_BOLLE = '" + Request.Form["inpProvaTen05"].Trim()
        + "', S06_BOLLE = '" + Request.Form["inpProvaTen06"].Trim()
        + "', S07_BOLLE = '" + Request.Form["inpProvaTen07"].Trim()
        + "', S08_BOLLE = '" + Request.Form["inpProvaTen08"].Trim()
        + "', S09_BOLLE = '" + Request.Form["inpProvaTen09"].Trim()
        + "', S10_BOLLE = '" + Request.Form["inpProvaTen10"].Trim()
        + "', S11_BOLLE = '" + Request.Form["inpProvaTen11"].Trim()
        + "', S12_BOLLE = '" + Request.Form["inpProvaTen12"].Trim()
        + "', PIDROBA = '" + Request.Form["inpBancoPIdraulica"].Trim()
        + "', PTENUBA = '" + Request.Form["inpBancoPTenuta"].Trim()
        + "', PIDRODT = '" + hlpInpDate2
        + "', PTENUDT = '" + hlpInpDate3
        + "', UPDATED = '" + actDateTime
        + "', EXECUTED = '" + hlpInpDate1
      + "' WHERE Id = " + recordID;
      cmd.Connection = conn;
      if (conn.State != ConnectionState.Open)
      {
        conn.Close();
        conn.Open();
      }
      int rowsAffected = cmd.ExecuteNonQuery();
      conn.Close();
    }
    protected void ButtonOK_Click(object sender, EventArgs e)
    {
      SaveData();
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
      SaveData();
      Session["Id01"] = recordID;
      Session["SeF"] = serialF;
      Session["SeT"] = serialT;
      Response.Redirect("ShowFTJP02.aspx");
    }
  }
}