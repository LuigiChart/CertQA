using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CertQA
{
  public partial class Example : Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      //dateSelector.Value = DateTime.Now.ToString("dd-MM-yyyy");
    }
    protected void OnSubmit(object sender, EventArgs e)
    {
      DateTime dt = Convert.ToDateTime(txtDateTime.Text);
      ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", $"alert('Selected Date and Time: {dt}')", true);
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
    }
    protected void ButtonOK_Click(object sender, EventArgs e)
    {
      string val01 = Request.Form["inpDate1"];
      string val02 = Request.Form["inpDate2"];
      string val03 = Request.Form["dateSelector"];
    }
  }
}