<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowFTJP03.aspx.cs" Inherits="CertQA.ShowFTJP03" EnableEventValidation="false"%>

<!DOCTYPE html>
 <html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title></title>
    <style type="text/css">
    </style>
  </head>

  <body style="height: 767px">
    <form id="form1" runat="server" autocomplete="off">
      <table style="width:100%">
        <tr>
          <td style="text-align: center;">
            <h1>DOCUMENTAZIONE DI COMMESSA - FTJP - 03</h1>
          </td>
        </tr>
      </table>
      <table style="width:100%">
        <tr>
          <td>
              <asp:Label ID="lblCustomer"     runat="server" Text="Cliente: "></asp:Label>
          </td>
          <td>
              <asp:Label ID="lblCustomerNbr"  runat="server" Text="">1234567</asp:Label>
          </td>
          <td style="width:30%">
              <asp:Label ID="lblCustomerName" runat="server" Text="">test customer</asp:Label>
          </td>
           <td>
            <asp:Label ID="lblOrder"        runat="server" Text="Ordine Cliente: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblOrderNbr"     runat="server" Text="">1234567</asp:Label>
          </td>
       </tr>
        <tr>
          <td>
            <asp:Label ID="lblCommessa"     runat="server" Text="Commessa : "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCommessaNbr"  runat="server" Text="">1234567</asp:Label>
          </td>
           <td>
            <asp:Label ID="lblDummy1"       runat="server" Text=""></asp:Label>
          </td>
         <td>
             <asp:Label ID="lblPos"         runat="server" Text="Pos.: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblPosNbr"      runat="server" Text="">10</asp:Label>
          </td>
          <td>
            <asp:Label ID="lblDocDate"     runat="server" Text="Data ordine: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblDocDatedmy"  runat ="server" Text="">31/12/2024</asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblItem"         runat="server" Text="Materiale: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblItemNbr"      runat="server" Text="">1234567890</asp:Label>
          </td>
          <td>
            <asp:Label ID="lblItemDesc"     runat="server" Text="">test description</asp:Label>
          </td>
          <td>
            <asp:Label ID="lblItemQuantity" runat="server" Text="Quantità: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblItemQty"      runat="server" Text="">4456</asp:Label>
          </td>
          <td>
            <asp:Label ID="lblITP"          runat="server" Text="ITP: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblITPVal"       runat="server" Text="">abcdefghijk</asp:Label>
          </td>
          <td>
            <asp:Label ID="lblQP"          runat="server" Text="QC: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblQPVal"       runat="server" Text="">abc</asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblOdP"          runat="server" Text="OdP: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblOdPVal"       runat="server" Text="">1122334455</asp:Label>
          </td>
          <td>
            <asp:Label ID="lblClass"       runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblMatricolaFrom" runat="server" Text="Matricola iniziale: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblMatricolaFromValue" runat="server" Text="">1234567</asp:Label>
          </td>
          <td>
            <asp:Label ID="lblMatricolaTo" runat="server" Text="finale: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblMatricolaToValue" runat="server" Text="">1234567</asp:Label>
          </td>
          <td>
            <asp:Label ID="lblDelDate"      runat="server" Text="Data consegna: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblDelDateVal"   runat="server" Text="">31.12.2999</asp:Label>
          </td>
        </tr>
      </table>
      <hr width="100%" size="2" color="blue"/>
        <asp:PlaceHolder ID = "PlaceHolder1" runat="server" />
<%--      <table style="width:100%">
        <tbody id="tableBody">
            <!-- Rows will be populated dynamically -->
        </tbody>
      </table>--%>
      <hr width="100%" size="2" color="blue"/>
      <asp:Button ID="btStart" runat="server" Text="START" CssClass="btn btn-primary" OnClick="ButtonStart_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="btOrder" runat="server" Text="ORDER" CssClass="btn btn-primary" OnClick="ButtonOrder_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="btNext" runat="server" Text="Collaudo" CssClass="btn btn-primary" OnClick="ButtonQC_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </form>
  </body>
 </html>

