<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowFTJP02.aspx.cs" Inherits="CertQA.ShowFTJP02" EnableEventValidation="false"%>

<!DOCTYPE html>
 <html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title></title>
  </head>

  <body style="height: 767px">
    <form id="form1" runat="server" autocomplete="off">
      <table style="width:100%">
        <tr>
          <td style="text-align: center;">
            <h1>DOCUMENTAZIONE DI COMMESSA - FTJP - 02</h1>
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
      <table style="width:100%">
        <tr>
          <td colspan="8">
            <asp:Label ID="lblTitolo1"  runat="server" Text="Caratteristiche Targhetta"></asp:Label>
          </td>
        </tr>
        <tr>
          <td width="8%">
            <asp:Label ID="lblSerie"  runat="server" Text="Serie:"></asp:Label>
          </td>
          <td width="22%">
            <asp:Label ID="lblSerieVal"  runat="server" Text=""></asp:Label>
          </td>
          <td width="10%">
            <asp:Label ID="lblSigla"  runat="server" Text="Sigla:"></asp:Label>
          </td>
          <td width="25%">
            <asp:Label ID="lblSiglaVal"  runat="server" Text=""></asp:Label>
          </td>
          <td width="15%">
            <asp:Label ID="lblControPressT"  runat="server" Text="Contro pressione totale:"></asp:Label>
          </td>
          <td width="20%">
            <asp:Label ID="lblControPressTVal"  runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblCorpo"  runat="server" Text="Corpo:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCorpoVal"  runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTaraturaU"  runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTaraturaUVal"  runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTaraturaC"  runat="server" Text="Taratura banco (CDTP):"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTaraturaCVal"  runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblUgello"  runat="server" Text="Ugello:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblUgelloVal"  runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCampo"  runat="server" Text="Campo impiego:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCampoVal"  runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCoefKGAS"  runat="server" Text="Coefficiente scarico KGAS:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCoefKGASVal"  runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblMolla"  runat="server" Text="Molla:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblMollaVal"  runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblFluidGroup"  runat="server" Text="Fluid Group"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblFluidGroupVal"  runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCoefKliq"  runat="server" Text="Coefficiente scarico Kliq:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCoefKliqVal"  runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblIngresso"  runat="server" Text="Ingresso:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblIngressoVal"  runat="server" Text=""></asp:Label>
          </td>
          <td>
           <asp:Label ID="lblUscita"  runat="server" Text="Uscita:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblUscitaVal"  runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label3"  runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label4"  runat="server" Text=""></asp:Label>
          </td>
        </tr>
      </table>
      <hr width="100%" size="2" color="blue"/>
      <table style="width:100%">
        <tr>
          <td colspan="8">
            <asp:Label ID="lblTitolo2"  runat="server" Text="Caratteristiche Techniche"></asp:Label>
          </td>
        </tr>
        <tr>
          <td width="8%">
            <asp:Label ID="lblSerie2"  runat="server" Text="Serie:"></asp:Label>
          </td>
          <td width="22%">
            <asp:Label ID="lblSerie2Val"  runat="server" Text=""></asp:Label>
          </td>
          <td width="10%">
            <asp:Label ID="lblSigla2"  runat="server" Text="Sigla:"></asp:Label>
          </td>
          <td width="25%">
            <asp:Label ID="lblSigla2Val"  runat="server" Text=""></asp:Label>
          </td>
          <td width="15%">
            <asp:Label ID="lblDiametro"  runat="server" Text="Diametro orifizio min.:"></asp:Label>
          </td>
          <td width="20%">
            <asp:Label ID="lblDiametroVal"  runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblCorpo2"  runat="server" Text="Corpo:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCorpo2Val"  runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTaraturaB"  runat="server" Text="Taratura banco:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTaraturaBVal"  runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTempScarico"  runat="server" Text="Temperatura di scarico:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTempScaricoVal"  runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblMolla1"  runat="server" Text="Codice Molla:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblMolla1Val"  runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTaraturaNom"  runat="server" Text="Taratura nominale:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTaraturaNomVal"  runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTaratureMolla"  runat="server" Text="Campo taratura molla:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTaratureMollaVal"  runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblCappello"  runat="server" Text="Cappello:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCappelloVal"  runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTaraturaU2"  runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTaraturaU2Val"  runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblControPressI"  runat="server" Text="Contro pressione imp.:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblControPressIVal"  runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblUgello2"  runat="server" Text="Ugello:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblUgello2Val"  runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCampo2"  runat="server" Text="Campo impiego:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCampo2Val"  runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblControPressG"  runat="server" Text="Contro pressione gen.:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblControPressGVal"  runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblOtturatore"  runat="server" Text="Otturatore:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblOtturatoreVal"  runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblSovrapressione"  runat="server" Text="Sovrapressione:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblSovrapressioneVal"  runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblControPressT1"  runat="server" Text="Contro pressione tot.:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblControPressT1Val"  runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblIngresso2"  runat="server" Text="Ingresso:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblIngresso2Val"  runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblUscita2"  runat="server" Text="Uscita:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblUscita2Val"  runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCoefKGAS2"  runat="server" Text="Coefficiente scarico KGAS:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCoefKGAS2Val"  runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblSoffietto"  runat="server" Text="Soffietto:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblSoffiettoVal"  runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblArea"  runat="server" Text="Area cm2:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblAreaVal"  runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCoefKliq2"  runat="server" Text="Coefficiente scarico Kliq:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCoefKliq2Val"  runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblMolla2"  runat="server" Text="Codice Molla:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblMolla2Val"  runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblStelliteO"  runat="server" Text="Stellite otturatore:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblStelliteOVal"  runat="server" Text=""></asp:Label>
          </td>
           <td>
            <asp:Label ID="lblFluidoScarico"  runat="server" Text="Fluido di scarico:"></asp:Label>
          </td>
          <td>
             <asp:Label ID="lblFluidoScaricoVal"  runat="server" Text=""></asp:Label>
         </td>
       </tr>
        <tr>
          <td>
            <asp:Label ID="lblStatoFisico"  runat="server" Text="Stato fisico:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblStatoFisicoVal"  runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblStelliteU"  runat="server" Text="Stellite ugello:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblStelliteUVal"  runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblScarto"  runat="server" Text="Scarto chius.:"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblScartoVal"  runat="server" Text=""></asp:Label>
          </td>
        </tr>
      </table>
      <hr width="100%" size="2" color="blue"/>
      <asp:Button ID="btStart" runat="server" Text="START" CssClass="btn btn-primary" OnClick="ButtonStart_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="btOrder" runat="server" Text="ORDER" CssClass="btn btn-primary" OnClick="ButtonOrder_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="btNext" runat="server" Text="FTJP03" CssClass="btn btn-primary" OnClick="ButtonNext_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </form>
  </body>
</html>

