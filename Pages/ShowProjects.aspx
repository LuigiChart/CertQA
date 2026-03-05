<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowProjects.aspx.cs" Inherits="CertQA.ShowProjects" EnableEventValidation="false"%>
<!DOCTYPE html>
<style>
  table, th, td {
    border: 1px solid black;
    text-align: left
  }
</style>
  <html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>Show Projects for customer</title>
  </head>
  <body style="height: 444px">
    <form id="form1" runat="server" autocomplete="off">
      <p>Projects</p>
      <p>
        <asp:Label ID="lblCustomer" runat="server" Text="Customer"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblCustomerNbr" runat="server" Text="CustomerNbr"></asp:Label>
        <asp:Label ID="lblCustomerName" runat="server" Text="CustomerName"></asp:Label>
        <br>
      </p>

      <asp:GridView ID="OrderGrid" runat="server" DataKeyNames="Order" EnableViewState="True" style="width:100%" 
        OnRowDataBound="OnRowDataBound" OnSelectedIndexChanged="OnSelectedIndexChanged" AutoGenerateColumns="false">
        <Columns>
           <asp:BoundField DataField="Order"   HeaderText="Order"   ItemStyle-Width="50%" ItemStyle-Wrap="false" />
           <asp:BoundField DataField="Project" HeaderText="Project" ItemStyle-Width="50%" ItemStyle-Wrap="false" />
        </Columns>
      </asp:GridView>
    </form>
  </body>
</html>

<%--    <script>
      $('#btnNew_Click').click(function () {
        // console.log('add row table1:')
        console.log(mode)
      });

      //function btnNew_Click(mode) {
      //  console.log(mode)
      //  //makepage1TableRow()
      //OnClick = "btnNew_Click"
      //});
    </script>--%>
