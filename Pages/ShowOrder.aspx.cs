using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CertQA
{
  public partial class ShowOrder : System.Web.UI.Page
  {
    static string order;
    protected void Page_Load(object sender, EventArgs e)
    {
      order = Convert.ToString(Session["Ord01"]);
      if (!IsPostBack)
      {
        tbOrder.Text = SAPHelper.GetCompany("IT10");
        if (!order.Equals("1"))
        {
          //getOrderDetail();
        }
      }
    }
  }
}