<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CertQA._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  <h1>FEMA Certificato di Qualità &amp; FTJP di produzione</h1>
  <style>
    .hidden-text { visibility: hidden; }
    /* Custom background colors */
  </style>

  <div class="jumbotron">
    <p>Per FTJP per favore usare i pulsanti di destra</p>
    <p>mentre per raggiungere direttamente il certificato di qualità usare i pulsanti di sinistra</p>
    <div class="jumbotron">
      <table style="width: 100%">
      <tr>
         <td width="20%" class="hidden-text">
            <asp:Label ID="lblEnvironment" runat="server" Text="Environment"></asp:Label>
          </td>
        <td width="20%" class="hidden-text"  >
          <asp:TextBox ID="tbEnvironment" runat="server"></asp:TextBox>
        </td>
        <td width="60%" class="hidden-text">
          <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </td>
      </tr>
      <tr>
        <td>
          <asp:Label ID="lblOrder" runat="server" Text="Ordine/Cliente :"></asp:Label>
        </td>
        <td>
          <asp:TextBox ID="tbOrder" runat="server"></asp:TextBox>
        </td>
        <td class="hidden-text">
          <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        </td>
      </tr>
    </table>
    </div>
    <br/>
    <table style="width: 100%">
      <tr>
        <td style="width: 15%">
          <asp:Button ID="btCustomerOrdersQ" runat="server" Text="Ordini cliente Q" CssClass="btn btn-primary" OnClick="ButtonCustomerOrdersQ_Click" Width="224px" />
        </td>
        <td style="width: 5%" class="hidden-text">
          <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
        </td>
        <td style="width: 15%">
          <asp:Button ID="btCustomerOrdersP" runat="server" Text="Ordini cliente P" CssClass="btn btn-primary" OnClick="ButtonCustomerOrdersP_Click" Width="224px" />
        </td>
        <td style="width: 5%" class="hidden-text">
          <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
        </td>
        <td style="width: 15%" class="hidden-text">
          <asp:Label ID="Label10" runat="server" Text=""></asp:Label>
        </td>
        <td style="width: 45%" class="hidden-text">
          <asp:Label ID="Label11" runat="server" Text=""></asp:Label>
        </td>
      </tr>
      <tr>
        <td class="hidden-text">
          <asp:Label ID="Label7" runat="server" Height="50px"></asp:Label>
        </td>
      </tr>
      <tr>
        <td>
          <asp:Button ID="btOrderQ" runat="server" Text="Singolo ordine Q" CssClass="btn btn-primary" OnClick="ButtonQualityOrder_Click" Width="224px" />
        </td>
        <td class="hidden-text">
          <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
        </td>
        <td>
          <asp:Button ID="btOrderP" runat="server" Text="Singolo ordine P" CssClass="btn btn-primary" OnClick="ButtonSingleOrder_Click" Width="224px" />
        </td>
        <td class="hidden-text">
          <asp:Label ID="Label9" runat="server" Text=""></asp:Label>
        </td>
        <td>
          <asp:Button ID="btOrderODP" runat="server" Text="Ordine Produzione" CssClass="btn btn-primary" OnClick="ButtonProdOrder_Click" Width="224px" />
        </td>
      </tr>
      <tr>
        <td class="hidden-text">
          <asp:Label ID="Label8" runat="server" Text=""></asp:Label>
        </td>
      </tr>
      <tr>
        <td class="hidden-text">
          <asp:Button ID="btProject" runat="server" Text="Get Project Details" CssClass="btn btn-primary" OnClick="ButtonSingleProject_Click" Visible="False" Width="224px" />
        </td>
        <td class="hidden-text">
          <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
        </td>
        <td class="hidden-text">
          <asp:Button ID="btCustomer" runat="server" Text="Get Customer Projects" CssClass="btn btn-primary" OnClick="ButtonCustomerProjects_Click" Visible="False" Width="224px" />
        </td>
      </tr>
    </table>
    <br/>
    <p>
      <asp:Label ID="lblId" runat="server" Text="Enter Id:" Visible="False"></asp:Label>
      <asp:TextBox ID="tbId" runat="server" Width="176px" Visible="False"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="btDirectData" runat="server" Text="Get Direct Data" CssClass="btn btn-primary" OnClick="ButtonDirectData_Click" Visible="False" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="btnTest" runat="server" Text="TestButton" CssClass="btn btn-primary" OnClick="ButtonTest_Click" Visible="False" />
    </p>
  </div>
  <script>
    function hourglass() {
      document.body.style.cursor = 'wait';
    }
  </script>

</asp:Content>
