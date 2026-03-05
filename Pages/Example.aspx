<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Example.aspx.cs" Inherits="CertQA.Example" EnableEventValidation="false"%>

<!DOCTYPE html>
 <html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <!-- Inside the <head> or before </body> -->
    <meta charset="utf-8">
    <title></title>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- jQuery DateTimePicker CSS & JS -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
    <style>
      .datepicker-toggle {
        display: inline-block;
        position: relative;
        width: 123px;
        height: 20px;
        top: 0px;
        left: 0px;
      }
      .datepicker-toggle-button {
        position: absolute;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
      }
      .datepicker-input {
        position: absolute;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        opacity: 0;
        cursor: pointer;
        box-sizing: border-box;
      }
      .datepicker-input::-webkit-calendar-picker-indicator {
        position: absolute;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        margin: 0;
        padding: 0;
        cursor: pointer;
      }
    </style>
  </head>
  <body>
  <form id="form1" runat="server">
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
          <asp:Label ID="lblMontatore"  runat="server" Text="">Montatore/Collaudatore: </asp:Label>
        </td>
        <td>
          <input type="text" id="inpMontatore" name="inpMontatore"  runat="server" class="form-control" value="" onclick="this.select()" />
        </td>
        <td>
          <asp:Label ID="lblDateCollaudo"  runat="server" Text="">Data Collaudo: </asp:Label>
        </td>
        <td>
          <span class="datepicker-toggle">
            <span class="datepicker-toggle-button">
              <input type="text"  id="dspDateCollaudo" name="dspDateCollaudo"  runat="server" readonly="true"/>
              <input type="date" id="inpDateCollaudo" name="inpDateCollaudo"  runat="server" class="datepicker-input"/>
            </span>
          </span> 
<%--            <input type="date" id="inpDateCollaudo" name="inpDateCollaudo" runat="server" class="form-control" value="" />--%>
        </td>
      </tr>
    </table>
    <hr width="100%" size="2" color="blue"/>
            <asp:Calendar ID="Calendar1" runat="server"  SelectionMode="DayWeekMonth" onselectionchanged="Calendar1_SelectionChanged"></asp:Calendar>
    <hr width="100%" size="2" color="blue"/>
    <asp:Label ID="lblTextBoxDateTime" runat="server" Text="TextBoxDateTime: "></asp:Label>
    <asp:TextBox ID="TextBoxDateTime" runat="server" type="datetime-local"></asp:TextBox>
    <hr width="100%" size="2" color="blue"/>
    <asp:Label ID="lbltxtDateTime" runat="server" Text="txtDateTime: "></asp:Label>
    <asp:TextBox ID="txtDateTime" runat="server"></asp:TextBox>
    <hr width="100%" size="2" color="blue"/>
    <label for="dateSelector">Select Date & Time:</label>
    <input type="text" id="dateSelector"  runat="server" placeholder="Click to pick date"/>
    <hr width="100%" size="2" color="blue"/>
    <asp:Label ID="lblDate1" runat="server" Text="Enter date:"></asp:Label>
    <span class="datepicker-toggle">
      <span class="datepicker-toggle-button">
        <input type="text"  id="dspDate1" name="dspDate1"  runat="server" readonly="true"/>
        <input type="date" id="inpDate1" name="inpDate1"  runat="server" class="datepicker-input"/>
      </span>
    </span> 
    <br/>
    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
    <br/>
    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
    <br/>
    <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
    <br/>
    <asp:Label ID="lblDate2" runat="server" Text="Enter date:"></asp:Label>
    <span class="datepicker-toggle">
      <span class="datepicker-toggle-button">
        <input type="text"  id="dspDate2" name="dspDate2"  runat="server" readonly="true"/>
        <input type="date" id="inpDate2" name="inpDate2"  runat="server" class="datepicker-input"/>
      </span>
    </span> 
    <hr width="100%" size="2" color="blue" />
    <asp:Button ID="btOK" runat="server" Text="SAVE" CssClass="btn btn-primary" OnClick="ButtonOK_Click" />
  </form>
    <script>
      $(document).ready(function () {
        // Initialize DateTimePicker (https://xdsoft.net/jqplugins/datetimepicker/)
        $('#dateSelector').datetimepicker({
          timepicker: false,
          format: 'd.m.Y',   // Date format: YYYY-MM-DD HH:mm
          minDate: '1970/01/01', 
        //  onShow: function (ct) { // Optional: custom logic before showing
        //    console.log("DateTimePicker opened");
        //  }
        });
      });
      $(function () {
        $("[id*=txtDateTime]").datetimepicker();
      });
      inpDateCollaudo.addEventListener('change', event => {
        dspDateCollaudo.value = event.target.value.substring(8) + "/" + event.target.value.substring(5, 7) + "/" + event.target.value.substring(0, 4);
        //  event.target.value = '';
      });
      inpDate1.addEventListener('change', event => {
        dspDate1.value = event.target.value.substring(8) + "/" + event.target.value.substring(5, 7) + "/" + event.target.value.substring(0,4);
      //  event.target.value = '';
      });
      inpDate2.addEventListener('change', event => {
        dspDate2.value = event.target.value.substring(8) + "/" + event.target.value.substring(5, 7) + "/" + event.target.value.substring(0, 4);
        event.target.value = '';
      });
    </script>
  </body>
</html>
