<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowFTJP03.aspx.cs" Inherits="CertQA.ShowFTJP03" EnableEventValidation="false"%>

<!DOCTYPE html>
 <html xmlns="http://www.w3.org/1999/xhtml">

  <head>
    <style type="text/css">
    </style>
  </head>

  <body style="height: 767px">
    <form id="form1" runat="server">
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
              <asp:Label ID="lblCustomer"     runat="server" Text="Customer: "></asp:Label>
          </td>
          <td>
              <asp:Label ID="lblCustomerNbr"  runat="server" Text="">1234567</asp:Label>
          </td>
          <td style="width:30%">
              <asp:Label ID="lblCustomerName" runat="server" Text="">test customer</asp:Label>
          </td>
           <td>
            <asp:Label ID="lblOrder"        runat="server" Text="Customer Order: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblOrderNbr"     runat="server" Text="">1234567</asp:Label>
          </td>
       </tr>
        <tr>
          <td>
            <asp:Label ID="Label1"     runat="server" Text="Commessa : "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCommessaNbr"  runat="server" Text="">1234567</asp:Label>
          </td>
           <td>
            <asp:Label ID="lblDummy1"       runat="server" Text=""></asp:Label>
          </td>
         <td>
             <asp:Label ID="Label2"         runat="server" Text="Pos.: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblPosNbr"      runat="server" Text="">10</asp:Label>
          </td>
          <td>
            <asp:Label ID="lblDocDate"     runat="server" Text="Data: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblDocDatedmy"  runat ="server" Text="">31/12/2024</asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblItem"         runat="server" Text="Material: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblItemNbr"      runat="server" Text="">1234567890</asp:Label>
          </td>
          <td>
            <asp:Label ID="lblItemDesc"     runat="server" Text="">test description</asp:Label>
          </td>
          <td>
            <asp:Label ID="lblItemQuantity" runat="server" Text="Quantity: "></asp:Label>
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
            <asp:Label ID="lblDummy2"       runat="server" Text=""></asp:Label>
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
          <td>
            <asp:Label ID="lblSerie"  runat="server" Text="Serie:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpSerie" name="inpSerie"  runat="server" class="form-control" value=""/>
          </td>
          <td>
            <asp:Label ID="lblSigla"  runat="server" Text="Sigla:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpSigla" name="inpSigla"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblDiametro"  runat="server" Text="Diametro orifizio min.:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpDiametro" name="inpDiametro"  runat="server" class="form-control" value=""/>
          </td>
          <td>
            <asp:Label ID="lblArea"  runat="server" Text="Area cm2:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpArea" name="inpArea"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblFluidoScarico"  runat="server" Text="Fluido di scarico:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpFluidoScarico" name="inpFluidoScarico"  runat="server" class="form-control" value=""/>
          </td>
          <td>
            <asp:Label ID="lblStatoFisico"  runat="server" Text="Stato fisico:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpStatoFisico" name="inpStatoFisico"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblTempScarico"  runat="server" Text="Temperatura di scarico:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpTempScarico" name="inpTempScarico"  runat="server" class="form-control" value=""/>
          </td>
          <td>
            <asp:Label ID="lblCampo"  runat="server" Text="Campo impiego:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpCampo" name="inpCampo"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblTaraturaNom"  runat="server" Text="Taratura nominale:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpTaraturaNom" name="inpTaraturaNom"  runat="server" class="form-control" value=""/>
          </td>
          <td>
            <asp:Label ID="lblControPressI"  runat="server" Text="Contro pressione imp."></asp:Label>
          </td>
          <td>
            <input type="text" id="inpControPressI" name="inpControPressI"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblSovrapressione"  runat="server" Text="Sovrapressione:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpSovrapressione" name="inpSovrapressione"  runat="server" class="form-control" value=""/>
          </td>
          <td>
            <asp:Label ID="lblControPressG"  runat="server" Text="Contro pressione gen."></asp:Label>
          </td>
          <td>
            <input type="text" id="inpControPressG" name="inpControPressG"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblTaratureMolla"  runat="server" Text="Campo taratura molla:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpTaratureMolla" name="inpTaratureMolla"  runat="server" class="form-control" value=""/>
          </td>
          <td>
            <asp:Label ID="lblControPressT"  runat="server" Text="Contro pressione tot."></asp:Label>
          </td>
          <td>
            <input type="text" id="inpControPressT" name="inpControPressT"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblMolla1"  runat="server" Text="Molla:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpMolla1" name="inpMolla1"  runat="server" class="form-control" value=""/>
          </td>
          <td>
            <asp:Label ID="lblScarto"  runat="server" Text="Scarto chius."></asp:Label>
          </td>
          <td>
            <input type="text" id="inpScarto" name="inpScarto"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblCoefKGAS"  runat="server" Text="Coefficiente scarico KGAS:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpCoefKGAS" name="inpCoefKGAS"  runat="server" class="form-control" value=""/>
          </td>
          <td>
            <asp:Label ID="lblCoefKliq"  runat="server" Text="Coefficiente scarico Kliq:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpCoefKliq" name="inpCoefKliq"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblStelliteU"  runat="server" Text="Stellite ugello:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpStelliteU" name="inpStelliteU"  runat="server" class="form-control" value=""/>
          </td>
          <td>
            <asp:Label ID="lblStelliteO"  runat="server" Text="Stellite otturatore:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpStelliteO" name="inpStelliteO"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblTaraturaB"  runat="server" Text="Taratura banco:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpTaraturaB" name="inpTaraturaB"  runat="server" class="form-control" value=""/>
          </td>
          <td>
            <asp:Label ID="lblTaraturaU"  runat="server" Text="Taratura um:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpTaraturaU" name="inpTaraturaU"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblIngresso"  runat="server" Text="Ingresso:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpIngresso" name="inpIngresso"  runat="server" class="form-control" value=""/>
          </td>
          <td>
            <asp:Label ID="lblUscita"  runat="server" Text="Uscita:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpUscita" name="inpUscita"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblCorpo"  runat="server" Text="Corpo:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpCorpo" name="inpCorpo"  runat="server" class="form-control" value=""/>
          </td>
          <td>
            <asp:Label ID="lblCappello"  runat="server" Text="Cappello:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpCappello" name="inpCappello"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblUgello"  runat="server" Text="Ugello:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpUgello" name="inpUgello"  runat="server" class="form-control" value=""/>
          </td>
          <td>
            <asp:Label ID="lblOtturatore"  runat="server" Text="Otturatore:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpOtturatore" name="inpOtturatore"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblMolla"  runat="server" Text="Molla:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpMolla" name="inpMolla"  runat="server" class="form-control" value=""/>
          </td>
          <td>
            <asp:Label ID="lblSoffietto"  runat="server" Text="Soffietto:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpSoffietto" name="inpSoffietto"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
      </table>
      <asp:Label ID="lblNote"  runat="server" Text="Note speciali:"></asp:Label>
      <input type="text" id="inpNote" name="inpNote"  runat="server" class="form-control" value=""/>
      <hr width="100%" size="2" color="blue" noshade/>
      <h3>Componenti aggiuntivi</h3>
      <table style="width:50%">
        <tr>
          <td>
            <asp:Label ID="lblComp01"  runat="server" Text="1° Componente:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpComp01" name="inpComp01"  runat="server" class="form-control" value=""/>
          </td>
          <td>
            <asp:Label ID="lblQty01"  runat="server" Text="Quantità:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpQty01" name="inpQty01"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblComp02"  runat="server" Text="2° Componente:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpComp02" name="inpComp02"  runat="server" class="form-control" value=""/>
          </td>
          <td>
            <asp:Label ID="lblQty02"  runat="server" Text="Quantità:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpQty02" name="inpQty02"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblComp03"  runat="server" Text="3° Componente:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpComp03" name="inpComp03"  runat="server" class="form-control" value=""/>
          </td>
          <td>
            <asp:Label ID="lblQty03"  runat="server" Text="Quantità:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpQty03" name="inpQty03"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblComp04"  runat="server" Text="4° Componente:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpComp04" name="inpComp04"  runat="server" class="form-control" value=""/>
          </td>
          <td>
            <asp:Label ID="lblQty04"  runat="server" Text="Quantità:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpQty04" name="inpQty04"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
      </table>
      <hr width="100%" size="2" color="blue" noshade/>
      <h3>Sezione qualità</h3>
      <table style="width:50%">
        <tr>
          <td>
            <asp:Label ID="lblQP"  runat="server" Text="QP numbers:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpQP" name="inpQP"  runat="server" class="form-control" value=""/>
          </td>
          <td>
            <asp:Label ID="lblSN01"  runat="server" Text="Per intera commessa? (S/N):"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpSN01" name="inpSN01"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblITP"  runat="server" Text="ITP number/numbers:"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpITP" name="inpITP"  runat="server" class="form-control" value=""/>
          </td>
          <td>
            <asp:Label ID="lblSN02"  runat="server" Text="Per intera commessa? (S/N):"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpSN02" name="inpSN02"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
      </table>
      <table style="width:100%">
        <tr>
          <td style="width:20%">
            <asp:Label ID="lblNoteCollaudo"  runat="server" Text="Note di collaudo:"></asp:Label>
          </td>
          <td style="width:80%">
            <input type="text" id="inpNoteCollaudo" name="inpNoteCollaudo"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td style="width:20%">
            <asp:Label ID="lblNoteCollaudoP"  runat="server" Text="Note di collaudo presenziato:"></asp:Label>
          </td>
          <td style="width:80%">
            <input type="text" id="inpNoteCollaudoP" name="inpNoteCollaudoP"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
      </table>
      <hr width="100%" size="2" color="blue" noshade/>
      <h3>Sezione specifiche</h3>
      <table style="width:100%">
        <tr>
          <td>
            <asp:Label ID="SpecVerniciatura"  runat="server" Text="Specifiche di verniciatura:"></asp:Label>
          </td>
          <td style="width:80%">
            <input type="text" id="inpSpVer" name="inpSpVer"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="NoteVerniciatura"  runat="server" Text="Note di verniciatura:"></asp:Label>
          </td>
          <td style="width:80%">
            <input type="text" id="inpNoVer" name="inpNoVer"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="SpecPreservazione"  runat="server" Text="Specifiche di preservazione:"></asp:Label>
          </td>
          <td style="width:80%">
            <input type="text" id="inpSpPre" name="inpSpPre"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="NotePreservazione"  runat="server" Text="Note di preservazione:"></asp:Label>
          </td>
          <td style="width:80%">
            <input type="text" id="inpNoPre" name="inpNoPre"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="SpecImballaggio"  runat="server" Text="Specifiche di imballaggio:"></asp:Label>
          </td>
          <td style="width:80%">
            <input type="text" id="inpSpImb" name="inpSpImb"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="NoteImballaggio"  runat="server" Text="Note di imballaggio:"></asp:Label>
          </td>
          <td style="width:80%">
            <input type="text" id="inpNoImb" name="inpNoImb"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="DocRichiesta"  runat="server" Text="Documentazione richiesta:"></asp:Label>
          </td>
          <td style="width:80%">
            <input type="text" id="inpSpDoc" name="inpSpDoc"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="NoteDocumentazione"  runat="server" Text="Note di documentazione:"></asp:Label>
          </td>
          <td style="width:80%">
            <input type="text" id="inpNoDoc" name="inpNoDoc"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
      </table>
      <hr width="100%" size="2" color="blue" noshade/>
      <asp:Button ID="btOrder" runat="server" Text="ORDER" CssClass="btn btn-primary" OnClick="ButtonOrder_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="btOK" runat="server" Text="SAVE" CssClass="btn btn-primary" OnClick="ButtonOK_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="btNext" runat="server" Text="NEXT" CssClass="btn btn-primary" OnClick="ButtonNext_Click" Visible="False" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </form>
  </body>
</html>

