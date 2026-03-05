<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowSafety.aspx.cs" Inherits="CertQA.ShowSafety" EnableEventValidation="false" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title></title>
  <!-- jQuery -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- jQuery DateTimePicker CSS & JS -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css"/>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
  <style>
    .hidden-text {
      visibility: hidden;
    }
  </style>
</head>

<body style="height: 767px">
  <form id="form1" runat="server" autocomplete="off">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <table style="width: 100%">
      <tr>
        <td style="text-align: center;">
          <h1>DOCUMENTAZIONE DI COMMESSA - Certificato di Qualità - Valvola di sicurezza</h1>
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
          <td>
            <asp:Label ID="lblCertificate" runat="server" Text="N°certificato: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCertificateNr" runat="server" Text="123"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCertData" runat="server" Text="del: "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCertDataDat" runat="server" Text="">31.12.2999</asp:Label>
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
    <hr width="100%" size="2" color="blue" />
    <div class="jumbotron">
      <table style="width: 60%">
        <tr>
          <td>
            <h3>Caratteristiche</h3>
          </td>
        </tr>
        <tr>
          <td width="40%">
            <asp:Label ID="lblPortataMax" runat="server" Text="Portata massima scaricabile"></asp:Label>
          </td>
          <td width="8%">
            <asp:Label ID="lblPortataMaxU" runat="server" Text="kg/h"></asp:Label>
          </td>
          <td width="25%">
            <input type="text" id="inpPortataMax" name="inpPortataMax" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td width="22%" class="hidden-text">
            <input type="text" id="inpBPortataMax" name="inpBPortataMax" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td width="5%" class="hidden-text">
            <input type="checkbox" id="inpPortataMaxRes" name="inpPortataMaxRes" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblClasseP" runat="server" Text="Classi di pressioni"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblClassePU" runat="server" Text="-"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpClassePV" name="inpClassePV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td class="hidden-text">
            <input type="text" id="inpBClasseP" name="inpBClasseP" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td class="hidden-text">
            <input type="checkbox" id="inpClassePRes" name="inpClassePRes" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
      </table>
    </div>
    <hr width="100%" size="2" color="blue" />
    <div class="jumbotron">
      <table style="width: 60%">
        <tr>
          <td>
            <h3>Materiali</h3>
          </td>
        </tr>
        <tr>
          <td width="40%">
            <asp:Label ID="lblCappuccio" runat="server" Text="Cappuccio"></asp:Label>
          </td>
          <td width="8%">
            <asp:Label ID="lblCappuccioU" runat="server" Text="-"></asp:Label>
          </td>
          <td width="25%">
            <input type="text" id="inpCappuccio" name="inpCappuccio" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td width="22%" class="hidden-text">
            <input type="text" id="inpBCappuccio" name="inpBCappuccio" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td width="5%" class="hidden-text">
            <input type="checkbox" id="inpCappuccioRes" name="inpCappuccioRes" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
      </table>
    </div>
    <hr width="100%" size="2" color="blue" />
    <div class="jumbotron">
      <table style="width: 60%">
        <tr>
          <td>
            <h3>Dati di processo</h3>
          </td>
        </tr>
        <tr>
          <td width="40%">
            <asp:Label ID="lblPortata" runat="server" Text="Portata"></asp:Label>
          </td>
          <td width="8%">
            <asp:Label ID="lblPortataU" runat="server" Text="kg/h"></asp:Label>
          </td>
          <td width="25%">
            <input type="text" id="inpPortata" name="inpPortata" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td width="22%" class="hidden-text">
            <input type="text" id="inpBPortata" name="inpBPortata" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td width="5%" class="hidden-text">
            <input type="checkbox" id="inpPortataRes" name="inpPortataRes" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
      </table>
    </div>
    <hr width="100%" size="2" color="blue" />
    <div class="jumbotron">
      <table style="width: 60%">
        <tr>
          <td>
            <h3>Controlli</h3>
          </td>
        </tr>
        <tr>
          <td width="40%">
            <asp:Label ID="lblControllo" runat="server" Text="Controllo visivo/dimensionale"></asp:Label>
          </td>
          <td width="8%">
            <asp:Label ID="lblControlloU" runat="server" Text="-"></asp:Label>
          </td>
          <td width="25%">
            <asp:Label ID="lblControlloV" runat="server" Text="applicable dwgs"></asp:Label>
          </td>
          <td width="22%" class="hidden-text">
            <input type="text" id="inpBControllo" name="inpBControllo" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td width="5%">
            <input type="checkbox" id="inpControlloRes" name="inpControlloRes" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblPuliziaO" runat="server" Text="Pulizia uso ossigeno"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblPuliziaOU" runat="server" Text="-"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpPuliziaONorm" name="inpPuliziaONorm" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td class="hidden-text">
            <input type="text" id="inpBPuliziaONorm" name="inpBPuliziaONorm" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="checkbox" id="inpPuliziaONormRes" name="inpPuliziaONormRes" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
      </table>
    </div>
    <hr width="100%" size="2" color="blue" />
    <div class="jumbotron">
      <table style="width: 60%">
        <tr>
          <td width="40%">
            <h3>Collaudi</h3>
          </td>
          <td width="8%" class="hidden-text">
            <asp:Label ID="lblTestBenchU" runat="server" Text=""></asp:Label>
          </td>
          <td width="25%" class="hidden-text">
            <asp:Label ID="lblTestBench" runat="server" Text=""></asp:Label>&nbsp;
          </td>
          <td width="22%">
            <asp:Label ID="lblBTestBench" runat="server" Text="Banco prova"></asp:Label>&nbsp;
          </td>
          <td width="5%" class="hidden-text">
            <input type="checkbox" id="inpTestBenchRes" name="inpTestBenchRes" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblProvaIdrostatica" runat="server" Text="Prova idrostatica"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblProvaIdrostaticaU" runat="server" Text="-"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpProvaIdrostatica" name="inpProvaIdrostatica" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="text" id="inpBPIdrostatica" name="inpBPIdrostatica" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="checkbox" id="inpProvaIdrostaticaRes" name="inpProvaIdrostaticaRes" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblCorpo" runat="server" Text="- corpo-cappello-cappuccio"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCorpoU" runat="server" Text="bar | min"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpCorpo" name="inpCorpo" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="text" id="inpBCorpo" name="inpBCorpo" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="checkbox" id="inpCorpoRes" name="inpCorpoRes" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblIncamiciatura" runat="server" Text="- incamiciatura corpo"></asp:Label>&nbsp;
          </td>
          <td>
            <asp:Label ID="lblIncamiciaturaU" runat="server" Text="bar | min"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpIncamiciatura" name="inpIncamiciatura" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="text" id="inpBIncamiciatura" name="inpBIncamiciatura" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="checkbox" id="inpIncamiciaturaRes" name="inpIncamiciaturaRes" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblBoccaglio" runat="server" Text="- ugello"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblBoccaglioU" runat="server" Text="bar | min"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpBoccaglio" name="inpBoccaglio" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="text" id="inpBBoccaglio" name="inpBBoccaglio" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="checkbox" id="inpBoccaglioRes" name="inpBoccaglioRes" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblSoffietto" runat="server" Text="Tenuta soffietto"></asp:Label>&nbsp;
          </td>
          <td>
            <asp:Label ID="lblSoffiettoU" runat="server" Text="-"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblSoffiettoV" runat="server" Text="bellows manufacturer"></asp:Label>&nbsp;
          </td>
          <td class="hidden-text">
            <input type="text" id="inpBSoffietto" name="inpBSoffietto" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="checkbox" id="inpSoffiettoRes" name="inpSoffiettoRes" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblValvola" runat="server" Text="Valvola assiemata"></asp:Label>&nbsp;
          </td>
          <td>
            <asp:Label ID="lblValvolaU" runat="server" Text="-"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpValvola" name="inpValvola" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="text" id="inpBValvola" name="inpBValvola" runat="server" class="form-control" value="0" />
          </td>
          <td class="hidden-text">
            <input type="checkbox" id="inpValvolaRes" name="inpValvolaRes" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblTenuta" runat="server" Text="Tenuta guarnizioni-BackP."></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTenutaU" runat="server" Text="bar | min"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpTenuta" name="inpTenuta" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="text" id="inpBTenuta" name="inpBTenuta" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="checkbox" id="inpTenutaRes" name="inpTenutaRes" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblCDTP" runat="server" Text="Pressione di taratura (CDTP)"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCDTPU" runat="server" Text="bar"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpCDTPV" name="inpCDTPV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="lblCDTPB" runat="server" Text="repeated"></asp:Label>&nbsp;
          </td>
          <td>
            <input type="checkbox" id="inpCDTPRes" name="inpCDTPRes" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblPerdita" runat="server" Text="Perdita sede"></asp:Label>&nbsp;
          </td>
          <td>
            <asp:Label ID="lblPerditaU" runat="server" Text="bar"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpPerdita90" name="inpPerdita90" runat="server" class="form-control" value="" readonly="true" />
          </td>
          <td>
            <input type="text" id="inBPerdita" name="inBPerdita" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="checkbox" id="inpPerditaRes" name="inpPerditaRes" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblPerditaAR" runat="server" Text="- perdita ammessa | massima rilevata"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblPerditaARU" runat="server" Text="bubbles/min"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpPdtA" name="inpPdtA" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="text" id="inpPdtR" name="inpPdtR" runat="server" class="form-control" value="" readonly="true" />
          </td>
        </tr>
      </table>
    </div>
    <hr width="100%" size="2" color="blue" />
    <div class="jumbotron">
      <table style="width: 60%">
        <tr>
          <td>
            <h3>Certificazione</h3>
          </td>
        </tr>
        <tr>
          <td width="40%">
            <asp:Label ID="lblFema" runat="server" Text="Collaudi FEMA"></asp:Label>
          </td>
          <td width="8%">
            <asp:Label ID="lblFemaU" runat="server" Text=" "></asp:Label>
          </td>
          <td width="25%">
            <input type="text" id="inpUser1" name="inpUser1" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td width="22%">
            <input type="text" id="inpDateU1"  runat="server" class="form-control" placeholder="Cliccare per data"/>
