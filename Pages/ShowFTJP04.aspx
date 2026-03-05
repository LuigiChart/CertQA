<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowFTJP04.aspx.cs" Inherits="CertQA.ShowFTJP04" EnableEventValidation="false"%>

<!DOCTYPE html>
  <style>
    table.t2 td { border: 2px solid green }
    table.t3 input {width: 100% }
}  </style>
  <html xmlns="http://www.w3.org/1999/xhtml">
  <body style="height: 767px">
    <form id="form1" runat="server">
      <table class="t1" style="width:100%">
        <tr>
          <td style="width:40%">
            <h1>PIANO DI ISPEZIONE E COLLAUDO</h1>
          </td>
          <td style="width:5%">
            <asp:Label ID="lblDocument"     runat="server" Text="DOC.N°: "></asp:Label>
          </td>
          <td style="width:15%">
            <asp:Label ID="lblDocumentNr"  runat ="server" Text="">ITP-STD-3N00-2</asp:Label>
          </td>
        </tr>
        <tr>
          <td style="width:40%">
            <h2>VALVOLE DI SICUREZZA S.3100/3200/3300/3400</h2>
          </td>
          <td style="width:5%">
            <asp:Label ID="lblRev"     runat="server" Text="REV: "></asp:Label>
          </td>
          <td style="width:15%">
            <asp:Label ID="lblRevNr"  runat ="server" Text="">0</asp:Label>
          </td>
