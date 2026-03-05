<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowGenerale.aspx.cs" Inherits="CertQA.ShowGenerale" EnableEventValidation="false"%>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>
 <html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>Show data for order line - Generale</title>
  </head>
  <body style="height: 444px">
    <form id="form1" runat="server">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <table style="width:100%">
        <tr>
          <td>
              <asp:Label ID="lblCustomer"     runat="server" Text="Customer: "></asp:Label>
          </td>
          <td>
              <asp:Label ID="lblCustomerNbr"  runat="server" Text="">1234567</asp:Label>
          </td>
          <td style="width:30%">
              <asp:Label ID="lblCustomerName" runat="server" Text="">test customer</asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblOrder"        runat="server" Text="Order: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblOrderNbr"     runat="server" Text="">1234567</asp:Label>
          </td>
          <td>
            <asp:Label ID="lblDummy1"       runat="server" Text=""></asp:Label>
          </td>
          <td style="width:10%">
            <asp:Label ID="lblOrderLine"    runat="server" Text="Line: "></asp:Label>
          </td>
          <td style="width:20%">
            <asp:Label ID="lblOrderLin"     runat="server" Text="">010</asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblItem"         runat="server" Text="Material: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblItemNbr"      runat="server" Text="123"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblItemDesc"     runat="server" Text="test"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblItemQuantity" runat="server" Text="Quantity: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblItemQty"      runat="server" Text="">4456</asp:Label>
          </td>
          <td style="width:10%">
            <asp:Label ID="lblItemUnit"     runat="server" Text="UOM: "></asp:Label>
          </td>
          <td style="width:10%">
            <asp:Label ID="lblItemUom"      runat="server" Text="">NR</asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblCertificate"  runat="server" Text="N°certificato: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCertificateNr" runat="server" Text="123"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblDummy2"       runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCertData"     runat="server" Text="del: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCertDataDat"  runat="server" Text="">31.12.2999</asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblTag"         runat="server" Text="Tag: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTagValue"      runat="server" Text="123"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTarMolla"      runat="server" Text="Campo taratura molla: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTarMollaValue" runat="server" Text="123"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblMolla"      runat="server" Text="Molla: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblMollaValue" runat="server" Text="123"></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblTarNominale"      runat="server" Text="Taratura nominale: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTarNominaleValue" runat="server" Text="123"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTarBanco"         runat="server" Text="Taratura banco: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTarBancoValue"    runat="server" Text="123"></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblCtrPressImpost"       runat="server" Text="Controllo pressione imposta: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCtrPressImpostValue"  runat="server" Text="123"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCtrPressGen"          runat="server" Text="Controllo pressione generata: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCtrPressGenValue"     runat="server" Text="123"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCtrPressTotale"       runat="server" Text="Controllo pressione totale: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCtrPressTotaleValue"  runat="server" Text="123"></asp:Label>
          </td>
        </tr>
      </table>
      <hr width="100%" size="2" color="blue" noshade/>
      <table style="width:100%">
        <tr>
          <td>
            <asp:Label ID="lblTipoCollaudo"     runat="server" Text="Tipo collaudo: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTipoCollaudoCode" runat="server" Text="">SI</asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTipoCollaudoDesc" runat="server" Text="">descrizione</asp:Label>
          </td>
        </tr>
        <tr>
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
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblMarcatura" runat="server" Text="Marcatura: "></asp:Label>
          </td>
          <td>
            <input type="text" id="inpMarcatura" name="inpMarcatura"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
      </table>
      <hr width="100%" size="2" color="blue" noshade/>
      <asp:Button ID="btOrder" runat="server" Text="ORDER" CssClass="btn btn-primary" OnClick="ButtonOrder_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="btOK" runat="server" Text="SAVE" CssClass="btn btn-primary" OnClick="ButtonOK_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="btCollaudo" runat="server" Text="COLLAUDO" CssClass="btn btn-primary" OnClick="ButtonCollaudo_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Label ID="savRecordId" runat="server" Text="" Visible="false"></asp:Label>&nbsp;
<%--      <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Height="600px" ProcessingMode="Local"></rsweb:ReportViewer>--%>
    </form>
  </body>
</html>