<%--            <input type="date" id="inpDateU1" name="inpDateU1" runat="server" class="form-control" value="" onclick="this.select()" />--%>
          </td>
          <td width="5%" class="hidden-text">
            <input type="checkbox" id="inpFemaRes" name="inpFemaRes" runat="server" class="form-control" value="" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblCliente" runat="server" Text="Collaudi Cliente"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblClienteU" runat="server" Text=" "></asp:Label>
          </td>
          <td>
            <input type="text" id="inpUser2" name="inpUser2" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="text" id="inpDateU2"  runat="server" class="form-control" placeholder="Cliccare per data"/>
<%--            <input type="date" id="inpDateU2" name="inpDateU2" runat="server" class="form-control" value="" />--%>
          </td>
        </tr>
      </table>
    </div>
    <hr width="100%" size="2" color="blue" />
    <asp:Button ID="btStart" runat="server" Text="START" CssClass="btn btn-primary" OnClick="ButtonStart_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btOrder" runat="server" Text="ORDER" CssClass="btn btn-primary" OnClick="ButtonOrder_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btOK" runat="server" Text="SAVE" CssClass="btn btn-primary" OnClick="ButtonOK_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnPrint" runat="server" Text="Pattano Print PDF" OnClick="btnExportPDF_P_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnPrint0" runat="server" Text="Rizzi Print PDF" OnClick="btnExportPDF_R_Click" />
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Height="600px" ProcessingMode="Local" ClientIDMode="AutoID" PageCountMode="Actual" SizeToReportContent="True"></rsweb:ReportViewer>
  </form>
    <script>
      function selectText(element) {
        const range = document.createRange();
        range.selectNodeContents(element);
        const selection = window.getSelection();
        selection.removeAllRanges();
        selection.addRange(range);
      }
      $(document).ready(function () {
        // Initialize DateTimePicker (https://xdsoft.net/jqplugins/datetimepicker/)
        $('#inpDateU1').datetimepicker({
          timepicker: false,
          format: 'd.m.Y',   // Date format: YYYY-MM-DD HH:mm
          minDate: '1970/01/01',
        });
        $('#inpDateU2').datetimepicker({
          timepicker: false,
          format: 'd.m.Y',   // Date format: YYYY-MM-DD HH:mm
          minDate: '1970/01/01',
        });
      });
    </script>
</body>
</html>

