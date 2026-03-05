<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowOrder.aspx.cs" Inherits="CertQA.ShowOrder" %>
<!DOCTYPE html>
<style>
  table, th, td {
    border: 1px solid black;
    text-align: left
  }
</style>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>Show order data</title>
  </head>
  <body>
    <form id="form1" runat="server">
      <p>Show the company of the order</p>
      <p>
      <asp:Label ID="lblOrder" runat="server" Text="Order"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:TextBox ID="tbOrder" runat="server"></asp:TextBox>
      <br>
      </p>
    </form>
  </body>
</html>