<%--          <td style="width:10%">
            <asp:Label ID="lblAllegato"     runat="server" Text="All. 2 - ITP-STD-3N00"></asp:Label>
          </td>--%>
        </tr>
      </table>
      <table class="t2" style="width:100%">
        <tr>
          <td style="width:30%">
            <asp:Label ID="lblHdr1"  runat="server" Text="APPROVVIGIONAMENTO MATERIALI GREZZI"></asp:Label>
          </td>
          <td style="width:40%">
            <asp:Label ID="lblHdr2"  runat="server" Text="COMPONENTE"></asp:Label>
          </td>
          <td style="width:30%">
            <asp:Label ID="lblHdr3"  runat="server" Text="TUTTI"></asp:Label>
          </td>
        </tr>
      </table>
      <table class="t3" style="width:100%">
        <tr>
          <th scope="col" rowspan="2">POS</th>
          <th scope="col" rowspan="2">ATTIVITA'</th>
          <th scope="col" rowspan="2">PROCEDURA</th>
          <th scope="col" rowspan="2">CRITERI DI ACCETTAZIONE</th>
          <th scope="col" colspan="8">CODICE ISPEZIONE</th>
          <th scope="col" rowspan="2">DOC PER VERIFICA</th>
          <th scope="col" rowspan="2">NOTE</th>
        </tr>
        <tr>
          <th scope="col">F</th>
          <th scope="col">%</th>
          <th scope="col">C</th>
          <th scope="col">%</th>
          <th scope="col">T</th>
          <th scope="col">%</th>
          <th scope="col">A</th>
          <th scope="col">%</th>
        </tr>
        <tr>
          <td style="width:2%" scope="col" rowspan="2">
            <asp:Label ID="lblPos1"  runat="server" Text="">1</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblAtt1"  runat="server" Text="">Identificare materiali/certificati</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblPro1"  runat="server" Text="">SP-STD-3N00</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblMds1"  runat="server" Text="">MDS di riferimento</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblF1"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblFPct1"  runat="server" Text="">100</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblC1"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblCPct1"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblT1"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblTPct1"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblA1"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblAPct1"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:10%; text-align: center;" scope="col" rowspan="2">
            <asp:Label ID="lblDoc1"  runat="server" Text="">Certificati</asp:Label>
          </td>
          <td>
            <input type="text" id="inpNote1" name="inpNote1"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td scope="col" colspan="8">
            <input type="text" id="inpR1" name="inpR1"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td style="width:2%" scope="col" rowspan="2">
            <asp:Label ID="lblPos2"  runat="server" Text="">2</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblAtt2"  runat="server" Text="">Controllo visivo e dimensionale grezzi</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblPro2"  runat="server" Text="">MSS-SP55</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblMds2"  runat="server" Text="">MSS-SP55</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblF2"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblFPct2"  runat="server" Text="">100</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblC2"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblCPct2"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblT2"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblTPct2"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblA2"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblAPct2"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:10%; text-align: center;" scope="col" rowspan="2">
            <asp:Label ID="lblDoc2"  runat="server" Text="">Rapporto</asp:Label>
          </td>
          <td>
            <input type="text" id="inpNote2" name="inpNote2"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td scope="col" colspan="8">
            <input type="text" id="inpR2" name="inpR2"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td style="width:2%" scope="col" rowspan="2">
            <asp:Label ID="lblPos3"  runat="server" Text="">3</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblAtt3"  runat="server" Text="">Controllo marcatura</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblPro3"  runat="server" Text="">PAQ-210</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblMds3"  runat="server" Text="">PAQ-210</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblF3"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblFPct3"  runat="server" Text="">100</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblC3"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblCPct3"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblT3"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblTPct3"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblA3"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblAPct3"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:10%; text-align: center;" scope="col" rowspan="2">
            <asp:Label ID="lblDoc3"  runat="server" Text="">Rapporto</asp:Label>
          </td>
          <td>
            <input type="text" id="inpNote3" name="inpNote3"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td scope="col" colspan="8">
            <input type="text" id="inpR3" name="inpR3"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
      </table>
      <table class="t2" style="width:100%">
        <tr>
          <td style="width:30%">
            <asp:Label ID="lblHdr4"  runat="server" Text="VERIFICHE POST LAVORAZIONI"></asp:Label>
          </td>
          <td style="width:40%">
            <asp:Label ID="lblHdr5"  runat="server" Text="COMPONENTE"></asp:Label>
          </td>
          <td style="width:30%">
            <asp:Label ID="lblHdr6"  runat="server" Text="CORPO-TRIM"></asp:Label>
          </td>
        </tr>
      </table>
      <table class="t3" style="width:100%">
        <tr>
          <th scope="col" rowspan="2">POS</th>
          <th scope="col" rowspan="2">ATTIVITA'</th>
          <th scope="col" rowspan="2">PROCEDURA</th>
          <th scope="col" rowspan="2">CRITERI DI ACCETTAZIONE</th>
          <th scope="col" colspan="8">CODICE ISPEZIONE</th>
          <th scope="col" rowspan="2">DOC PER VERIFICA</th>
          <th scope="col" rowspan="2">NOTE</th>
        </tr>
        <tr>
          <th scope="col">F</th>
          <th scope="col">%</th>
          <th scope="col">C</th>
          <th scope="col">%</th>
          <th scope="col">T</th>
          <th scope="col">%</th>
          <th scope="col">A</th>
          <th scope="col">%</th>
        </tr>
        <tr>
          <td style="width:2%" scope="col" rowspan="2">
            <asp:Label ID="lblPos4"  runat="server" Text="">1</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblAtt4"  runat="server" Text="">Controllo visivo e dimensionale corpi</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblPro4"  runat="server" Text="">Disegni Construttivi</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblMds4"  runat="server" Text="">Disegni Construttivi</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblF4"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblFPct4"  runat="server" Text="">100</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblC4"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblCPct4"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblT4"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblTPct4"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblA4"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblAPct4"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:10%; text-align: center;" scope="col" rowspan="2">
            <asp:Label ID="lblDoc4"  runat="server" Text="">Rapporto</asp:Label>
          </td>
          <td>
            <input type="text" id="inpNote4" name="inpNote4"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td scope="col" colspan="8">
            <input type="text" id="inpR4" name="inpR4"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td style="width:2%" scope="col" rowspan="2">
            <asp:Label ID="lblPos5"  runat="server" Text="">2</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblAtt5"  runat="server" Text="">Controllo visivo e dimensionale trim</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblPro5"  runat="server" Text="">Disegni Construttivi</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblMds5"  runat="server" Text="">Disegni Construttivi</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblF5"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblFPct5"  runat="server" Text="">100</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblC5"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblCPct5"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblT5"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblTPct5"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblA5"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblAPct5"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:10%; text-align: center;" scope="col" rowspan="2">
            <asp:Label ID="lblDoc5"  runat="server" Text="">Rapporto</asp:Label>
          </td>
          <td>
            <input type="text" id="inpNote5" name="inpNote5"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td scope="col" colspan="8">
            <input type="text" id="inpR5" name="inpR5"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td style="width:2%" scope="col" rowspan="2">
            <asp:Label ID="lblPos6"  runat="server" Text="">3</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblAtt6"  runat="server" Text="">Controllo marcatura</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblPro6"  runat="server" Text="">PAQ-210</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblMds6"  runat="server" Text="">PAQ-210</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblF6"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblFPct6"  runat="server" Text="">100</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblC6"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblCPct6"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblT6"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblTPct6"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblA6"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblAPct6"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:10%; text-align: center;" scope="col" rowspan="2">
            <asp:Label ID="lblDoc6"  runat="server" Text="">Rapporto</asp:Label>
          </td>
          <td>
            <input type="text" id="inpNote6" name="inpNote6"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td scope="col" colspan="8">
            <input type="text" id="inpR6" name="inpR6"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td style="width:2%" scope="col" rowspan="2">
            <asp:Label ID="lblPos7"  runat="server" Text="">4</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblAtt7"  runat="server" Text="">Prova idrostatica corpi</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblPro7"  runat="server" Text="">STD-606</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblMds7"  runat="server" Text="">B-16.5</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblF7"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblFPct7"  runat="server" Text="">100</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblC7"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblCPct7"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblT7"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblTPct7"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblA7"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblAPct7"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:10%; text-align: center;" scope="col" rowspan="2">
            <asp:Label ID="lblDoc7"  runat="server" Text="">Rapporto</asp:Label>
          </td>
          <td>
            <input type="text" id="inpNote7" name="inpNote7"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td scope="col" colspan="8">
            <input type="text" id="inpR7" name="inpR7"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
      </table>
      <table class="t2" style="width:100%">
        <tr>
          <td style="width:30%">
            <asp:Label ID="lblHdr7"  runat="server" Text="MONTAGGIO"></asp:Label>
          </td>
          <td style="width:40%">
            <asp:Label ID="lblHdr8"  runat="server" Text="COMPONENTE"></asp:Label>
          </td>
          <td style="width:30%">
            <asp:Label ID="lblHdr9"  runat="server" Text="TUTTI"></asp:Label>
          </td>
        </tr>
      </table>
      <table class="t3" style="width:100%">
        <tr>
          <th scope="col" rowspan="2">POS</th>
          <th scope="col" rowspan="2">ATTIVITA'</th>
          <th scope="col" rowspan="2">PROCEDURA</th>
          <th scope="col" rowspan="2">CRITERI DI ACCETTAZIONE</th>
          <th scope="col" colspan="8">CODICE ISPEZIONE</th>
          <th scope="col" rowspan="2">DOC PER VERIFICA</th>
          <th scope="col" rowspan="2">NOTE</th>
        </tr>
        <tr>
          <th scope="col">F</th>
          <th scope="col">%</th>
          <th scope="col">C</th>
          <th scope="col">%</th>
          <th scope="col">T</th>
          <th scope="col">%</th>
          <th scope="col">A</th>
          <th scope="col">%</th>
        </tr>
        <tr>
          <td style="width:2%" scope="col" rowspan="2">
            <asp:Label ID="lblPos8"  runat="server" Text="">1</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblAtt8"  runat="server" Text="">Controllo pulizia particolari</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblPro8"  runat="server" Text="">STD-409.5</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblMds8"  runat="server" Text="">STD-409.5</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblF8"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblFPct8"  runat="server" Text="">100</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblC8"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblCPct8"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblT8"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblTPct8"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblA8"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblAPct8"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:10%; text-align: center;" scope="col" rowspan="2">
            <asp:Label ID="lblDoc8"  runat="server" Text=" "></asp:Label>
          </td>
          <td>
            <input type="text" id="inpNote8" name="inpNote8"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td scope="col" colspan="8">
            <input type="text" id="inpR8" name="inpR8"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td style="width:2%" scope="col" rowspan="2">
            <asp:Label ID="lblPos9"  runat="server" Text="">2</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblAtt9"  runat="server" Text="">Montaggio valvola di sicurezza</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblPro9"  runat="server" Text="">STD-EN-616</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblMds9"  runat="server" Text="">STD-EN-616</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblF9"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblFPct9"  runat="server" Text="">100</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblC9"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblCPct9"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblT9"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblTPct9"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblA9"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblAPct9"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:10%; text-align: center;" scope="col" rowspan="2">
            <asp:Label ID="lblDoc9"  runat="server" Text=" "></asp:Label>
          </td>
          <td>
            <input type="text" id="inpNote9" name="inpNote9"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
      </table>

      <table class="t2" style="width:100%">
        <tr>
          <td style="width:30%">
            <asp:Label ID="lblHdr10"  runat="server" Text="CONTROLLI / COLLAUDI FINALI"></asp:Label>
          </td>
          <td style="width:40%">
            <asp:Label ID="lblHdr11"  runat="server" Text="COMPONENTE"></asp:Label>
          </td>
          <td style="width:30%">
            <asp:Label ID="lblHdr12"  runat="server" Text="VALVOLA ASSEMBLATA"></asp:Label>
          </td>
        </tr>
      </table>
      <table class="t3" style="width:100%">
        <tr>
          <th scope="col" rowspan="2">POS</th>
          <th scope="col" rowspan="2">ATTIVITA'</th>
          <th scope="col" rowspan="2">PROCEDURA</th>
          <th scope="col" rowspan="2">CRITERI DI ACCETTAZIONE</th>
          <th scope="col" colspan="8">CODICE ISPEZIONE</th>
          <th scope="col" rowspan="2">DOC PER VERIFICA</th>
          <th scope="col" rowspan="2">NOTE</th>
        </tr>
        <tr>
          <th scope="col">F</th>
          <th scope="col">%</th>
          <th scope="col">C</th>
          <th scope="col">%</th>
          <th scope="col">T</th>
          <th scope="col">%</th>
          <th scope="col">A</th>
          <th scope="col">%</th>
        </tr>
        <tr>
          <td style="width:2%" scope="col" rowspan="2">
            <asp:Label ID="lblPos10"  runat="server" Text="">1</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblAtt10"  runat="server" Text="">Controllo visivo e dimensionale</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblPro10"  runat="server" Text="">Disegni commerciali</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblMds10"  runat="server" Text="">Disegni commerciali</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblF10"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblFPct10"  runat="server" Text="">100</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblC10"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblCPct10"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblT10"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblTPct10"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblA10"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblAPct10"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:10%; text-align: center;" scope="col" rowspan="2">
            <asp:Label ID="lblDoc10"  runat="server" Text="Rapporto"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpNote10" name="inpNote10"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td scope="col" colspan="8">
            <input type="text" id="inpR10" name="inpR10"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td style="width:2%" scope="col" rowspan="2">
            <asp:Label ID="lblPos11"  runat="server" Text="">2</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblAtt11"  runat="server" Text="">Prova taratura</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblPro11"  runat="server" Text="">CQ 8302</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblMds11"  runat="server" Text="">ANCC Raccolta E Cap. E1D</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblF11"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblFPct11"  runat="server" Text="">100</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblC11"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblCPct11"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblT11"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblTPct11"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblA11"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblAPct11"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:10%; text-align: center;" scope="col" rowspan="2">
            <asp:Label ID="lblDoc11"  runat="server" Text="Rapporto"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpNote11" name="inpNote11"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td scope="col" colspan="8">
            <input type="text" id="inpR11" name="inpR11"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td style="width:2%" scope="col" rowspan="2">
            <asp:Label ID="lblPos12"  runat="server" Text="">3</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblAtt12"  runat="server" Text="">Prova di tenuta</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblPro12"  runat="server" Text="">CQ 8302</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblMds12"  runat="server" Text="">API 527</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblF12"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblFPct12"  runat="server" Text="">100</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblC12"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblCPct12"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblT12"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblTPct12"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblA12"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblAPct12"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:10%; text-align: center;" scope="col" rowspan="2">
            <asp:Label ID="lblDoc12"  runat="server" Text="Rapporto"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpNote12" name="inpNote12"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td scope="col" colspan="8">
            <input type="text" id="inpR12" name="inpR12"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td style="width:2%" scope="col" rowspan="2">
            <asp:Label ID="lblPos13"  runat="server" Text="">4</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblAtt13"  runat="server" Text="">Controllo documentazione</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblPro13"  runat="server" Text="">CQ 8302</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblMds13"  runat="server" Text="">CQ 8302</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblF13"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblFPct13"  runat="server" Text="">100</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblC13"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblCPct13"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblT13"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblTPct13"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblA13"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblAPct13"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:10%; text-align: center;" scope="col" rowspan="2">
            <asp:Label ID="lblDoc13"  runat="server" Text="Rapporto"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpNote13" name="inpNote13"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td scope="col" colspan="8">
            <input type="text" id="inpR13" name="inpR13"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td style="width:2%" scope="col" rowspan="2">
            <asp:Label ID="lblPos14"  runat="server" Text="">5</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblAtt14"  runat="server" Text="">Controllo imballo</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblPro14"  runat="server" Text="">STD 702</asp:Label>
          </td>
          <td style="width:10%" scope="col" rowspan="2">
            <asp:Label ID="lblMds14"  runat="server" Text="">STD 702</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblF14"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblFPct14"  runat="server" Text="">100</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblC14"  runat="server" Text="">R</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblCPct14"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblT14"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblTPct14"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblA14"  runat="server" Text=" "> </asp:Label>
          </td>
          <td style="width:2%">
            <asp:Label ID="lblAPct14"  runat="server" Text="">0</asp:Label>
          </td>
          <td style="width:10%; text-align: center;" scope="col" rowspan="2">
            <asp:Label ID="lblDoc14"  runat="server" Text="Rapporto"></asp:Label>
          </td>
          <td>
            <input type="text" id="inpNote14" name="inpNote14"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
        <tr>
          <td scope="col" colspan="8">
            <input type="text" id="inpR14" name="inpR14"  runat="server" class="form-control" value=""/>
          </td>
        </tr>
      </table>
      <hr width="100%" size="2" color="blue" noshade/>
      <asp:Button ID="btOrder" runat="server" Text="ORDER" CssClass="btn btn-primary" OnClick="ButtonOrder_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="btOK" runat="server" Text="SAVE" CssClass="btn btn-primary" OnClick="ButtonOK_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="btNext" runat="server" Text="NEXT" CssClass="btn btn-primary" OnClick="ButtonNext_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </form>
  </body>
</html>

