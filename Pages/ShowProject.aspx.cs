using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CertQA
{
  public partial class ShowProject : System.Web.UI.Page
  {
    static string _ENV;
    static string project;
    protected void Page_Load(object sender, EventArgs e)
    {
      cmdReport.Attributes.Add("onclick", "javascript:hourglass();");
      _ENV = Convert.ToString(Session["ENV"]);
      project = Convert.ToString(Session["Prj01"]);
      if (!IsPostBack)
      {
        if (!project.Equals(""))
        {
          int counter = 0;
          tableWSB.Rows.Clear();
          List<string> wbsList = SAPHelper.GetProjectDetail(project);
          foreach (string item in wbsList)
          {
            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            TableCell cell2 = new TableCell();
            TableCell cell3 = new TableCell();
            TableCell cell4 = new TableCell();
            TableCell cell5 = new TableCell();
            TableCell cell6 = new TableCell();
            TableCell cell7 = new TableCell();
            TableCell cell8 = new TableCell();
            TableCell cell9 = new TableCell();
            TableCell cell10 = new TableCell();
            if (counter==0)
            {
              lblProjectName.Text = item;
              cell1.Text = "WBS";
              row.Cells.Add(cell1);
              cell2.Text = "Intern";
              row.Cells.Add(cell2);
              cell3.Text = "Extern";
              row.Cells.Add(cell3);
              cell4.Text = "PO";
              row.Cells.Add(cell4);
              cell5.Text = "Line";
              row.Cells.Add(cell5);
              cell6.Text = "Material";
              row.Cells.Add(cell6);
              cell7.Text = "Description";
              row.Cells.Add(cell7);
              cell8.Text = "Quantity";
              row.Cells.Add(cell8);
              cell9.Text = "UOM";
              row.Cells.Add(cell9);
              tableWSB.Rows.Add(row);
            }
            else
            {
              string[] result = item.Split('|');
              cell1.Text = result[0];
              row.Cells.Add(cell1);
              if (result.Length > 1)
              {
                cell2.Text = result[1];
                row.Cells.Add(cell2);
              }
              if (result.Length > 2)
              {
                cell3.Text = result[2];
                row.Cells.Add(cell3);
              }
              if (result.Length > 3)
              {
                cell4.Text = result[3];
                row.Cells.Add(cell4);
              }
              if (result.Length > 4)
              {
                cell5.Text = result[4];
                row.Cells.Add(cell5);
              }
              if (result.Length > 5)
              {
                cell6.Text = result[5];
                row.Cells.Add(cell6);
              }
              if (result.Length > 6)
              {
                cell7.Text = result[6];
                row.Cells.Add(cell7);
              }
              if (result.Length > 7)
              {
                cell8.Text = result[7];
                row.Cells.Add(cell8);
              }
              if (result.Length > 8)
              {
                cell9.Text = result[8];
                row.Cells.Add(cell9);
              }
              tableWSB.Rows.Add(row);
            }
            counter++;
          }
        }
      }
    }

    protected void LaunchItem(string material, string description)
    {
      Session["MAT"] = material;
      Session["DSC"] = description;
      Response.Redirect("ShowItem.aspx");
    }
  }
}
