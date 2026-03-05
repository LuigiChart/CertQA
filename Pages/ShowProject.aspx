<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowProject.aspx.cs" Inherits="CertQA.ShowProject" %>
<!DOCTYPE html>
<style>
  table, th, td {
    border: 1px solid black;
    text-align: left
  }
</style>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>Show Project data</title>
    <script language='javascript'>
    function hourglass()
    {
      document.body.style.cursor = 'wait';
    }
    </script>
  </head>
  <body style="height: 444px">
    <form id="form1" runat="server" autocomplete="off">
      <p>Show the data of the project</p>
      <p>
      <asp:Label ID="lblProject" runat="server" Text="Project"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblProjectName" runat="server" Text="This is an test"></asp:Label>
      <asp:Button ID="cmdReport" runat="server" Text="Button" Visible="False" />
      <br>
      </p>
      <asp:Table ID="tableWSB" runat="server" Height="39px" style="width:100%" HorizontalAlign="Left">
       <asp:TableRow runat="server">
          <asp:TableCell style="width:10%" ID="WBSname"       runat="server"></asp:TableCell>
          <asp:TableCell style="width:10%" ID="WBSIntNumber"  runat="server"></asp:TableCell>
          <asp:TableCell style="width:15%" ID="WBSExtNumber"  runat="server"></asp:TableCell>
          <asp:TableCell style="width:10%" ID="EBELN"     runat="server"></asp:TableCell>
          <asp:TableCell style="width:5%"  ID="EBELP"     runat="server"></asp:TableCell>
          <asp:TableCell style="width:15%" ID="MATNR"     runat="server"></asp:TableCell>
          <asp:TableCell style="width:20%" ID="TXZ01"     runat="server"></asp:TableCell>
          <asp:TableCell style="width:10%" ID="MENGE"     runat="server"></asp:TableCell>
          <asp:TableCell style="width:5%"  ID="MEINS"     runat="server"></asp:TableCell>
        </asp:TableRow>
      </asp:Table>
    </form>
  </body>
</html>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
  $('#MATNR').click(function () {
    $.ajax({
      type: "POST",
      url: "Pages/ShowProject.aspx/LaunchItem",
      data: "{MATNR,TXZ01}",
      dataType: "json",
      contentType: "application/json; charset=utf-8",
      success: OnSuccess,
      error: OnError
    });
 });
</script>

