<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowSingleProject.aspx.cs" Inherits="CertQA.ShowSingleProject" EnableEventValidation="false"%>
<!DOCTYPE html>
<style>
  table, th, td {
    border: 1px solid black;
    text-align: left
  }
</style>
  <html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>Show WBS for project</title>
  </head>
  <body style="height: 444px">
    <form id="form1" runat="server" autocomplete="off">
      <p>Projects</p>
      <p>
        <asp:Label ID="lblProject"     runat="server" Text="Project"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblProjectName" runat="server" Text="This is an test"></asp:Label>
        <br>
      </p>

      <asp:GridView ID="WBSGrid" runat="server" DataKeyNames="WBSName" EnableViewState="True" style="width:100%" 
        OnRowDataBound="OnRowDataBound" OnSelectedIndexChanged="OnSelectedIndexChanged" AutoGenerateColumns="false">
        <Columns>
           <asp:BoundField DataField="WBSName" HeaderText="WBS"         ItemStyle-Width="20%" ItemStyle-Wrap="false" />
           <asp:BoundField DataField="WBSInt"  HeaderText="WBSIntern"   ItemStyle-Width="10%" ItemStyle-Wrap="false" />
           <asp:BoundField DataField="WBSExt"  HeaderText="WBSExtern"   ItemStyle-Width="10%" ItemStyle-Wrap="false" />
           <asp:BoundField DataField="EBELN"   HeaderText="Order"       ItemStyle-Width="10%" ItemStyle-Wrap="false" />
           <asp:BoundField DataField="EBELP"   HeaderText="Line"        ItemStyle-Width="10%" ItemStyle-Wrap="false" />
           <asp:BoundField DataField="MATNR"   HeaderText="Material"    ItemStyle-Width="10%" ItemStyle-Wrap="false" />
           <asp:BoundField DataField="TXZ01"   HeaderText="Description" ItemStyle-Width="20%" ItemStyle-Wrap="false" />
           <asp:BoundField DataField="MENGE"   HeaderText="Quantity"    ItemStyle-Width="5%" ItemStyle-Wrap="false" />
           <asp:BoundField DataField="MEINS"   HeaderText="UoM"         ItemStyle-Width="5%" ItemStyle-Wrap="false" />
        </Columns>
      </asp:GridView>
    </form>
  </body>
</html>

