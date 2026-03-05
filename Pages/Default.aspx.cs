using Microsoft.Reporting.Map.WebForms.BingMaps;
using Microsoft.Reporting.WebForms;
using SAP.Middleware.Connector;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web.Configuration;
using System.Web.UI;

namespace CertQA
{
  public partial class _Default : Page
  {
    static bool destinationIsInitialised = false;
    static string _ENV;
    static string _USR;
    static string _PWD;
    protected void Page_Load(object sender, EventArgs e)
    {
      if (!IsPostBack)
      {
        Configuration config = WebConfigurationManager.OpenWebConfiguration("~");
        _ENV = config.AppSettings.Settings["ENV"].Value;
        _USR = config.AppSettings.Settings["USR"].Value;
        _PWD = config.AppSettings.Settings["PWD"].Value;
        using (TripleDESCryptoServiceProvider tripleDESCryptoService = new TripleDESCryptoServiceProvider())
        {
          using (MD5CryptoServiceProvider hashMD5Provider = new MD5CryptoServiceProvider())
          {
            byte[] byteHash = hashMD5Provider.ComputeHash(Encoding.UTF8.GetBytes("FEMA"));
            tripleDESCryptoService.Key = byteHash;
            tripleDESCryptoService.Mode = CipherMode.ECB;
            byte[] data = Convert.FromBase64String(_PWD);
            _PWD = Encoding.UTF8.GetString(tripleDESCryptoService.CreateDecryptor().TransformFinalBlock(data, 0, data.Length));
          }
        }
        Session["ENV"] = _ENV;
        Session["USR"] = _USR;
        Session["PWD"] = _PWD;
        if (_ENV == "DEV")
        {
          lblOrder.BackColor = System.Drawing.Color.Yellow;
        }
        else if (_ENV == "UAT")
        {
          lblOrder.BackColor = System.Drawing.Color.Cyan;
        }
      }
      //cmdReport.Attributes.Add("onclick", "javascript:hourglass();");
      if (!destinationIsInitialised)
      {
        RfcDestinationManager.RegisterDestinationConfiguration(new SAPHelper());
        destinationIsInitialised = true;
      }
    }

    // FTJP
    protected void ButtonSingleOrder_Click(object sender, EventArgs e)
    {
      //Task to be done on "Next" Button Click
      string Order = tbOrder.Text;
      if (Order.Equals("")) //Checking if the Textbox is Blank or not
      {
        //Alert.Show("Enter the Order IDs");
      }
      else
      {
        Session["AppMode"] = "P"; // Production
        Session["CusName"] = "";
        Session["Cus01"] = "";
        Session["Ord01"] = Order; //To get the value of text box in Session Variable
        Session["AFPO"] = "0"; //AFPO data
        Response.Redirect("ShowSingleOrder.aspx"); // ShowSingleOrder.aspx will open when clicked on "Next" Button
      }
    }
    protected void ButtonCustomerOrdersP_Click(object sender, EventArgs e)
    {
      string Customer = tbOrder.Text;
      if (Customer.Equals("")) //Checking if the Textbox is Blank or not
      {
        //Alert.Show("Enter the Customer ID");
      }
      else
      {
        Session["AppMode"] = "P";  // Quality
        Session["CusName"] = "";
        Session["Cus01"] = Customer;
        Session["Ord01"] = "";
        Session["AFPO"] = "0"; //AFPO data
        Response.Redirect("ShowOrders.aspx"); // ShowProject.aspx will open when clicked on "Next" Button
      }
    }
    // Sales
    protected void ButtonQualityOrder_Click(object sender, EventArgs e)
    {
      string Order = tbOrder.Text;
      if (Order.Equals("")) //Checking if the Textbox is Blank or not
      {
        //Alert.Show("Enter the Customer ID");
      }
      else
      {
        Session["AppMode"] = "Q";  // Quality
        Session["CusName"] = "";
        Session["Cus01"] = "";
        Session["Ord01"] = Order; //To get the value of text box in Session Variable
        Session["AFPO"] = "0"; //AFPO data
        Response.Redirect("ShowSingleOrder.aspx"); // ShowProject.aspx will open when clicked on "Next" Button
      }
    }
    protected void ButtonCustomerOrdersQ_Click(object sender, EventArgs e)
    {
      string Customer = tbOrder.Text;
      if (Customer.Equals("")) //Checking if the Textbox is Blank or not
      {
        //Alert.Show("Enter the Customer ID");
      }
      else
      {
        Session["AppMode"] = "Q";  // Quality
        Session["CusName"] = "";
        Session["Cus01"] = Customer;
        Session["Ord01"] = "";
        Session["AFPO"] = "0"; //AFPO data
        Response.Redirect("ShowOrders.aspx"); // ShowProject.aspx will open when clicked on "Next" Button
      }
    }
    // Projects
    protected void ButtonSingleProject_Click(object sender, EventArgs e)
    {
      //Task to be done on "Next" Button Click
      string Project = tbOrder.Text;
      if (Project.Equals("")) //Checking if the Textbox is Blank or not
      {
        //Alert.Show("Enter the Project ID");
      }
      else
      {
        Session["Prj01"] = Project; //To get the value of text box in Session Variable
        Response.Redirect("ShowSingleProject.aspx"); // ShowProject.aspx will open when clicked on "Next" Button
      }
    }
    protected void ButtonCustomerProjects_Click(object sender, EventArgs e)
    {
      string Customer = tbOrder.Text;
      if (Customer.Equals("")) //Checking if the Textbox is Blank or not
      {
        //Alert.Show("Enter the Customer ID");
      }
      else
      {
        Session["Cus01"] = Customer; //To get the value of text box in Session Variable
        Response.Redirect("ShowProjects.aspx"); // ShowProject.aspx will open when clicked on "Next" Button
      }
    }
    // Production
    protected void ButtonProdOrder_Click(object sender, EventArgs e)
    {
      string Order = tbOrder.Text;
      if (Order.Equals("")) //Checking if the Textbox is Blank or not
      {
        //Alert.Show("Enter the Customer ID");
      }
      else
      {
        // validate the production order (CHARG=AUFNR)
        List<object> orderList = SAPHelper.GetProductionOrderDetail(Order);
        if (orderList.Count > 0)
        {
          foreach (AFPO orderP in orderList)
          {
            if(orderP.AUFNR == orderP.CHARG){

              Session["AppMode"] = "P"; // Production
              Session["CusName"] = "";
              Session["Cus01"] = "";
              Session["AFPO"] = Order; //AFPO data
              // retrieve material class
              Session["Class"] = SAPHelper.GetMaterialClass(orderP.MATNR);
              Response.Redirect("ShowFTJP01.aspx");
            }
            else
            {
              Response.Write("<script>alert('Invalid production order')</script>");
            }
          }
        }
        else
        {
          Response.Write("<script>alert('Invalid production order')</script>");
        }
      }
    }

    // Test
    protected void ButtonDirectData_Click(object sender, EventArgs e)
    {
      //Task to be done on "Next" Button Click
      string IdKey = tbId.Text;
      Session["Id01"] = IdKey; //To get the value of text box in Session Variable
      Response.Redirect("ShowSafety.aspx");
    }
    protected void ButtonTest_Click(object sender, EventArgs e)
    {
      //Testing
      //List<object> orderList = SAPHelper.GetOrderDetailF007("21874", "30", "");
      //List<string> txtLines = SAPHelper.GetOrderText("21849", "30");
      Response.Redirect("Example.aspx");
    }
  }
}