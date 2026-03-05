<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowOrders.aspx.cs" Inherits="CertQA.ShowOrders" EnableEventValidation="false"%>
<!DOCTYPE html>
  <html xmlns="http://www.w3.org/1999/xhtml">
  <body style="height: 444px">
    <form id="form1" runat="server" autocomplete="off">
    <table style="width: 100%">
      <tr>
        <td style="text-align: center;">
          <h1>Visualizza ordini per cliente for customer</h1>
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
    </table>
    <hr width="100%" size="2" color="blue"/>
      <asp:GridView ID="OrderGrid" runat="server" DataKeyNames="Order" EnableViewState="True" style="width:100%" 
        OnRowDataBound="OnRowDataBound" OnSelectedIndexChanged="OnSelectedIndexChanged" AutoGenerateColumns="false">
        <Columns>
           <asp:BoundField DataField="Order"   HeaderText="Nr. Ordine"   ItemStyle-Width="50%" ItemStyle-Wrap="false" />
           <asp:BoundField DataField="Date" HeaderText="Data" ItemStyle-Width="50%" ItemStyle-Wrap="false" />
        </Columns>
      </asp:GridView>
    </form>
  </body>
</html>