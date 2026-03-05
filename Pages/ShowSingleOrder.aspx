<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowSingleOrder.aspx.cs" Inherits="CertQA.ShowSingleOrder" EnableEventValidation="false" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <body style="height: 767px">
  <form id="form1" runat="server" autocomplete="off">
    <table style="width: 100%">
      <tr>
        <td style="text-align: center;">
          <h1>Visualizza ordine singolo</h1>
          <asp:Label ID="lblMode" runat="server" Text="">MODE</asp:Label>
        </td>
      </tr>
    </table>
    <br/>
    <table style="width:100%">
      <tr>
        <td style="width:20%">
          <asp:Label ID="lblCustomer" runat="server" Text="Cliente: "></asp:Label>
        </td>
        <td style="width:20%">
          <asp:Label ID="lblCustomerNbr" runat="server" Text="">1234567</asp:Label>
        </td>
        <td style="width:60%">
          <asp:Label ID="lblCustomerName" runat="server" Text="">test customer</asp:Label>
        </td>
      </tr>
      <tr>
        <td>
          <asp:Label ID="lblOrder" runat="server" Text="Commessa: "></asp:Label>
        </td>
        <td>
          <asp:Label ID="lblOrderNbr" runat="server" Text="">1234567</asp:Label>
        </td>
      </tr>
<%--      <tr>
          <td class="hidden-text">
          <asp:Label ID="lblProject" runat="server" Text="Project: "></asp:Label>&nbsp;
        </td>
          <td class="hidden-text">
          <asp:Label ID="lblProjectNbr" runat="server" Text="">1234567</asp:Label>
        </td>
      </tr>--%>
    </table>
    <hr width="100%" size="2" color="blue"/>

    <asp:GridView ID="OrderGrid" runat="server" DataKeyNames="VBELN" EnableViewState="True" Style="width: 100%"
      OnRowDataBound="OnRowDataBound" OnSelectedIndexChanged="OnSelectedIndexChanged" AutoGenerateColumns="false">
      <Columns>
        <asp:BoundField DataField="VBELN" HeaderText="Nr. Ordine" ItemStyle-Width="10%" ItemStyle-Wrap="false" />
        <asp:BoundField DataField="POSNR" HeaderText="Pos." ItemStyle-Width="5%" ItemStyle-Wrap="false" />
        <asp:BoundField DataField="MATNR" HeaderText="Materiale" ItemStyle-Width="10%" ItemStyle-Wrap="false" />
        <asp:BoundField DataField="ARKTX" HeaderText="Descrizione" ItemStyle-Width="20%" ItemStyle-Wrap="false" />
        <asp:BoundField DataField="MENGE" HeaderText="Quantità" ItemStyle-Width="5%" ItemStyle-Wrap="false" />
        <asp:BoundField DataField="MEINS" HeaderText="UM" ItemStyle-Width="5%" ItemStyle-Wrap="false" />
        <asp:BoundField DataField="PSTYV" HeaderText="MTyp" ItemStyle-Width="5%" ItemStyle-Wrap="false" />
        <asp:BoundField DataField="KDMAT" HeaderText="Mat. Alternativo" ItemStyle-Width="5%" ItemStyle-Wrap="false" Visible="false" />
        <asp:BoundField DataField="CLASSE" HeaderText="Classe" ItemStyle-Width="5%" ItemStyle-Wrap="false"  />
        <asp:BoundField DataField="CHARG" HeaderText="Partita" ItemStyle-Width="5%" ItemStyle-Wrap="false" />
      </Columns>
    </asp:GridView>
  </form>
</body>
</html>

