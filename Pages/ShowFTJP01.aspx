<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowFTJP01.aspx.cs" Inherits="CertQA.ShowFTJP01" EnableEventValidation="false"%>

<!DOCTYPE html>
 <html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title></title>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- jQuery DateTimePicker CSS & JS -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
    <style>
    </style>
  </head>

  <body style="height: 767px">
    <form id="form1" runat="server" autocomplete="off">
      <table style="width:100%">
        <tr>
          <td style="text-align: center;">
            <h1>DOCUMENTAZIONE DI COMMESSA - FTJP - 01</h1>
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
        <tr>
          <td>
            <asp:Label ID="lblMontatore"  runat="server" Text="">Montatore/Collaudatore: </asp:Label>
          </td>
          <td colspan="3">
            <input type="text" id="inpMontatore" name="inpMontatore"  runat="server" class="form-control" value="" onclick="this.select()" />
          </td>
          <td>
            <asp:Label ID="lblDateCollaudo"  runat="server" Text="">Data Collaudo: </asp:Label>
          </td>
          <td>
            <input type="text" id="inpDateCollaudo"  runat="server" class="form-control" placeholder="Cliccare per data"/>
<%--            <input type="date" id="inpDateCollaudo" name="inpDateCollaudo" runat="server" class="form-control" value="" />--%>
          </td>
        </tr>
      </table>
      <hr width="100%" size="2" color="blue"/>
      <table style="width:80%">
        <tr>
          <th>Parte</th>
          <th>Colate</th>
          <th>Materiale</th>
          <th>N.Matricola</th>
          <th>     </th>
          <th>Colate</th>
          <th>Materiale</th>
          <th>N.Matricola</th>
        </tr>
        <tr>
          <td style="width:20%">
            <asp:Label ID="lblParte01"  runat="server" Text="">CORPO/CURVE</asp:Label>
          </td>
          <td>
            <input type="text" id="inpColataCC1" name="inpColataCC1"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpMaterialeCC1" name="inpMaterialeCC1"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpMatricolaCC1" name="inpMatricolaCC1"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <asp:Label ID="Label1"  runat="server" Text="     "></asp:Label>
          </td>
          <td>
            <input type="text" id="inpColataCC2" name="inpColataCC2"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpMaterialeCC2" name="inpMaterialeCC2"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpMatricolaCC2" name="inpMatricolaCC2"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblParte02"  runat="server" Text="">CAPPELLO/ESTENSIONE</asp:Label>
          </td>
          <td>
            <input type="text" id="inpColataCE1" name="inpColataCE1"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpMaterialeCE1" name="inpMaterialeCE1"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpMatricolaCE1" name="inpMatricolaCE1"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <asp:Label ID="Label2"  runat="server" Text="     "></asp:Label>
          </td>
          <td>
            <input type="text" id="inpColataCE2" name="inpColataCE2"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpMaterialeCE2" name="inpMaterialeCE2"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpMatricolaCE2" name="inpMatricolaCE2"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblParte03"  runat="server" Text="">OTTURATORE</asp:Label>
          </td>
          <td>
            <input type="text" id="inpColataOT1" name="inpColataOT1"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpMaterialeOT1" name="inpMaterialeOT1"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpMatricolaOT1" name="inpMatricolaOT1"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <asp:Label ID="Label3"  runat="server" Text="     "></asp:Label>
          </td>
          <td>
            <input type="text" id="inpColataOT2" name="inpColataOT2"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpMaterialeOT2" name="inpMaterialeOT2"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpMatricolaOT2" name="inpMatricolaOT2"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblParte06"  runat="server" Text="">UGELLO</asp:Label>
          </td>
          <td>
            <input type="text" id="inpColataUG1" name="inpColataUG1"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpMaterialeUG1" name="inpMaterialeUG1"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpMatricolaUG1" name="inpMatricolaUG1"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <asp:Label ID="Label7"  runat="server" Text="     "></asp:Label>
          </td>
          <td>
            <input type="text" id="inpColataUG2" name="inpColataUG2"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpMaterialeUG2" name="inpMaterialeUG2"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpMatricolaUG2" name="inpMatricolaUG2"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblParte04"  runat="server" Text="">STELO</asp:Label>
          </td>
          <td>
            <input type="text" id="inpColataST1" name="inpColataST1"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpMaterialeST1" name="inpMaterialeST1"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpMatricolaST1" name="inpMatricolaST1"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <asp:Label ID="Label4"  runat="server" Text="     "></asp:Label>
          </td>
          <td>
            <input type="text" id="inpColataST2" name="inpColataST2"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpMaterialeST2" name="inpMaterialeST2"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpMatricolaST2" name="inpMatricolaST2"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblParte05"  runat="server" Text="">MOLLA</asp:Label>
          </td>
          <td>
            <input type="text" id="inpColataMO1" name="inpColataMO1"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpMaterialeMO1" name="inpMaterialeMO1"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpMatricolaMO1" name="inpMatricolaMO1"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <asp:Label ID="Label5"  runat="server" Text="     "></asp:Label>
          </td>
          <td>
            <input type="text" id="inpColataMO2" name="inpColataMO2"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpMaterialeMO2" name="inpMaterialeMO2"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpMatricolaMO2" name="inpMatricolaMO2"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
        </tr>
        <tr>
          <td>
            <asp:Label ID="lblNote"  runat="server" Text="">Altri particolare / Note</asp:Label>
          </td>
          <td colspan="3">
            <textarea runat="server" id="inpNote1" name="inpNote1" rows="5" cols="70" class="form-control" onclick="this.select()" ></textarea>
          </td>
          <td>
            <asp:Label ID="Label6"  runat="server" Text="     "></asp:Label>
          </td>
          <td colspan="3">
            <textarea runat="server" id="inpNote2" name="inpNote2" rows="5" cols="70" class="form-control" onclick="this.select()" ></textarea>
          </td>
        </tr>
      </table>
      <hr width="100%" size="2" color="blue"/>
      <table style="width:100%">
        <tr>
          <th style="text-align: left;">N.Matricola</th>
          <th style="text-align: left;">Prova idraulica</th>
          <th style="text-align: left;">Prova di tenuta (bolle/min)</th>
          <th style="text-align: left;">Banco Prova idraulica</th>
          <th style="text-align: left;">Data Prova idraulica</th>
          <th style="text-align: left;">Banco Prova tenuta</th>
          <th style="text-align: left;">Data Prova tenuta</th>
        </tr>
        <tr>
          <td>
            <input type="text" id="inpSeriale01" name="inpSeriale01"  runat="server" class="form-control" readonly="readonly"/>
          </td>
          <td>
            <input type="text" id="inpProvaIdro01" name="inpProvaIdro01"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpProvaTen01" name="inpProvaTen01"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpBancoPIdraulica" name="inpBancoPIdraulica"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpDatePIdraulica"  runat="server" class="form-control" placeholder="Cliccare per data"/>
