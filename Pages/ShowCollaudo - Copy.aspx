<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowCollaudo.aspx.cs" Inherits="CertQA.ShowCollaudo" EnableEventValidation="false"%>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>
 <html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title></title>
  </head>

  <body style="height: 767px">
    <form id="form1" runat="server">
      <table style="width:100%">
        <tr>
          <td style="text-align: center;">
            <h1>DOCUMENTAZIONE DI COMMESSA - Certificato di Qualità</h1>
          </td>
        </tr>
      </table>
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
            <asp:Label ID="lblDummy3"         runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblDummy4"      runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblDummy5"     runat="server" Text=""></asp:Label>
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
      <hr width="100%" size="2" color="blue"/>
      <div class="jumbotron">
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
          <td>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblMarcatura" runat="server" Text="Marcatura: "></asp:Label>
          </td>
          <td>
            <input type="text" id="inpMarcatura" name="inpMarcatura"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
          <tr>
            <td>
              <asp:Label ID="lblProva" runat="server" Text="Prova idraulica: "></asp:Label>&nbsp;
            </td>
            <td>
              <input type="text" id="inpProva" name="inpProva"  runat="server" class="form-control" value=""/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td>
              <asp:Label ID="lblBancoProvaIdro" runat="server" Text="Banco prova: "></asp:Label>&nbsp;
            </td>
            <td>
              <input type="text" id="inpBPIdro" name="inpBPIdro"  runat="server" class="form-control" value=""/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td>
              <asp:Label ID="lblSerie" runat="server" Text="Serie: "></asp:Label>&nbsp
            </td>
            <td>
              <input type="text" id="inpSerie" name="inpSerie"  runat="server" class="form-control" value=""/>
            </td>
          </tr>
          <tr>
            <td>
              <asp:Label ID="Ugello" runat="server" Text="Ugello: "></asp:Label>&nbsp;
            </td>
            <td>
              <input type="text" id="inpUgello" name="inpUgello"  runat="server" class="form-control" value=""/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
          </tr>
          <tr>
            <td>
              <asp:Label ID="lblCorpo" runat="server" Text="Corpo: "></asp:Label>
            </td>
            <td>
              <input type="text" id="inpCorpo" name="inpCorpo"  runat="server" class="form-control" value=""/>
            </td>
          </tr>
          <tr>
            <td>
              <asp:Label ID="lblProvaBanco" runat="server" Text="Prova taratura al banco: "></asp:Label>
            </td>
            <td>
              <input type="text" id="inpProvaB" name="inpProvaB"  runat="server" class="form-control" value=""/>
            </td>
            <td>
              <asp:Label ID="lblBancoProvaTara" runat="server" Text="Banco prova: "></asp:Label>&nbsp;
            </td>
            <td>
              <input type="text" id="inpBPTara" name="inpBPTara"  runat="server" class="form-control" value=""/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
          </tr>
          <tr>
            <td>
              <asp:Label ID="lblProvaUgello" runat="server" Text="Prova tenuta ugello otturatore a norma: "></asp:Label>
            </td>
            <td>
              <input type="text" id="inpProvaU" name="inpProvaU"  runat="server" class="form-control" value=""/>
            </td>
          </tr>
          <tr>
            <td>
              <asp:Label ID="lblFluido" runat="server" Text="Fluido: "></asp:Label>&nbsp;
            </td>
            <td>
              <input type="text" id="inpFluido" name="inpFluido"  runat="server" class="form-control" value=""/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
          </tr>
          <tr>
            <td>
              <asp:Label ID="lblPressioneP1" runat="server" Text="Pressione prova: "></asp:Label>&nbsp;
            </td>
            <td>
              <input type="text" id="inpPrs1" name="inpPrs1"  runat="server" class="form-control" value=""/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td>
              <asp:Label ID="lblPressioneP2" runat="server" Text="al: "></asp:Label>&nbsp
            </td>
            <td>
              <input type="text" id="inpPrs2" name="inpPrs2"  runat="server" class="form-control" value="0"/>
            </td>
            <td>
              <asp:Label ID="lblPressioneP3" runat="server" Text="% della taratura"></asp:Label>&nbsp
            </td>
          </tr>
          <tr>
            <td>
              <asp:Label ID="lblPerditaA" runat="server" Text="Perdita ammessa: "></asp:Label>&nbsp;
            </td>
            <td>
              <input type="text" id="inpPdtA" name="inpPdtA"  runat="server" class="form-control" value=""/>
            </td>
            <td>
              <asp:Label ID="lblPerditaR" runat="server" Text="Perdita rilevata: "></asp:Label>&nbsp
            </td>
            <td>
              <input type="text" id="inpPdtR" name="inpPdtR"  runat="server" class="form-control" value=""/>
            </td>
            <td>
              <asp:Label ID="lblPerdita" runat="server" Text=" (Bolle/Minuto)"></asp:Label>&nbsp
            </td>
          </tr>
        </table>
      </div>
      <hr width="100%" size="2" color="red"/>
      <div class="jumbotron">
        <table style="width:100%">
          <tr>
            <td>
              <asp:Label ID="lblControllo" runat="server" Text="Controllo visivo/dimensionale: "></asp:Label>
            </td>
            <td>
              <input type="checkbox" id="inpControllo" name="inpControllo"  runat="server" class="form-control" value=""/>
            </td>
          </tr>
          <tr>
            <td>
              <asp:Label ID="lblPuliziaO" runat="server" Text="Sgrassaggio uso ossigeno: "></asp:Label>
            </td>
            <td>
              <input type="checkbox" id="inpPuliziaO" name="inpPuliziaO"  runat="server" class="form-control" value=""/>
            </td>
          </tr>
          <tr>
            <td>
              <asp:Label ID="lblFema" runat="server" Text="Collaudi FEMA: "></asp:Label>&nbsp;
            </td>
            <td>
              <input type="text" id="inpUser1" name="inpUser1"  runat="server" class="form-control" value=""/>
            </td>
            <td>
              <input type="date" id="inpDateU1" name="inpDateU1"  runat="server" class="form-control" value=""/>
            </td>
            <td>
              <asp:Label ID="lblDataCerRv" runat="server" Text="Data revisione certificato: "></asp:Label>
            </td>
            <td>
              <input type="date" id="inpDateCertRv" name="inpDateCertRv"  runat="server" class="form-control" value=""/>
            </td>
          </tr>
          <tr>
            <td>
              <asp:Label ID="lblCliente" runat="server" Text="Collaudi Cliente: "></asp:Label>
            </td>
            <td>
              <input type="text" id="inpUser2" name="inpUser2"  runat="server" class="form-control" value=""/>
            </td>
            <td>
              <input type="date" id="inpDateU2" name="inpDateU2"  runat="server" class="form-control" value=""/>
            </td>
          </tr>
        </table>
      </div>
      <hr width="100%" size="2" color="blue"/>
      <asp:Button ID="btOrder" runat="server" Text="ORDER" CssClass="btn btn-primary" OnClick="ButtonOrder_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="btGenerale" runat="server" Text="GENERALE" CssClass="btn btn-primary" OnClick="ButtonGenerale_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="btOK" runat="server" Text="SAVE" CssClass="btn btn-primary" OnClick="ButtonOK_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="btnPrint" runat="server" Text="Print PDF" OnClick="btnExportPDF_Click" />
      <asp:Label ID="savRecordId" runat="server" Text="" Visible="false"></asp:Label>&nbsp;
      <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Height="600px" ProcessingMode="Local" ClientIDMode="AutoID" PageCountMode="Actual" SizeToReportContent="True"></rsweb:ReportViewer>
    </form>
  </body>
</html>

