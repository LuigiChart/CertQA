using Microsoft.Ajax.Utilities;
using Microsoft.Reporting.Map.WebForms.BingMaps;
using SAP.Middleware.Connector;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Web;

namespace CertQA
{
  public class SAPHelper : IDestinationConfiguration
  {
    public RfcConfigParameters GetParameters(String destinationName)
    {
      RfcConfigParameters parms = new RfcConfigParameters();
      if ("DEV".Equals(destinationName))
      {
        parms.Add(RfcConfigParameters.Name, Convert.ToString(HttpContext.Current.Session["ENV"]));
        parms.Add(RfcConfigParameters.SystemID, Convert.ToString(HttpContext.Current.Session["ENV"]));
        parms.Add(RfcConfigParameters.AppServerHost, "azusapdev01.chart-ind.local");
        parms.Add(RfcConfigParameters.SystemNumber, "00");
        parms.Add(RfcConfigParameters.LogonGroup, "PUBLIC");
        parms.Add(RfcConfigParameters.User, Convert.ToString(HttpContext.Current.Session["USR"]));
        parms.Add(RfcConfigParameters.Password, Convert.ToString(HttpContext.Current.Session["PWD"]));
        parms.Add(RfcConfigParameters.Client, "100");
        parms.Add(RfcConfigParameters.Language, "en");
        parms.Add(RfcConfigParameters.PoolSize, "5");
        parms.Add(RfcConfigParameters.PeakConnectionsLimit, "100");
        parms.Add(RfcConfigParameters.UseSAPGui, "0");
        return parms;
      }
      if ("UAT".Equals(destinationName))
      {
        parms.Add(RfcConfigParameters.Name, Convert.ToString(HttpContext.Current.Session["ENV"]));
        parms.Add(RfcConfigParameters.SystemID, Convert.ToString(HttpContext.Current.Session["ENV"]));
        parms.Add(RfcConfigParameters.AppServerHost, "azusapuat01.chart-ind.local");
        parms.Add(RfcConfigParameters.SystemNumber, "00");  
        parms.Add(RfcConfigParameters.LogonGroup, "PUBLIC");
        parms.Add(RfcConfigParameters.User, Convert.ToString(HttpContext.Current.Session["USR"]));
        parms.Add(RfcConfigParameters.Password, Convert.ToString(HttpContext.Current.Session["PWD"]));
        parms.Add(RfcConfigParameters.Client, "100");
        parms.Add(RfcConfigParameters.Language, "IT");
        parms.Add(RfcConfigParameters.PoolSize, "5");
        parms.Add(RfcConfigParameters.PeakConnectionsLimit, "100");
        parms.Add(RfcConfigParameters.ConnectionIdleTimeout, "600");
        parms.Add(RfcConfigParameters.UseSAPGui, "0");
      }
      if ("PRD".Equals(destinationName))
      {
        parms.Add(RfcConfigParameters.Name, Convert.ToString(HttpContext.Current.Session["ENV"]));
        parms.Add(RfcConfigParameters.SystemID, Convert.ToString(HttpContext.Current.Session["ENV"]));
        parms.Add(RfcConfigParameters.AppServerHost, "azusapprv03.chart-ind.local");
        parms.Add(RfcConfigParameters.SystemNumber, "00");
        parms.Add(RfcConfigParameters.LogonGroup, "PUBLIC");
        parms.Add(RfcConfigParameters.User, Convert.ToString(HttpContext.Current.Session["USR"]));
        parms.Add(RfcConfigParameters.Password, Convert.ToString(HttpContext.Current.Session["PWD"]));
        parms.Add(RfcConfigParameters.Client, "100");
        parms.Add(RfcConfigParameters.Language, "IT");
        parms.Add(RfcConfigParameters.PoolSize, "5");
        parms.Add(RfcConfigParameters.PeakConnectionsLimit, "100");
        parms.Add(RfcConfigParameters.ConnectionIdleTimeout, "600");
        parms.Add(RfcConfigParameters.UseSAPGui, "0");
        return parms;
      }
      return parms;
    }
    public static string GetCompany(String comp)
    {
      try
      {
        RfcDestination dest = RfcDestinationManager.GetDestination(Convert.ToString(HttpContext.Current.Session["ENV"]));
        RfcRepository repo = dest.Repository;
        //3     
        IRfcFunction companyBapi = repo.CreateFunction("BAPI_COMPANY_GETDETAIL");
        //4            
        companyBapi.SetValue("COMPANYID", comp);
        //5    
        companyBapi.Invoke(dest);
        //6                
        IRfcStructure detail = companyBapi.GetStructure("COMPANY_DETAIL");
        String companyName = detail.GetString("NAME1");
        //7
        return companyName;
      }
      catch (Exception ex)
      {
        // next you should handle all the relevant exceptions, but          
        // we will not do this here
        //        Alert.Show("SAP GetCompany failed: " + ex.Message);
        return ex.Message;
      }
    }
    public static List<string> GetProjectDetail(String prj)
    {
      string wbsReadable;
      List<string> wbs = new List<string>();
      try
      {
        RfcDestination dest = RfcDestinationManager.GetDestination(Convert.ToString(HttpContext.Current.Session["ENV"]));
        RfcRepository repo = dest.Repository;

        //IRfcFunction codeBapi = repo.CreateFunction("BAPI_CONVERSION_EXT2INT1");
        //IRfcTable codeData = codeBapi.GetTable("DATA");
        //codeData.Insert();
        //codeData.SetValue("OBJTYPE", "BUS2054");
        //codeData.SetValue("METHOD", "GETINFO");
        //codeData.SetValue("PARAMETER", "PROJECTDEFINITION");
        //codeData.SetValue("ROWNUMBER", "0");

        IRfcFunction prjBapi = repo.CreateFunction("BAPI_PROJECTDEF_GETDETAIL");
        prjBapi.SetValue("CURRENTEXTERNALPROJE", prj);
        prjBapi.SetValue("CURRENTINTERNALPROJE", "");
        prjBapi.Invoke(dest);
        IRfcStructure detData = prjBapi.GetStructure("PROJECT_DEFINITION_STRU");
        IRfcStructure retData = prjBapi.GetStructure("RETURN");
        if (retData.GetString("MESSAGE") != "")
        {
          wbs.Add(retData.GetString("MESSAGE"));
        }
        else
        {
          wbs.Add(detData.GetString("DESCRIPTION"));

          IRfcFunction wbsBapi = repo.CreateFunction("BBP_PS_PROJECT_GET_LIST");
          IRfcStructure wbsSelect = wbsBapi.GetStructure("I_PS_SEL");
          wbsSelect.SetValue("PROJ_DEF", prj);
          wbsBapi.Invoke(dest);
          IRfcTable wbsData = wbsBapi.GetTable("ET_RSTHIE");
          for (int i = 0; i < wbsData.Count; i++)
          {
            wbsReadable = wbsData[i].GetString("NAME");
            //codeData.SetValue("EXT_FORMAT", wbsReadable);
            //codeBapi.Invoke(dest);
            string wbsIntern = wbsReadable.Substring(2);

            // read PRPS with PSPNR = wbsIntern
            string wbsExtern = SAPReadPRPS(dest, repo, wbsIntern);

            // read EKKN with PS_PSP_PNR = wbsExtern
            //string wbsOrders = "no order";
            ArrayList ekknEntry = new ArrayList();
            if (wbsExtern != "none")
            {
              ekknEntry = SAPReadEKKN(dest, repo, wbsIntern);
            }
            if(ekknEntry.Count> 0){
              foreach (string order in ekknEntry)
              {
                List<object> EKPOLines = new List<object>();
                EKPOLines = SAPReadEKPO(dest, repo, order);
                foreach(EKPO pos in EKPOLines){
                  wbs.Add(wbsReadable + "|" + wbsIntern + "|" + wbsExtern + "|" + pos.EBELN + "|" + pos.EBELP + "|" + pos.MATNR + "|" + pos.TXZ01 + "|" + pos.MENGE + "|" + pos.MEINS);
                }
              }
            }

            //if (wbsOrders != "no order"){
            //  wbs.Add(wbsReadable + "|" + wbsIntern + "|" + wbsExtern + "|" + wbsOrders);
            //}            
          }
        }
      }
      catch (Exception ex)
      {
        wbs.Add(ex.Message);
      }
      return wbs;
    }
    public static List<object> GetProjectDetail1(String prj)
    {
      string wbsReadable;
      List<object> wbs = new List<object>();
      try
      {
        RfcDestination dest = RfcDestinationManager.GetDestination(Convert.ToString(HttpContext.Current.Session["ENV"]));
        RfcRepository repo = dest.Repository;
        IRfcFunction prjBapi1 = repo.CreateFunction("BAPI_PROJECTDEF_GETDETAIL");
        prjBapi1.SetValue("CURRENTEXTERNALPROJE", prj);
        prjBapi1.SetValue("CURRENTINTERNALPROJE", "");
        prjBapi1.Invoke(dest);
        IRfcStructure detData1 = prjBapi1.GetStructure("PROJECT_DEFINITION_STRU");
        IRfcStructure retData1 = prjBapi1.GetStructure("RETURN");
        if (retData1.GetString("MESSAGE") != "")
        {
          wbs.Add(new ProjDetail { WBSNAME = prj, TXZ01 = retData1.GetString("MESSAGE") });
        }
        else
        {
          wbs.Add(new ProjDetail { WBSNAME = prj, TXZ01 = detData1.GetString("DESCRIPTION") });

          IRfcFunction wbsBapi = repo.CreateFunction("BBP_PS_PROJECT_GET_LIST");
          IRfcStructure wbsSelect = wbsBapi.GetStructure("I_PS_SEL");
          wbsSelect.SetValue("PROJ_DEF", prj);
          wbsBapi.Invoke(dest);
          IRfcTable wbsData = wbsBapi.GetTable("ET_RSTHIE");
          for (int i = 0; i < wbsData.Count; i++)
          {
            wbsReadable = wbsData[i].GetString("NAME");
            string wbsIntern = wbsReadable.Substring(2);
            // read PRPS with PSPNR = wbsIntern
            string wbsExtern = SAPReadPRPS(dest, repo, wbsIntern);
            // read EKKN with PS_PSP_PNR = wbsExtern
            //string wbsOrders = "no order";
            ArrayList ekknEntry = new ArrayList();
            if (wbsExtern != "none")
            {
              ekknEntry = SAPReadEKKN(dest, repo, wbsIntern);
            }
            if (ekknEntry.Count > 0)
            {
              foreach (string order in ekknEntry)
              {
                List<object> EKPOLines = new List<object>();
                EKPOLines = SAPReadEKPO(dest, repo, order);
                foreach (EKPO pos in EKPOLines)
                {
                  wbs.Add(new ProjDetail { WBSNAME = wbsReadable, WBSINT = wbsIntern, WBSEXT = wbsExtern, EBELN = pos.EBELN, EBELP = pos.EBELP, MATNR = pos.MATNR, TXZ01 = pos.TXZ01, MENGE = pos.MENGE, MEINS = pos.MEINS });
                }
              }
            }
          }
        }
      }
      catch (Exception ex)
      {
        wbs.Add(new ProjDetail { WBSNAME = prj, TXZ01 = ex.Message });
      }
      return wbs;
    }
    public static List<object> GetCustomerProjects(String customer)
    {
      List<object> orders = new List<object>();
      List<object> orderlines = new List<object>();
      try
      {
        RfcDestination dest = RfcDestinationManager.GetDestination(Convert.ToString(HttpContext.Current.Session["ENV"]));
        RfcRepository repo = dest.Repository;
        // get the orders for this customer from VBAK
        orders = SAPReadVBAK(dest, repo, customer.PadLeft(10, '0'));
        if (orders.Count > 0)
        {
          orderlines = SAPReadVBAP(dest, repo, customer.PadLeft(10, '0'), orders);
        }
      }
      catch (Exception ex)
      {
        orderlines.Add(ex.Message);
      }
      return orderlines;
    }
    public static string SAPReadPRPS(RfcDestination dest, RfcRepository repo, String intern)
    {
      string wbsExtern = "none";
      IRfcFunction readTablePRPS = repo.CreateFunction("RFC_READ_TABLE");
      readTablePRPS.SetValue("QUERY_TABLE", "PRPS");
      readTablePRPS.SetValue("DELIMITER", "|");
      IRfcTable fields = readTablePRPS.GetTable("FIELDS");
      fields.Append();
      fields.SetValue("FIELDNAME", "POSID");
      IRfcTable options = readTablePRPS.GetTable("OPTIONS");
      options.Append();
      options.SetValue("TEXT", "PSPNR = '" + intern + "'");
      readTablePRPS.Invoke(dest);
      ArrayList prpsEntry = new ArrayList();
      IRfcTable resultTable = readTablePRPS.GetTable("DATA");
      if (resultTable.Count > 0)
      {
        foreach (IRfcStructure row in resultTable)
        {
          wbsExtern = row.GetValue("WA").ToString();
        }
      }
      return wbsExtern;
    }
    public static string SAPReadPRPSObj(RfcDestination dest, RfcRepository repo, String intern)
    {
      string wbsExtern = "none";
      IRfcFunction readTablePRPS = repo.CreateFunction("RFC_READ_TABLE");
      readTablePRPS.SetValue("QUERY_TABLE", "PRPS");
      readTablePRPS.SetValue("DELIMITER", "|");
      IRfcTable fields = readTablePRPS.GetTable("FIELDS");
      fields.Append();
      fields.SetValue("FIELDNAME", "POSID");
      IRfcTable options = readTablePRPS.GetTable("OPTIONS");
      options.Append();
      options.SetValue("TEXT", "OBJNR like '%" + intern + "'");
      readTablePRPS.Invoke(dest);
      ArrayList prpsEntry = new ArrayList();
      IRfcTable resultTable = readTablePRPS.GetTable("DATA");
      if (resultTable.Count > 0)
      {
        foreach (IRfcStructure row in resultTable)
        {
          wbsExtern = row.GetValue("WA").ToString();
        }
      }
      return wbsExtern;
    }
    public static ArrayList SAPReadEKKN(RfcDestination dest, RfcRepository repo, String intern)
    {
      string wbsSingleOrder = "none";
      //string wbsOrders = "no order";
      IRfcFunction readTableEKKN = repo.CreateFunction("RFC_READ_TABLE");
      readTableEKKN.SetValue("QUERY_TABLE", "EKKN");
      readTableEKKN.SetValue("DELIMITER", "|");
      IRfcTable fields = readTableEKKN.GetTable("FIELDS");
      fields.Append();
      fields.SetValue("FIELDNAME", "EBELN");
      IRfcTable options = readTableEKKN.GetTable("OPTIONS");
      options.Append();
      options.SetValue("TEXT", "PS_PSP_PNR = '" + intern + "'");
      //options.SetValue("TEXT", "PS_PSP_PNR = '00064258'"); 
      readTableEKKN.Invoke(dest);
      ArrayList ekknEntry = new ArrayList();
      IRfcTable resultTable = readTableEKKN.GetTable("DATA");
      if (resultTable.Count > 0)
      {
        foreach (IRfcStructure row in resultTable)
        {
          wbsSingleOrder = row.GetValue("WA").ToString();
          if(!wbsSingleOrder.Contains("/"))
          {
            if(!ekknEntry.Contains(wbsSingleOrder))
            {
              ekknEntry.Add(wbsSingleOrder);
            }            
          }
        }
        //foreach (string order in ekknEntry)
        //{
        //  wbsOrders = wbsOrders + order + ",";
        //}
      }
      return ekknEntry;
    }
    public static List<object> SAPReadEKPO(RfcDestination dest, RfcRepository repo, String order)
    {
      List<object> EKPOLines = new List<object>();
      IRfcFunction readTableEKPO = repo.CreateFunction("RFC_READ_TABLE");
      readTableEKPO.SetValue("QUERY_TABLE", "EKPO");
      readTableEKPO.SetValue("DELIMITER", "|");
      IRfcTable fields = readTableEKPO.GetTable("FIELDS");
      fields.Append();
      fields.SetValue("FIELDNAME", "EBELP");
      fields.Append();
      fields.SetValue("FIELDNAME", "MATNR");
      fields.Append();
      fields.SetValue("FIELDNAME", "TXZ01");
      fields.Append();
      fields.SetValue("FIELDNAME", "MENGE");
      fields.Append();
      fields.SetValue("FIELDNAME", "MEINS");
      IRfcTable options = readTableEKPO.GetTable("OPTIONS");
      options.Append();
      options.SetValue("TEXT", "EBELN = '" + order + "'");
      readTableEKPO.Invoke(dest);
      IRfcTable resultTable = readTableEKPO.GetTable("DATA");
      if (resultTable.Count > 0)
      {
        foreach (IRfcStructure row in resultTable)
        {
          string[] result = row.GetValue("WA").ToString().Split('|');
          EKPOLines.Add(new EKPO { EBELN = order, EBELP = result[0], MATNR = result[1], TXZ01 = result[2], MENGE = result[3], MEINS = result[4] });
        }
      }
      return EKPOLines;
    }
    public static string SAPReadKNA1(RfcDestination dest, RfcRepository repo, String customer)
    {
      if (dest == null)
      {
        dest = RfcDestinationManager.GetDestination(Convert.ToString(HttpContext.Current.Session["ENV"]));
        repo = dest.Repository;
      }
      string customerName = "none";
      //string wbsOrders = "no order";
      IRfcFunction readTableKNA1 = repo.CreateFunction("RFC_READ_TABLE");
      readTableKNA1.SetValue("QUERY_TABLE", "KNA1");
      readTableKNA1.SetValue("DELIMITER", "|");
      IRfcTable fields = readTableKNA1.GetTable("FIELDS");
      fields.Append();
      fields.SetValue("FIELDNAME", "NAME1");
      IRfcTable options = readTableKNA1.GetTable("OPTIONS");
      options.Append();
      options.SetValue("TEXT", "KUNNR = '" + customer + "'");
      readTableKNA1.Invoke(dest);
      IRfcTable resultTable = readTableKNA1.GetTable("DATA");
      if (resultTable.Count > 0)
      {
        foreach (IRfcStructure row in resultTable)
        {
          customerName = row.GetValue("WA").ToString();
          break;
        }
      }
      return customerName;
    }
    public static List<object> SAPReadVBAK(RfcDestination dest , RfcRepository repo, String customer)
    {
      string vkOrg = "IT50";
      if (dest == null){
        dest = RfcDestinationManager.GetDestination(Convert.ToString(HttpContext.Current.Session["ENV"]));
        repo = dest.Repository;
      }
      List<object> VBAKLines = new List<object>();
      IRfcFunction readTableVBAK = repo.CreateFunction("RFC_READ_TABLE");
      readTableVBAK.SetValue("QUERY_TABLE", "VBAK");
      readTableVBAK.SetValue("DELIMITER", "|");
      IRfcTable fields = readTableVBAK.GetTable("FIELDS");
      fields.Append();
      fields.SetValue("FIELDNAME", "KUNNR");
      fields.Append();
      fields.SetValue("FIELDNAME", "VBELN");
      fields.Append();
      fields.SetValue("FIELDNAME", "AUDAT");
      IRfcTable options = readTableVBAK.GetTable("OPTIONS");
      options.Append();
      options.SetValue("TEXT", "KUNNR = '" + customer + "' and VKORG = '" + vkOrg + "'");
      readTableVBAK.Invoke(dest);
      IRfcTable resultTable = readTableVBAK.GetTable("DATA");
      if (resultTable.Count > 0)
      {
        foreach (IRfcStructure row in resultTable)
        {
          string[] result = row.GetValue("WA").ToString().Split('|');
          VBAKLines.Add(new VBAK { KUNNR = result[0], VBELN = result[1], AUDAT = result[2] });
        }
      }
      return VBAKLines;
    }
    public static List<object> SAPReadVBAP(RfcDestination dest, RfcRepository repo, String customer, List<object> VBAKLines)
    {
      List<object> CustProj = new List<object>();
      // get the name for this customer from KNA1
      string custName = SAPReadKNA1(dest, repo, customer);
      CustProj.Add(new CustProj { VBELN = custName, PS_PSP_PNR = "" });
      foreach(VBAK order in VBAKLines)
      {
        // read now all order positions
        IRfcFunction readTableVBAP = repo.CreateFunction("RFC_READ_TABLE");
        readTableVBAP.SetValue("QUERY_TABLE", "VBAP");
        readTableVBAP.SetValue("DELIMITER", "|");
        IRfcTable fields = readTableVBAP.GetTable("FIELDS");
        fields.Append();
        fields.SetValue("FIELDNAME", "VBELN");
        fields.Append();
        fields.SetValue("FIELDNAME", "POSNR");
        fields.Append();
        fields.SetValue("FIELDNAME", "MATNR");
        fields.Append();
        fields.SetValue("FIELDNAME", "PS_PSP_PNR");
        fields.Append();
        fields.SetValue("FIELDNAME", "ARKTX");
        fields.Append();
        fields.SetValue("FIELDNAME", "KWMENG");
        fields.Append();
        fields.SetValue("FIELDNAME", "MEINS");
        fields.Append();
        fields.SetValue("FIELDNAME", "NETPR");
        IRfcTable options = readTableVBAP.GetTable("OPTIONS");
        options.Append();
        options.SetValue("TEXT", "VBELN = '" + order.VBELN.PadLeft(10, '0') + "'");
        readTableVBAP.Invoke(dest);
        IRfcTable resultTable = readTableVBAP.GetTable("DATA");
        if (resultTable.Count > 0)
        {
          foreach (IRfcStructure row in resultTable)
          {
            string[] result = row.GetValue("WA").ToString().Split('|');
            if (result[3] != "00000000")
            {
              string psp1 = SAPReadPRPSObj(dest, repo, result[3]);
              CustProj.Add(new CustProj { VBELN = result[0], PS_PSP_PNR = psp1.Substring(0, 2) + "-" + psp1.Substring(3, 7) });
              break;
            }
          }
        }
      }
      return CustProj;
    }
    public static string GetOrderCustomer(String order)
    {
      string customerNr = "none";
      // read sales partner from VBPA
      RfcDestination dest = RfcDestinationManager.GetDestination(Convert.ToString(HttpContext.Current.Session["ENV"]));
      RfcRepository repo = dest.Repository;
      IRfcFunction readTableVBAP = repo.CreateFunction("RFC_READ_TABLE");
      readTableVBAP.SetValue("QUERY_TABLE", "VBPA");
      readTableVBAP.SetValue("DELIMITER", "|");
      IRfcTable fields = readTableVBAP.GetTable("FIELDS");
      fields.Append();
      fields.SetValue("FIELDNAME", "KUNNR");
      IRfcTable options = readTableVBAP.GetTable("OPTIONS");
      options.Append();
      options.SetValue("TEXT", "VBELN = '" + order.PadLeft(10, '0') + "' and PARVW = 'SP'");
      readTableVBAP.Invoke(dest);
      IRfcTable resultTable = readTableVBAP.GetTable("DATA");
      if (resultTable.Count > 0)
      {
        foreach (IRfcStructure row in resultTable)
        {
          customerNr = row.GetValue("WA").ToString();
          break;
        }
      }
      return customerNr;
    }
    public static List<object> GetOrderDetail(String order)
    {
      List<object> orderDetail = new List<object>();
      // read now all order positions
      RfcDestination dest = RfcDestinationManager.GetDestination(Convert.ToString(HttpContext.Current.Session["ENV"]));
      RfcRepository repo = dest.Repository;
      IRfcFunction readTableVBAP = repo.CreateFunction("RFC_READ_TABLE");
      readTableVBAP.SetValue("QUERY_TABLE", "VBAP");
      readTableVBAP.SetValue("DELIMITER", "|");
      IRfcTable fields = readTableVBAP.GetTable("FIELDS");
      fields.Append();
      fields.SetValue("FIELDNAME", "VBELN");
      fields.Append();
      fields.SetValue("FIELDNAME", "POSNR");
      fields.Append();
      fields.SetValue("FIELDNAME", "MATNR");
      fields.Append();
      fields.SetValue("FIELDNAME", "PS_PSP_PNR");
      fields.Append();
      fields.SetValue("FIELDNAME", "ARKTX");
      fields.Append();
      fields.SetValue("FIELDNAME", "KWMENG");
      fields.Append();
      fields.SetValue("FIELDNAME", "MEINS");
      fields.Append();
      fields.SetValue("FIELDNAME", "NETPR");
      fields.Append();
      fields.SetValue("FIELDNAME", "ZZTAG");
      fields.Append();
      fields.SetValue("FIELDNAME", "ZZTARNOR");
      fields.Append();
      fields.SetValue("FIELDNAME", "ZZTARBAN");
      fields.Append();
      fields.SetValue("FIELDNAME", "ZZPRESET");
      fields.Append();
      fields.SetValue("FIELDNAME", "ZZPREGEN");
      fields.Append();
      fields.SetValue("FIELDNAME", "ZZPRETOT");
      fields.Append();
      fields.SetValue("FIELDNAME", "ZZPREMOL");
      fields.Append();
      fields.SetValue("FIELDNAME", "ZZSPRING");
      IRfcTable options = readTableVBAP.GetTable("OPTIONS");
      options.Append();
      options.SetValue("TEXT", "VBELN = '" + order.PadLeft(10, '0') + "'");
      readTableVBAP.Invoke(dest);
      IRfcTable resultTable = readTableVBAP.GetTable("DATA");
      if (resultTable.Count > 0)
      {
        foreach (IRfcStructure row in resultTable)
        {
          string[] result = row.GetValue("WA").ToString().Split('|');
          orderDetail.Add(new VBAP { VBELN = result[0], POSNR = result[1], MATNR = result[2], PS_PSP_PNR = result[3], ARKTX = result[4], MENGE = result[5], MEINS = result[6], NETPR = result[7], ZZTAG = result[8], ZZTARNOR = result[9], ZZTARBAN = result[10], ZZPRESET = result[11], ZZPREGEN = result[12], ZZPRETOT = result[13], ZZPREMOL = result[14], ZZSPRING = result[15] });
        }
      }
      return orderDetail;
    }
    public static List<object> GetSingleOrderDetail(String order, string line)
    {
      List<object> orderDetail = new List<object>();
      // read now all order positions
      RfcDestination dest = RfcDestinationManager.GetDestination(Convert.ToString(HttpContext.Current.Session["ENV"]));
      RfcRepository repo = dest.Repository;
      IRfcFunction readTableVBAP = repo.CreateFunction("RFC_READ_TABLE");
      readTableVBAP.SetValue("QUERY_TABLE", "VBAP");
      readTableVBAP.SetValue("DELIMITER", "|");
      IRfcTable fields = readTableVBAP.GetTable("FIELDS");
      fields.Append();
      fields.SetValue("FIELDNAME", "VBELN");
      fields.Append();
      fields.SetValue("FIELDNAME", "POSNR");
      fields.Append();
      fields.SetValue("FIELDNAME", "MATNR");
      fields.Append();
      fields.SetValue("FIELDNAME", "PS_PSP_PNR");
      fields.Append();
      fields.SetValue("FIELDNAME", "ARKTX");
      fields.Append();
      fields.SetValue("FIELDNAME", "KWMENG");
      fields.Append();
      fields.SetValue("FIELDNAME", "MEINS");
      fields.Append();
      fields.SetValue("FIELDNAME", "NETPR");
      fields.Append();
      fields.SetValue("FIELDNAME", "ZZTAG");
      fields.Append();
      fields.SetValue("FIELDNAME", "ZZTARNOR");
      fields.Append();
      fields.SetValue("FIELDNAME", "ZZTARBAN");
      fields.Append();
      fields.SetValue("FIELDNAME", "ZZPRESET");
      fields.Append();
      fields.SetValue("FIELDNAME", "ZZPREGEN");
      fields.Append();
      fields.SetValue("FIELDNAME", "ZZPRETOT");
      fields.Append();
      fields.SetValue("FIELDNAME", "ZZPREMOL");
      fields.Append();
      fields.SetValue("FIELDNAME", "ZZSPRING");
      IRfcTable options = readTableVBAP.GetTable("OPTIONS");
      options.Append();
      options.SetValue("TEXT", "VBELN = '" + order.PadLeft(10, '0') + "'");
      options.Append();
      options.SetValue("TEXT", "AND POSNR = '" + line + "'");
      readTableVBAP.Invoke(dest);
      IRfcTable resultTable = readTableVBAP.GetTable("DATA");
      if (resultTable.Count > 0)
      {
        foreach (IRfcStructure row in resultTable)
        {
          string[] result = row.GetValue("WA").ToString().Split('|');
          orderDetail.Add(new VBAP { VBELN = result[0], POSNR = result[1], MATNR = result[2], PS_PSP_PNR = result[3], ARKTX = result[4], MENGE = result[5], MEINS = result[6], NETPR = result[7], ZZTAG = result[8], ZZTARNOR = result[9], ZZTARBAN = result[10], ZZPRESET = result[11], ZZPREGEN = result[12], ZZPRETOT = result[13], ZZPREMOL = result[14], ZZSPRING = result[15] });
        }
      }
      return orderDetail;
    }
    public static List<object> GetProductionOrderDetail(String order)
    {
      List<object> orderDetail = new List<object>();
      string itemDsc = "";
      // read now all order positions
      RfcDestination dest = RfcDestinationManager.GetDestination(Convert.ToString(HttpContext.Current.Session["ENV"]));
      RfcRepository repo = dest.Repository;
      IRfcFunction readTableVBAP = repo.CreateFunction("RFC_READ_TABLE");
      readTableVBAP.SetValue("QUERY_TABLE", "AFPO");
      readTableVBAP.SetValue("DELIMITER", "|");
      IRfcTable fields = readTableVBAP.GetTable("FIELDS");
      fields.Append();
      fields.SetValue("FIELDNAME", "MATNR");
      fields.Append();
      fields.SetValue("FIELDNAME", "GSBTR");
      fields.Append();
      fields.SetValue("FIELDNAME", "VFMNG");
      fields.Append();
      fields.SetValue("FIELDNAME", "MEINS");
      fields.Append();
      fields.SetValue("FIELDNAME", "CHARG");
      IRfcTable options = readTableVBAP.GetTable("OPTIONS");
      options.Append();
      options.SetValue("TEXT", "AUFNR = '" + order.PadLeft(12, '0') + "'");
      readTableVBAP.Invoke(dest);
      IRfcTable resultTable = readTableVBAP.GetTable("DATA");
      if (resultTable.Count > 0)
      {
        foreach (IRfcStructure row in resultTable)
        {
          string[] result = row.GetValue("WA").ToString().Split('|');
          itemDsc = SAPReadMAKT(result[0]);
          orderDetail.Add(new AFPO { DESCRIPTION = itemDsc, AUFNR = order, MATNR = result[0], GSBTR = result[1], VFMNG = result[2], MEINS = result[3], CHARG = result[4] });
        }
      }
      return orderDetail;
    }
    public static string SAPReadVBAP(String order, string line)
    {
      string irrePos = "";
      line = line.Trim();
      order = order.Trim();
      // read now object for order line
      RfcDestination dest = RfcDestinationManager.GetDestination(Convert.ToString(HttpContext.Current.Session["ENV"]));
      RfcRepository repo = dest.Repository;
      IRfcFunction readTableVBAP = repo.CreateFunction("RFC_READ_TABLE");
      readTableVBAP.SetValue("QUERY_TABLE", "VBAP");
      readTableVBAP.SetValue("DELIMITER", "|");
      IRfcTable fields = readTableVBAP.GetTable("FIELDS");
      fields.Append();
      fields.SetValue("FIELDNAME", "POSNR");
      IRfcTable options = readTableVBAP.GetTable("OPTIONS");
      options.Append();
      options.SetValue("TEXT", "VBELN  = '" + order.PadLeft(10, '0') + "' AND UEPOS = '" + line.PadLeft(6, '0') + "' AND PSTYV = 'IRRE'");
      readTableVBAP.Invoke(dest);
      IRfcTable resultTable = readTableVBAP.GetTable("DATA");
      if (resultTable.Count > 0)
      {
        foreach (IRfcStructure row in resultTable)
        {
          irrePos = row.GetValue("WA").ToString();
        }
      }
      return irrePos;
    }
    public static string SAPReadSER02(String order, string line)
    {
      string objectNr = "";
      line = line.Trim();
      order = order.Trim();
      // read now object for order line
      RfcDestination dest = RfcDestinationManager.GetDestination(Convert.ToString(HttpContext.Current.Session["ENV"]));
      RfcRepository repo = dest.Repository;
      IRfcFunction readTableSER02 = repo.CreateFunction("RFC_READ_TABLE");
      readTableSER02.SetValue("QUERY_TABLE", "SER02");
      readTableSER02.SetValue("DELIMITER", "|");
      IRfcTable fields = readTableSER02.GetTable("FIELDS");
      fields.Append();
      fields.SetValue("FIELDNAME", "OBKNR");
      IRfcTable options = readTableSER02.GetTable("OPTIONS");
      options.Append();
      options.SetValue("TEXT", "SDAUFNR = '" + order.PadLeft(10, '0') + "' AND POSNR = " + line.PadLeft(6, '0'));
      readTableSER02.Invoke(dest);
      IRfcTable resultTable = readTableSER02.GetTable("DATA");
      if (resultTable.Count > 0)
      {
        foreach (IRfcStructure row in resultTable)
        {
          objectNr = row.GetValue("WA").ToString();
        }
      }
      return objectNr;
    }
    public static string SAPReadSER05(String order)
    {
      string objectNr = "";
      order = order.Trim();
      // read now object for order line
      RfcDestination dest = RfcDestinationManager.GetDestination(Convert.ToString(HttpContext.Current.Session["ENV"]));
      RfcRepository repo = dest.Repository;
      IRfcFunction readTableSER05 = repo.CreateFunction("RFC_READ_TABLE");
      readTableSER05.SetValue("QUERY_TABLE", "SER05");
      readTableSER05.SetValue("DELIMITER", "|");
      IRfcTable fields = readTableSER05.GetTable("FIELDS");
      fields.Append();
      fields.SetValue("FIELDNAME", "OBKNR");
      IRfcTable options = readTableSER05.GetTable("OPTIONS");
      options.Append();
      options.SetValue("TEXT", "PPAUFNR = '" + order.PadLeft(12, '0') + "'");
      readTableSER05.Invoke(dest);
      IRfcTable resultTable = readTableSER05.GetTable("DATA");
      if (resultTable.Count > 0)
      {
        foreach (IRfcStructure row in resultTable)
        {
          objectNr = row.GetValue("WA").ToString();
        }
      }
      return objectNr;
    }
    public static List<object> GetSerials(String objectNr)
    {
      List<object> lineSerials = new List<object>();
      // read now all serials for an order positions
      RfcDestination dest = RfcDestinationManager.GetDestination(Convert.ToString(HttpContext.Current.Session["ENV"]));
      RfcRepository repo = dest.Repository;
      IRfcFunction readTableOBJK = repo.CreateFunction("RFC_READ_TABLE");
      readTableOBJK.SetValue("QUERY_TABLE", "OBJK");
      readTableOBJK.SetValue("DELIMITER", "|");
      IRfcTable fields = readTableOBJK.GetTable("FIELDS");
      fields.Append();
      fields.SetValue("FIELDNAME", "SERNR");
      IRfcTable options = readTableOBJK.GetTable("OPTIONS");
      options.Append();
      options.SetValue("TEXT", "OBKNR = '" + objectNr + "'");
      readTableOBJK.Invoke(dest);
      IRfcTable resultTable = readTableOBJK.GetTable("DATA");
      if (resultTable.Count > 0)
      {
        foreach (IRfcStructure row in resultTable)
        {
          string[] result = row.GetValue("WA").ToString().Split('|');
          lineSerials.Add(result[0]);
        }
      }
      return lineSerials;
    }
    public static string SAPReadMAKT(String material)
    {
      bool isNumeric = int.TryParse(material, out _);
      if (isNumeric)
      {
        material = material.PadLeft(18, '0');
      }
      RfcDestination dest = RfcDestinationManager.GetDestination(Convert.ToString(HttpContext.Current.Session["ENV"]));
      RfcRepository repo = dest.Repository;
      IRfcFunction readTableMAKT = repo.CreateFunction("RFC_READ_TABLE");
      readTableMAKT.SetValue("QUERY_TABLE", "MAKT");
      readTableMAKT.SetValue("DELIMITER", "|");
      IRfcTable fields = readTableMAKT.GetTable("FIELDS");
      fields.Append();
      fields.SetValue("FIELDNAME", "MAKTX");
      IRfcTable options = readTableMAKT.GetTable("OPTIONS");
      options.Append();
      options.SetValue("TEXT", "MATNR = '" + material + "'");
      options.Append();
      options.SetValue("TEXT", "AND SPRAS = 'E'");
      readTableMAKT.Invoke(dest);
      IRfcTable resultTable = readTableMAKT.GetTable("DATA");
      string retValue = "";
      foreach (IRfcStructure row in resultTable)
      {
        retValue = row.GetValue("WA").ToString();
      }
      return retValue;
    }
    public static string GetMaterialClass(String material)
    {
      try
      {
        RfcDestination dest = RfcDestinationManager.GetDestination(Convert.ToString(HttpContext.Current.Session["ENV"]));
        RfcRepository repo = dest.Repository;
        IRfcFunction matClassBapi = repo.CreateFunction("BAPI_OBJCL_GETCLASSES");
        matClassBapi.SetValue("OBJECTKEY_IMP", material);
        matClassBapi.SetValue("OBJECTTABLE_IMP", "MARA");
        matClassBapi.SetValue("CLASSTYPE_IMP", "001");
        matClassBapi.Invoke(dest);
        IRfcTable resultTable = matClassBapi.GetTable("ALLOCLIST");
        String matClass = "";
        if (resultTable.Count > 0)
        {
          foreach (IRfcStructure row in resultTable)
          {
            matClass = row.GetValue("CLASSNUM").ToString();
            break;
          }
        }
        return matClass;
      }
      catch (Exception ex)
      {
        // next you should handle all the relevant exceptions, but          
        // we will not do this here
        //        Alert.Show("SAP GetMatClass failed: " + ex.Message);
        return ex.Message;
      }
    }
    public static List<object> GetClassCharacteristics(String cls, String material)
    {
      List<object> charEntries = new List<object>();
      try
      {
        RfcDestination dest = RfcDestinationManager.GetDestination(Convert.ToString(HttpContext.Current.Session["ENV"]));
        RfcRepository repo = dest.Repository;
        IRfcFunction getChar = repo.CreateFunction("BAPI_OBJCL_GETDETAIL");
        getChar.SetValue("OBJECTKEY", material);
        getChar.SetValue("OBJECTTABLE", "MARA");
        getChar.SetValue("CLASSNUM", cls);
        getChar.SetValue("CLASSTYPE", "001");
        getChar.SetValue("LANGUAGE", "EN");
        getChar.Invoke(dest);
        IRfcTable resultTableNum = getChar.GetTable("ALLOCVALUESNUM");
        IRfcTable resultTableAlp = getChar.GetTable("ALLOCVALUESCHAR");
        if (resultTableNum.Count > 0)
        {
          foreach (IRfcStructure row in resultTableNum)
          {
            charEntries.Add(new MClass { CNAME = row.GetValue("CHARACT").ToString(), CVALUE = row.GetValue("VALUE_FROM").ToString(), CDESC = row.GetValue("CHARACT_DESCR").ToString() });
          }
        }
        if (resultTableAlp.Count > 0)
        {
          foreach (IRfcStructure row in resultTableAlp)
          {
            charEntries.Add(new MClass { CNAME = row.GetValue("CHARACT").ToString(), CVALUE = row.GetValue("VALUE_CHAR").ToString(), CDESC = row.GetValue("CHARACT_DESCR").ToString() });
          }
        }
      }
      catch (Exception ex)
      {
        charEntries.Add(new MClass { CNAME = cls, CVALUE = "ERROR", CDESC = ex.Message });
      }
      return charEntries;
    }
    public static List<object> GetOrdersF007(String order, string customer)
    {
      List<object> orderDetail = new List<object>();
      string[] result1 = { "" };
      // read now all order positions
      RfcDestination dest = RfcDestinationManager.GetDestination(Convert.ToString(HttpContext.Current.Session["ENV"]));
      RfcRepository repo = dest.Repository;
      IRfcFunction readTableZP007F = repo.CreateFunction("RFC_READ_TABLE");
      readTableZP007F.SetValue("QUERY_TABLE", "ZP007F");
      readTableZP007F.SetValue("DELIMITER", "|");
      IRfcTable fields = readTableZP007F.GetTable("FIELDS");
      // 1st part
      fields.Append();
      fields.SetValue("FIELDNAME", "VBELN");
      fields.Append();
      fields.SetValue("FIELDNAME", "POSNR");
      fields.Append();
      fields.SetValue("FIELDNAME", "MATNR");
      fields.Append();
      fields.SetValue("FIELDNAME", "DESCRIPTION");
      fields.Append();
      fields.SetValue("FIELDNAME", "KWMENG");
      fields.Append();
      fields.SetValue("FIELDNAME", "MEINS");
      fields.Append();
      fields.SetValue("FIELDNAME", "ERDAT"); // creation date
      fields.Append();
      fields.SetValue("FIELDNAME", "KUNNR");
      fields.Append();
      fields.SetValue("FIELDNAME", "NAME1");
      fields.Append();
      fields.SetValue("FIELDNAME", "PSTYV"); 
      fields.Append();
      fields.SetValue("FIELDNAME", "KDMAT");
      fields.Append();
      fields.SetValue("FIELDNAME", "CHARG");
      IRfcTable options = readTableZP007F.GetTable("OPTIONS");
      options.Append();
      if (customer != "")
      {
        options.SetValue("TEXT", "KUNNR = '" + customer.PadLeft(10, '0') + "'");
      }
      else
      {
        options.SetValue("TEXT", "VBELN = '" + order + "'");
      }
      readTableZP007F.Invoke(dest);
      IRfcTable resultTable = readTableZP007F.GetTable("DATA");
      if (resultTable.Count > 0)
      {
        foreach (IRfcStructure row1 in resultTable)
        {
          result1 = row1.GetValue("WA").ToString().Split('|');
          orderDetail.Add(new F007
          {
            VBELN = result1[0],
            POSNR = result1[1],
            MATNR = result1[2],
            DESCRIPTION = result1[3],
            KWMENG = result1[4],
            MEINS = result1[5],
            ERDAT = result1[6],
            KUNNR = result1[7],
            NAME1 = result1[8],
            PSTYV = result1[9],
            KDMAT = result1[10],
            CHARG = result1[11]
          });
        }
      }
      return orderDetail;
    }
    public static List<object> GetOrderDetailF007(String order, string line, string customer)
    {
      List<object> orderDetail = new List<object>();
      string[] result1 = {""};
      string[] result2 = {""};
      // read now all order positions
      RfcDestination dest = RfcDestinationManager.GetDestination(Convert.ToString(HttpContext.Current.Session["ENV"]));
      RfcRepository repo = dest.Repository;
      IRfcFunction readTableZP007F = repo.CreateFunction("RFC_READ_TABLE");
      readTableZP007F.SetValue("QUERY_TABLE", "ZP007F");
      readTableZP007F.SetValue("DELIMITER", "|");
      IRfcTable fields = readTableZP007F.GetTable("FIELDS");
// 1st part
      fields.Append();
      fields.SetValue("FIELDNAME", "VBELN");
      fields.Append();
      fields.SetValue("FIELDNAME", "POSNR");
      fields.Append();
      fields.SetValue("FIELDNAME", "MATNR");
      fields.Append();
      fields.SetValue("FIELDNAME", "DESCRIPTION");
      fields.Append();
      fields.SetValue("FIELDNAME", "EDATU"); // delivery date
      fields.Append();
      fields.SetValue("FIELDNAME", "ERDAT"); // creation date
      fields.Append();
      fields.SetValue("FIELDNAME", "KWMENG");
      fields.Append();
      fields.SetValue("FIELDNAME", "MEINS");
      fields.Append();
      fields.SetValue("FIELDNAME", "AUFNR"); // ordine produzione
      fields.Append();
      fields.SetValue("FIELDNAME", "BSTKD"); // ordine cliente
      fields.Append();
      fields.SetValue("FIELDNAME", "KUNNR");
      fields.Append();
      fields.SetValue("FIELDNAME", "NAME1");
      fields.Append();
      fields.SetValue("FIELDNAME", "PSTYV");
      fields.Append();
      fields.SetValue("FIELDNAME", "KDMAT");
      IRfcTable options = readTableZP007F.GetTable("OPTIONS");
      options.Append();
      if (customer != "")
      {
        options.SetValue("TEXT", "KUNNR = '" + customer.PadLeft(10, '0') + "'");
      }
      else
      {
        if (line != "")
        {
          line = line.Trim();
          order = order.Trim();
          options.SetValue("TEXT", "ZZBELPOS = '" + order.PadLeft(10, '0') + line.PadLeft(6, '0') + "'");
        }
        else{
          options.SetValue("TEXT", "VBELN = '" + order + "'");
        }
      }
      readTableZP007F.Invoke(dest);
      IRfcTable resultTable = readTableZP007F.GetTable("DATA");
      if (resultTable.Count > 0)
      {
        foreach (IRfcStructure row1 in resultTable)
        {
          result1 = row1.GetValue("WA").ToString().Split('|');
        }
        // get 2nd part
        resultTable.Clear();  
        fields.Clear();
        fields.Append();
        fields.SetValue("FIELDNAME", "ZZTAG");
        fields.Append();
        fields.SetValue("FIELDNAME", "ZZTARNOR");
        fields.Append();
        fields.SetValue("FIELDNAME", "ZZTARBAN");
        fields.Append();
        fields.SetValue("FIELDNAME", "ZZPRESET");
        fields.Append();
        fields.SetValue("FIELDNAME", "ZZPREGEN");
        fields.Append();
        fields.SetValue("FIELDNAME", "ZZPRETOT");
        fields.Append();
        fields.SetValue("FIELDNAME", "ZZPREMOL");
        fields.Append();
        fields.SetValue("FIELDNAME", "ZZSPRING");
        fields.Append();
        fields.SetValue("FIELDNAME", "ZZQP");
        fields.Append();
        fields.SetValue("FIELDNAME", "ZZITP");
        fields.Append();
        fields.SetValue("FIELDNAME", "ZZGRPFLD");
        fields.Append();
        fields.SetValue("FIELDNAME", "ZZDISFLD");
        fields.Append();
        fields.SetValue("FIELDNAME", "ZZSTATE");
        fields.Append();
        fields.SetValue("FIELDNAME", "ZZDISTEMP");
        fields.Append();
        fields.SetValue("FIELDNAME", "CHARG");
        readTableZP007F.Invoke(dest);
        IRfcTable resultTable2 = readTableZP007F.GetTable("DATA");
        if (resultTable2.Count > 0)
        {
          foreach (IRfcStructure row2 in resultTable2)
          {
            result2 = row2.GetValue("WA").ToString().Split('|');
          }
            orderDetail.Add(new F007 { VBELN = result1[0], POSNR = result1[1], MATNR = result1[2], DESCRIPTION = result1[3], EDATU = result1[4], ERDAT = result1[5],
              KWMENG = result1[6], MEINS = result1[7], AUFNR = result1[8],BSTKD = result1[9], KUNNR = result1[10], NAME1 = result1[11], PSTYV = result1[12], KDMAT = result1[13],
              ZZTAG = result2[0], ZZTARNOR = result2[1], ZZTARBAN = result2[2], ZZPRESET = result2[3], ZZPREGEN = result2[4], ZZPRETOT = result2[5], ZZPREMOL = result2[6],
              ZZSPRING = result2[7], ZZQP = result2[8], ZZITP = result2[9], ZZGRPFLD = result2[10], ZZDISFLD = result2[11], ZZSTATE = result2[12], ZZDISTEMP = result2[13],
              CHARG = result2[14]
            });
        }
      };
      return orderDetail;
    }
    public static List<string> GetOrderText(String order, string line, string tdid)
    {
      string txtReadable = "";
      line = line.Trim();
      order = order.Trim();
      List<string> orderTextLine = new List<string>();
      try
      {
        RfcDestination dest = RfcDestinationManager.GetDestination(Convert.ToString(HttpContext.Current.Session["ENV"]));
        RfcRepository repo = dest.Repository;
        IRfcFunction txtBAPI = repo.CreateFunction("RFC_READ_TEXT");
        //IRfcStructure txtLinesI = txtBAPI.GetStructure("TEXT_LINES");
        IRfcTable txtLinesI = txtBAPI.GetTable("TEXT_LINES");
        txtLinesI.Clear();
        txtLinesI.Append();
        txtLinesI.SetValue("MANDT", "100");
        txtLinesI.SetValue("TDOBJECT", "VBBP");
        txtLinesI.SetValue("TDNAME", order.PadLeft(10, '0') + line.PadLeft(6, '0'));
        txtLinesI.SetValue("TDID", tdid);
        txtLinesI.SetValue("TDSPRAS", "IT");
        txtBAPI.Invoke(dest);
        IRfcTable txtLinesO = txtBAPI.GetTable("TEXT_LINES");
        IRfcTable errMsg = txtBAPI.GetTable("MESSAGES");
        if(errMsg.Count == 0){ 
          foreach (IRfcStructure row in txtLinesO)
          {
            txtReadable = row.GetString("TDLINE");
            orderTextLine.Add(txtReadable);
          }
        }
        else {
          orderTextLine.Add("Nessun documento allegato");
        }
      }
      catch (Exception ex) 
      {
        orderTextLine.Add(ex.Message);
      }
      return orderTextLine;
    }

