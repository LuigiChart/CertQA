<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowRevision.aspx.cs" Inherits="CertQA.ShowRevision" EnableEventValidation="false" %>

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
          <h1>DOCUMENTAZIONE DI COMMESSA - Certificato di Qualità - Valvola di sicurezza - Revisione</h1>
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
          <asp:Label ID="lblDocDatedmy" runat="server" Text="">31/12/2024</asp:Label>
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
          <td class="hidden-text">
          <asp:Label ID="lblMatricolaFrom" runat="server" Text="Matricola iniziale: "></asp:Label>
        </td>
          <td class="hidden-text">
          <asp:Label ID="lblMatricolaFromValue" runat="server" Text="">1234567</asp:Label>
        </td>
          <td class="hidden-text">
          <asp:Label ID="lblMatricolaTo" runat="server" Text="finale: "></asp:Label>
        </td>
          <td class="hidden-text">
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
    <textarea runat="server" id="inpNote1" name="inpNote1" rows="2" cols="185" class="form-control" value="" readonly="true"></textarea>
    <hr width="100%" size="2" color="blue" />
    <div class="jumbotron">
      <table style="width: 60%">
        <tr>
          <td>
            <h3>Valvola</h3>
          </td>
        </tr>
        <tr>
          <td width="40%">
            <asp:Label ID="lblModelloV" runat="server" Text="Modello"></asp:Label>
          </td>
          <td width="8%">
            <asp:Label ID="lblModelloU" runat="server" Text="-"></asp:Label>
          </td>
          <td width="25%">
            <input type="text" id="inpModello" name="inpModello" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td width="27%">
            <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblDimNom" runat="server" Text="Dimensioni nominali"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblDimNomU" runat="server" Text="NPS"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpDimNomV" name="inpDimNomV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblClassPress" runat="server" Text="Classi di pressione"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblClassPressU" runat="server" Text="ANSI"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpClassPressV" name="inpClassPressV" runat="server" class="form-control" value="" onclick="this.select()" />
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
            <input type="text" id="inpConnV" name="inpConnV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
      </table>
    </div>
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
            <asp:Label ID="lblFluido" runat="server" Text="Fluido"></asp:Label>
          </td>
          <td width="8%">
            <asp:Label ID="lblFluidoU" runat="server" Text="-"></asp:Label>
          </td>
          <td width="25%">
            <input type="text" id="inpFluidoV" name="inpFluidoV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td width="27%">
            <asp:Label ID="Label2" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblStato" runat="server" Text="Stato fisico"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblStatoU" runat="server" Text="-"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpStatoV" name="inpStatoV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label3" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblCoeSc" runat="server" Text="Coefficiente di scarico Liq|Gas"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCoeScU" runat="server" Text="-"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpCoeScV" name="inpCoeScV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label4" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblOri" runat="server" Text="Orificio"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblOriU" runat="server" Text="-"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpOriV" name="inpOriV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label5" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblDiametro" runat="server" Text="Diametro "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblDiametroU" runat="server" Text="mm"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpDiametroV" name="inpDiametroV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label6" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblAScarico" runat="server" Text="Area di scarico "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblAScaricoU" runat="server" Text="cm2"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpAScaricoV" name="inpAScaricoV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label7" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblSovrapressione" runat="server" Text="Sovrapressione "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblSovrapressioneU" runat="server" Text="%"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpSovrapressioneV" name="inpSovrapressioneV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label8" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblAlzMin" runat="server" Text="Alzata minima "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblAlzMinU" runat="server" Text="mm"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpAlzMinV" name="inpAlzMinV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label9" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblRichiusura" runat="server" Text="Richiusura "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblRichiusuraU" runat="server" Text="%"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpRichiusuraV" name="inpRichiusuraV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label10" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblLimTemp" runat="server" Text="Limiti di temperatura "></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblLimTempU" runat="server" Text="%"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpLimTempV" name="inpLimTempV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label11" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblPortataMax" runat="server" Text="Portata massima scaricabile"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblPortataMaxU" runat="server" Text="kg/h"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpPortataMax" name="inpPortataMax" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label12" runat="server" Text=" "></asp:Label>
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
            <asp:Label ID="lblCorpo" runat="server" Text="Corpo"></asp:Label>
          </td>
          <td width="8%">
            <asp:Label ID="lblCorpoU" runat="server" Text="-"></asp:Label>
          </td>
          <td width="25%">
            <input type="text" id="inpCorpoV" name="inpCorpoV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label13" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblCappello" runat="server" Text="Cappello"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCappelloU" runat="server" Text="-"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpCappelloV" name="inpCappelloV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label14" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblCappuccio" runat="server" Text="Cappuccio"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCappuccioU" runat="server" Text="-"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpCappuccioV" name="inpCappuccioV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label15" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblUgello" runat="server" Text="Ugello"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblUgelloU" runat="server" Text="-"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpUgelloV" name="inpUgelloV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label16" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblOtturatore" runat="server" Text="Otturatore"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblOtturatoreU" runat="server" Text="-"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpOtturatoreV" name="inpOtturatoreV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label17" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblMolla" runat="server" Text="Molla"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblMollaU" runat="server" Text="-"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpMollaV" name="inpMollaV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label18" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblSoffietto" runat="server" Text="Soffietto"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblSoffiettoU" runat="server" Text="-"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpSoffiettoV" name="inpSoffiettoV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label19" runat="server" Text=" "></asp:Label>
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
            <asp:Label ID="lblPressTNom" runat="server" Text="Pressione di taratura nominale"></asp:Label>
          </td>
          <td width="8%">
            <asp:Label ID="lblPressTNomU" runat="server" Text="bar"></asp:Label>
          </td>
          <td width="25%">
            <input type="text" id="inpPressTNomV" name="inpPressTNomV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label20" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblTempSca" runat="server" Text="Temperatura di scarico"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblTempScaU" runat="server" Text="°C"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpTempScaV" name="inpTempScaV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label21" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblPortata" runat="server" Text="Portata"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblPortataU" runat="server" Text="kg/h"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpPortataV" name="inpPortataV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label22" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblCPressG" runat="server" Text="Contropressione generata"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCPressGU" runat="server" Text="bar"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpCPressGV" name="inpCPressGV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label23" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblCPressI" runat="server" Text="Contropressione imposta"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCPressIU" runat="server" Text="bar"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpCPressIV" name="inpCPressIV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label24" runat="server" Text=" "></asp:Label>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblCPressT" runat="server" Text="Contropressione totale"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCPressTU" runat="server" Text="bar"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpCPressTV" name="inpCPressTV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="Label25" runat="server" Text=" "></asp:Label>
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
        <tr>
          <td>
            <asp:Label ID="lblCodiceMolla" runat="server" Text="Codice molla"></asp:Label>
          </td>
          <td>
            <asp:Label ID="lblCodiceMollaU" runat="server" Text="-"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpCodiceMollaV" name="inpCodiceMollaV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td class="hidden-text">
            <input type="text" id="inpBCodiceMolla" name="inpBCodiceMolla" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td class="hidden-text">
            <input type="checkbox" id="inpCodiceMollaRes" name="inpCodiceMollaRes" runat="server" class="form-control" value="" onclick="this.select()" />
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
          <td width="40%">
            <asp:Label ID="lblValvola" runat="server" Text="Valvola assiemata"></asp:Label>&nbsp;
          </td>
          <td width="8%" class="hidden-text">
            <asp:Label ID="lblValvolaU" runat="server" Text="-"></asp:Label>
          </td>
          <td width="25%">
            <input type="text" id="inpValvolaV" name="inpValvolaV" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td width="22%">
            <input type="text" id="inpBValvola" name="inpBValvola" runat="server" class="form-control" value="0" />
          </td>
          <td width="5%" class="hidden-text">
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
            <input type="text" id="inpTenutaV" name="inpTenutaV" runat="server" class="form-control" value="" onclick="this.select()" />
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
            <asp:Label ID="lblCDTPB" runat="server" Text="repeated"></asp:Label>
          </td>
          <td>
            <input type="checkbox" id="inpCDTPRes" name="inpCDTPRes" runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblPerdita" runat="server" Text="Perdita sede"></asp:Label>
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
            <input type="text" id="inpPdtR" name="inpPdtR" runat="server" class="form-control" value="" onclick="this.select()"  />
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
            <asp:Label ID="lblFema" runat="server" Text="Collaudi FEMA"></asp:Label>&nbsp;
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