<%--            <input type="date" id="inpDatePIdraulica" name="inpDatePIdraulica" runat="server" class="form-control" value="" />--%>
          </td>
          <td>
            <input type="text" id="inpBancoPTenuta" name="inpBancoPTenuta"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpDatePTenuta"  runat="server" class="form-control" placeholder="Cliccare per data"/>
<%--            <input type="date" id="inpDatePTenuta" name="inpDatePTenuta" runat="server" class="form-control" value="" />--%>
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" id="inpSeriale02" name="inpSeriale02"  runat="server" class="form-control" readonly="readonly"/>
          </td>
          <td>
            <input type="text" id="inpProvaIdro02" name="inpProvaIdro02"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpProvaTen02" name="inpProvaTen02"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" id="inpSeriale03" name="inpSeriale03"  runat="server" class="form-control" readonly="readonly"/>
          </td>
          <td>
            <input type="text" id="inpProvaIdro03" name="inpProvaIdro03"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpProvaTen03" name="inpProvaTen03"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" id="inpSeriale04" name="inpSeriale04"  runat="server" class="form-control" readonly="readonly"/>
          </td>
          <td>
            <input type="text" id="inpProvaIdro04" name="inpProvaIdro04"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpProvaTen04" name="inpProvaTen04"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" id="inpSeriale05" name="inpSeriale05"  runat="server" class="form-control" readonly="readonly"/>
          </td>
          <td>
            <input type="text" id="inpProvaIdro05" name="inpProvaIdro05"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpProvaTen05" name="inpProvaTen05"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" id="inpSeriale06" name="inpSeriale06"  runat="server" class="form-control" readonly="readonly"/>
          </td>
          <td>
            <input type="text" id="inpProvaIdro06" name="inpProvaIdro06"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpProvaTen06" name="inpProvaTen06"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" id="inpSeriale07" name="inpSeriale07"  runat="server" class="form-control" readonly="readonly"/>
          </td>
          <td>
            <input type="text" id="inpProvaIdro07" name="inpProvaIdro07"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpProvaTen07" name="inpProvaTen07"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" id="inpSeriale08" name="inpSeriale08"  runat="server" class="form-control" readonly="readonly"/>
          </td>
          <td>
            <input type="text" id="inpProvaIdro08" name="inpProvaIdro08"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpProvaTen08" name="inpProvaTen08"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" id="inpSeriale09" name="inpSeriale09"  runat="server" class="form-control" readonly="readonly"/>
          </td>
          <td>
            <input type="text" id="inpProvaIdro09" name="inpProvaIdro09"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpProvaTen09" name="inpProvaTen09"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" id="inpSeriale10" name="inpSeriale10"  runat="server" class="form-control" readonly="readonly"/>
          </td>
          <td>
            <input type="text" id="inpProvaIdro10" name="inpProvaIdro10"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpProvaTen10" name="inpProvaTen10"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" id="inpSeriale11" name="inpSeriale11"  runat="server" class="form-control" readonly="readonly"/>
          </td>
          <td>
            <input type="text" id="inpProvaIdro11" name="inpProvaIdro11"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpProvaTen11" name="inpProvaTen11"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" id="inpSeriale12" name="inpSeriale12"  runat="server" class="form-control" readonly="readonly"/>
          </td>
          <td>
            <input type="text" id="inpProvaIdro12" name="inpProvaIdro12"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
          <td>
            <input type="text" id="inpProvaTen12" name="inpProvaTen12"  runat="server" class="form-control" value="" onclick="this.select()"/>
          </td>
        </tr>
      </table>
      <hr width="100%" size="2" color="blue"/>
      <asp:Button ID="btStart" runat="server" Text="START" CssClass="btn btn-primary" OnClick="ButtonStart_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="btOrder" runat="server" Text="ORDER" CssClass="btn btn-primary" OnClick="ButtonOrder_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="btOK" runat="server" Text="SAVE" CssClass="btn btn-primary" OnClick="ButtonOK_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="btNext" runat="server" Text="FTJP02" CssClass="btn btn-primary" OnClick="ButtonNext_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Label ID="savRecordId" runat="server" Text="" Visible="false"></asp:Label>&nbsp;
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
        $('#inpDateCollaudo').datetimepicker({
          timepicker: false,
          format: 'd.m.Y',   // Date format: YYYY-MM-DD HH:mm
          minDate: '1970/01/01',
        });
        $('#inpDatePIdraulica').datetimepicker({
          timepicker: false,
          format: 'd.m.Y',   // Date format: YYYY-MM-DD HH:mm
          minDate: '1970/01/01',
        });
        $('#inpDatePTenuta').datetimepicker({
          timepicker: false,
          format: 'd.m.Y',   // Date format: YYYY-MM-DD HH:mm
          minDate: '1970/01/01',
        });
      });
    </script>
  </body>
</html>