    // The following two are not used in this example:        
    public bool ChangeEventsSupported()
    {
      return false;
    }
    public event RfcDestinationManager.ConfigurationChangeHandler ConfigurationChanged;
  }
  public class EKPO
  {
    public string EBELN
    {
      get; set;
    }
    public string EBELP
    {
      get; set;
    }
    public string MATNR
    {
      get; set;
    }
    public string TXZ01
    {
      get; set;
    }
    public string MENGE
    {
      get; set;
    }
    public string MEINS
    {
      get; set;
    }
  }
  public class VBAK
  {
    public string KUNNR
    {
      get; set;
    }
    public string VBELN
    {
      get; set;
    }
    public string AUDAT
    {
      get; set;
    }
  }
  public class VBAP
  {
    public string VBELN
    {
      get; set;
    }
    public string POSNR
    {
      get; set;
    }
    public string MATNR
    {
      get; set;
    }
    public string PS_PSP_PNR
    {
      get; set;
    }
    public string ARKTX
    {
      get; set;
    }
    public string MENGE
    {
      get; set;
    }
    public string MEINS
    {
      get; set;
    }
    public string NETPR
    {
      get; set;
    }
    public string ZZTAG
    {
      get; set;
    }
    public string ZZTARNOR
    {
      get; set;
    }
    public string ZZTARBAN
    {
      get; set;
    }
    public string ZZPRESET
    {
      get; set;
    }
    public string ZZPREGEN
    {
      get; set;
    }
    public string ZZPRETOT
    {
      get; set;
    }
    public string ZZPREMOL
    {
      get; set;
    }
    public string ZZSPRING
    {
      get; set;
    }
  }
  public class CustProj
  {
    public string VBELN
    {
      get; set;
    }
    public string PS_PSP_PNR
    {
      get; set;
    }
  }
  public class ProjDetail
  {
    public string WBSNAME
    {
      get; set;
    }
    public string WBSINT
    {
      get; set;
    }
    public string WBSEXT
    {
      get; set;
    }
    public string EBELN
    {
      get; set;
    }
    public string EBELP
    {
      get; set;
    }
    public string MATNR
    {
      get; set;
    }
    public string TXZ01
    {
      get; set;
    }
    public string MENGE
    {
      get; set;
    }
    public string MEINS
    {
      get; set;
    }
  }
  public class MClass
  {
    public string CNAME
    {
      get; set;
    }
    public string CVALUE
    {
      get; set;
    }
    public string CDESC
    {
      get; set;
    }
  }
  public class F007
  {
    public string VBELN //Sales Document 
    {
      get; set;
    }
    public string POSNR //Sales Document Line
    {
      get; set;
    }
    public string MATNR
    {
      get; set;
    }
    public string DESCRIPTION
    {
      get; set;
    }
    public string EDATU //Created on
    {
      get; set;
    }
    public string ERDAT //Delivery Date
    {
      get; set;
    }
    public string KWMENG
    {
      get; set;
    }
    public string MEINS
    {
      get; set;
    }
    public string AUFNR // Production Order
    {
      get; set;
    }
    public string BSTKD // Customer Order
    {
      get; set;
    }
    public string KUNNR
    {
      get; set;
    }
    public string NAME1
    {
      get; set;
    }
    public string PSTYV // Item category
    {
      get; set;
    }
    public string KDMAT // Alternate Material Nr
    {
      get; set;
    }
    public string ZZTAG
    {
      get; set;
    }
    public string ZZTARNOR
    {
      get; set;
    }
    public string ZZTARBAN
    {
      get; set;
    }
    public string ZZPRESET
    {
      get; set;
    }
    public string ZZPREGEN
    {
      get; set;
    }
    public string ZZPRETOT
    {
      get; set;
    }
    public string ZZPREMOL
    {
      get; set;
    }
    public string ZZSPRING
    {
      get; set;
    }
    public string ZZQP
    {
      get; set;
    }
    public string ZZITP
    {
      get; set;
    }
    public string ZZGRPFLD
    {
      get; set;
    }
    public string ZZDISFLD
    {
      get; set;
    }
    public string ZZSTATE
    {
      get; set;
    }
    public string ZZDISTEMP
    {
      get; set;
    }
    public string CHARG
    {
      get; set;
    }
  }
  public class AFPO
  {
    public string AUFNR // Production Order
    {
      get; set;
    }
    public string MATNR
    {
      get; set;
    }
    public string DESCRIPTION
    {
      get; set;
    }
    public string GSBTR //Created on
    {
      get; set;
    }
    public string VFMNG
    {
      get; set;
    }
    public string MEINS
    {
      get; set;
    }
    public string CHARG
    {
      get; set;
    }
  }


}