<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowGlobe.aspx.cs" Inherits="CertQA.ShowGlobe" EnableEventValidation="false" %>

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
    .hidden-text { visibility: hidden; }
    .inptable {
      border-collapse: collapse;
      width: 60%;
      table-layout: fixed; /* Ensures columns respect set widths */
    }
    .inptable td:first-child  { width: 35%; }
    .inptable td:nth-child(2) { width: 20%; }
    .inptable td:nth-child(3) { width: 20%; }
    .inptable td:nth-child(4) { width: 20%; }
    .inptable td:last-child   { width: 5%;  }
  </style>
</head>

<body style="height: 767px">
  <form id="form1" runat="server" autocomplete="off">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <table style="width: 100%">
      <tr>
        <td style="text-align: center;">
          <h1>DOCUMENTAZIONE DI COMMESSA - Certificato di Qualità - Valvola Globo</h1>
        </td>
      </tr>
    </table>
    <table style="width: 100%">
      <tr>
        <td>
          <asp:Label ID="lblCustomer" runat="server" Text="Cliente: "></asp:Label>
        </td>
        <td>
          <asp:Label ID="lblCustomerNbr" runat="server" Text="">1234567</asp:Label>
        </td>
        <td style="width: 30%">
          <asp:Label ID="lblCustomerName" runat="server" Text="">test customer</asp:Label>
        </td>
        <td>
          <asp:Label ID="lblOrder" runat="server" Text="Ordine Cliente: "></asp:Label>
        </td>
        <td>
          <asp:Label ID="lblOrderNbr" runat="server" Text="">1234567</asp:Label>
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
          <asp:Label ID="lblCommessa" runat="server" Text="Commessa : "></asp:Label>
        </td>
        <td>
          <asp:Label ID="lblCommessaNbr" runat="server" Text="">1234567</asp:Label>
        </td>
        <td>
          <asp:Label ID="lblDummy1" runat="server" Text=""></asp:Label>
        </td>
        <td>
          <asp:Label ID="lblPos" runat="server" Text="Pos.: "></asp:Label>
        </td>
        <td>
          <asp:Label ID="lblPosNbr" runat="server" Text="">10</asp:Label>
        </td>
        <td>
          <asp:Label ID="lblDocDate" runat="server" Text="Data ordine: "></asp:Label>
        </td>
        <td>
          <asp:Label ID="lblDocDatedmy" runat="server" Text="">31.12.2999</asp:Label>
        </td>
      </tr>
      <tr>
        <td>
          <asp:Label ID="lblItem" runat="server" Text="Materiale: "></asp:Label>
        </td>
        <td>
          <asp:Label ID="lblItemNbr" runat="server" Text="">1234567890</asp:Label>
        </td>
        <td>
          <asp:Label ID="lblItemDesc" runat="server" Text="">test description</asp:Label>
        </td>
        <td>
          <asp:Label ID="lblItemQuantity" runat="server" Text="Quantità: "></asp:Label>
        </td>
        <td>
          <asp:Label ID="lblItemQty" runat="server" Text="">4456</asp:Label>
        </td>
        <td>
          <asp:Label ID="lblITP" runat="server" Text="ITP: "></asp:Label>
        </td>
        <td>
          <asp:Label ID="lblITPVal" runat="server" Text="">abcdefghijk</asp:Label>
        </td>
        <td>
          <asp:Label ID="lblQP" runat="server" Text="QC: "></asp:Label>
        </td>
        <td>
          <asp:Label ID="lblQPVal" runat="server" Text="">abc</asp:Label>
        </td>
      </tr>
      <tr>
        <td>
          <asp:Label ID="lblOdP" runat="server" Text="OdP: "></asp:Label>
        </td>
        <td>
          <asp:Label ID="lblOdPVal" runat="server" Text="">1122334455</asp:Label>
        </td>
        <td>
          <asp:Label ID="lblClass" runat="server" Text=""></asp:Label>
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
          <asp:Label ID="lblDelDate" runat="server" Text="Data consegna: "></asp:Label>
        </td>
        <td>
          <asp:Label ID="lblDelDateVal" runat="server" Text="">31.12.2999</asp:Label>
        </td>
      </tr>
    </table>
    <hr width="100%" size="2" color="blue" />
    <textarea runat="server" id="inpNote1" name="inpNote1" rows="2" cols="185" class="form-control" value=""></textarea>
    <input type="checkbox" id="inpNoteF" name="inpNoteF" runat="server" class="form-control" value="" />
    <hr width="100%" size="2" color="blue" />
    <div class="jumbotron">
      <table class="inptable">
        <tr>
          <td>
            <h3>Valvola</h3>
          </td>
          <td>
            <asp:Label ID="Label71" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label72" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label73" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label74" runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblDimNom" runat="server" Text="Dimensioni nominali"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpDimNomU" name="inpDimNomU" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <select name="inpDimNomV" id="inpDimNomV" runat="server" class="form-control" >
              <option value="25">25</option>
              <option value="32">32</option>
              <option value="40">40</option>
              <option value="50" selected>50</option>
              <option value="65">65</option>
              <option value="80">80</option>
              <option value="100">100</option>
              <option value="150">150</option>
              <option value="200">200</option>
            </select>
          </td>
          <td>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label34" runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblClassPress" runat="server" Text="Classi di pressione"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpClassPressU" name="inpClassPressU" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="text" id="inpClassPressV" name="inpClassPressV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label35" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label36" runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblConn" runat="server" Text="Connessioni"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblConnU" runat="server" Text="-"></asp:Label>
          </td>
          <td>
            <select name="inpConnV" id="inpConnV" runat="server" class="form-control" >
              <option value="BW" selected>BW</option>
              <option value="RF">RF</option>
            </select>
          </td>
          <td>
            <asp:Label ID="Label37" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label38" runat="server" Text=""></asp:Label>
          </td>
        </tr>
      </table>
    </div>
    <hr width="100%" size="2" color="blue" />
    <div class="jumbotron">
      <table class="inptable">
        <tr>
          <td>
            <h3>Azionamento</h3>
          </td>
          <td>
            <asp:Label ID="Label63" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label64" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label65" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label66" runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblVolantino" runat="server" Text="Volantino"></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label26" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <input type="checkbox" id="inpVolantinoF" name="inpVolantinoF" runat="server" class="form-control" value="" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblRiduttore" runat="server" Text="Riduttore multigiro"></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label27" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label28" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label29" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <input type="checkbox" id="inpRiduttoreF" name="inpRiduttoreF" runat="server" class="form-control" value="" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblRMatricola" runat="server" Text="- Matricola"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblRMatricolaU" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <input type="text" id="inpRMatricolaV" name="inpRMatricolaV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label39" runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblTipo" runat="server" Text="- Tipo"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTipoU" runat="server" Text="-"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpTipoV" name="inpTipoV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label42" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label43" runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblAttuatore" runat="server" Text="Attuatore"></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label31" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label32" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label33" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <input type="checkbox" id="inpAttuatoreF" name="inpAttuatoreF" runat="server" class="form-control" value="" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblAMatricola" runat="server" Text="- Matricola"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpAMatricolaU" name="inpAMatricolaU" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="text" id="inpAMatricolaV" name="inpAMatricolaV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label44" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label45" runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblATipo" runat="server" Text="- Tipo"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblATipoU" runat="server" Text="-"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpATipoV" name="inpATipoV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label48" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label49" runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblDiametroNom" runat="server" Text="- Diametro nominale"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblDiametroNomU" runat="server" Text="DN"></asp:Label>
          </td>
          <td>
            <select name="inpDiametroNomV" id="inpDiametroNomV" runat="server" class="form-control" >
              <option value="  " selected>  </option>
              <option value="50">50</option>
              <option value="80">80</option>
              <option value="110">110</option>
              <option value="150">150</option>
              <option value="210">200</option>
            </select>
          </td>
          <td>
            <asp:Label ID="Label6" runat="server" Text=" "></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label40" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblPressioneNom" runat="server" Text="- Pressione nominale"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblPressioneNomU" runat="server" Text="PN"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpPressioneNomV" name="inpPressioneNomV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label47" runat="server" Text=" "></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label50" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblAzioneM" runat="server" Text="- Azione molla"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblAzioneMU" runat="server" Text="-"></asp:Label>
          </td>
          <td>
            <select name="inpAzioneMV" id="inpAzioneMV" runat="server" class="form-control" >
              <option value=" " selected> </option>
              <option value="apre / open" >apre / open</option>
              <option value="chiude / close">chiude / close</option>
            </select>
          </td>
          <td>
            <asp:Label ID="Label5" runat="server" Text=" "></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label41" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblCampoM" runat="server" Text="- Campo molla"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCampoMU" runat="server" Text="bar"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpCampoMV" name="inpCampoMV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label52" runat="server" Text=" "></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label53" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblDPMax" runat="server" Text="- DP max"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblDPMaxU" runat="server" Text="bar"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpDPMaxV" name="inpDPMaxV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label7" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label46" runat="server" Text=""></asp:Label>
          </td>
        </tr>
      </table>
    </div>
    <hr width="100%" size="2" color="blue" />
    <div class="jumbotron">
      <table class="inptable">
        <tr>
          <td>
            <h3>Materiali</h3>
          </td>
          <td>
            <asp:Label ID="Label59" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label60" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label61" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label62" runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblTubo" runat="server" Text="Tubo prolunga/Estensione"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTuboU" runat="server" Text="-"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpTuboV" name="inpTuboV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label15" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label10" runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblTOtturatore" runat="server" Text="Tenuta otturatore"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTOtturatoreU" runat="server" Text="-"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpTOtturatoreV" name="inpTOtturatoreV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label16" runat="server" Text=" "></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label12" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblStelo" runat="server" Text="Stelo"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblSteloU" runat="server" Text="-"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpSteloV" name="inpSteloV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label18" runat="server" Text=" "></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label51" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
      </table>
    </div>
    <hr width="100%" size="2" color="blue" />
    <div class="jumbotron">
      <table class="inptable">
        <tr>
          <td>
            <h3>Controlli</h3>
          </td>
          <td>
            <asp:Label ID="Label55" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label56" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label57" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label58" runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblControllo" runat="server" Text="Controllo visivo/dimensionale"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblControlloU" runat="server" Text="FEMA"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblControlloV" runat="server" Text="applicable dwgs"></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label8" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <input type="checkbox" id="inpControlloF" name="inpControlloF" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblPuliziaO" runat="server" Text="Pulizia uso ossigeno"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblPuliziaOU" runat="server" Text="FEMA"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpPuliziaONorm" name="inpPuliziaONorm" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label20" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <input type="checkbox" id="inpPuliziaONormF" name="inpPuliziaONormF" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
      </table>
    </div>
    <hr width="100%" size="2" color="blue" />
    <div class="jumbotron">
      <table class="inptable">
        <tr>
          <td>
            <h3>Collaudi</h3>
          </td>
          <td>
            <asp:Label ID="lblTestBenchU" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTestBench" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblBTestBench" runat="server" Text="Banco prova"></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label21" runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblPIdro" runat="server" Text="Prova idrostatica"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblPIdroU" runat="server" Text="-"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpPIdroV" name="inpPIdroV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="text" id="inpPIdroB" name="inpPIdroB" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="checkbox" id="inpPIdroF" name="inpPIdroF" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblCCP" runat="server" Text="corpo-cappello-prolunga"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCCPU" runat="server" Text="bar | min"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpCCPV" name="inpCCPV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="text" id="inpCCPB" name="inpCCPB" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="checkbox" id="inpCCPF" name="inpCCPF" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblIncamiciatura" runat="server" Text="incamiciatura corpo"></asp:Label>&nbsp;
          </td>
          <td>
            <asp:Label ID="lblIncamiciaturaU" runat="server" Text="bar | min"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpIncamiciaturaV" name="inpIncamiciaturaV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="text" id="inpIncamiciaturaB" name="inpIncamiciaturaB" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="checkbox" id="inpIncamiciaturaF" name="inpIncamiciaturaF" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblAtt" runat="server" Text="attuatore"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblAttU" runat="server" Text="bar | min"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpAttV" name="inpAttV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="text" id="inpAttB" name="inpAttB" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="checkbox" id="inpAttF" name="inpAttF" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblTSoffietto" runat="server" Text="Tenuta soffietto"></asp:Label>&nbsp;
          </td>
          <td>
            <asp:Label ID="lblTSoffiettoU" runat="server" Text="-"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTSoffiettoV" runat="server" Text="bellows manufacturer"></asp:Label>&nbsp;
          </td>
          <td>
            <asp:Label ID="Label22" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <input type="checkbox" id="inpTSoffiettoF" name="inpTSoffiettoF" runat="server" class="form-control" value="" onclick="this.select()" />
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
            <input type="text" id="inpValvolaV" name="inpValvolaV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="text" id="inpValvolaB" name="inpValvolaB" runat="server" class="form-control" value="0" />
          </td>
          <td>
            <asp:Label ID="Label23" runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblTenuta" runat="server" Text="Prova tenuta guarnizioni"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTenutaU" runat="server" Text="bar | min"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpTenutaV" name="inpTenutaV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="text" id="inpTenutaB" name="inpTenutaB" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="checkbox" id="inpTenutaF" name="inpTenutaF" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblPerdita" runat="server" Text="Prova di perdita sede"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblPerditaU" runat="server" Text="bar | min"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpPerditaV" name="inpPerditaV" runat="server" class="form-control" value="" readonly="true" />
          </td>
          <td>
            <input type="text" id="inpPerditaB" name="inpPerditaB" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="checkbox" id="inpPerditaF" name="inpPerditaF" runat="server" class="form-control" value="" onclick="this.select()" />
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
            <input type="text" id="inpPerditaARA" name="inpPerditaARA" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="text" id="inpPerditaARR" name="inpPerditaARR" runat="server" class="form-control" value="" onclick="this.select()"  />
          </td>
          <td>
            <input type="checkbox" id="inpPerditaARF" name="inpPerditaARF" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblPerditaValle" runat="server" Text="Prova di perdita sede da valle"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblPerditaValleU" runat="server" Text="bar | min"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpPerditaValleV" name="inpPerditaValleV" runat="server" class="form-control" value="" readonly="true" />
          </td>
          <td>
            <input type="text" id="inPerditaValleB" name="inPerditaValleB" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="checkbox" id="inpPerditaValleF" name="inpPerditaValleF" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblPerditaARValle" runat="server" Text="- perdita ammessa | massima rilevata"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblPerditaARValleU" runat="server" Text="bubbles/min"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpPerditaARValleA" name="inpPerditaARValleA" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="text" id="inpPerditaARValleR" name="inpPerditaARValleR" runat="server" class="form-control" value="" onclick="this.select()"  />
          </td>
          <td>
            <input type="checkbox" id="inpPerditaARValleF" name="inpPerditaARValleF" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblCicli" runat="server" Text="Cicli di apertura e chiusura"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCicliU" runat="server" Text="bar"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpCicliV" name="inpCicliV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="text" id="inpCicliB" name="inpCicliB" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="checkbox" id="inpCicliF" name="inpCicliF" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblTempo" runat="server" Text="Tempo corsa (se applicabile)"></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label25" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label24" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label30" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <input type="checkbox" id="inpTempoF" name="inpTempoF" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblCorsa" runat="server" Text="- ammessa | rilevata"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCorsaU" runat="server" Text="secs"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpCorsaA" name="inpCorsaA" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="text" id="inpCorsaR" name="inpCorsaR" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="checkbox" id="inpCorsaF" name="inpCorsaF" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
      </table>
    </div>
    <hr width="100%" size="2" color="blue" />
    <div class="jumbotron">
      <table class="inptable">
        <tr>
          <td>
            <h3>Certificazione</h3>
          </td>
          <td>
            <asp:Label ID="Label67" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label68" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label69" runat="server" Text=""></asp:Label>
          </td>
          <td>
            <asp:Label ID="Label70" runat="server" Text=""></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblFema" runat="server" Text="Collaudi FEMA"></asp:Label>&nbsp;
          </td>
          <td>
            <asp:Label ID="lblFemaU" runat="server" Text=" "></asp:Label>
          </td>
          <td>
            <input type="text" id="inpUser1" name="inpUser1" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <input type="text" id="inpDateU1"  runat="server" class="form-control" placeholder="Cliccare per data"/>
          </td>
          <td>
            <asp:Label ID="Label75" runat="server" Text=""></asp:Label>
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
          </td>
          <td>
            <asp:Label ID="Label76" runat="server" Text=""></asp:Label>
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

