<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Coordinador.aspx.vb" Inherits="WebApplication1.Coordinador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 424px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
            <table border="1" style="width: 591px; height: 372px">
  <tr>
    <td colspan="2"><h1>Coordinador</h1></td>
  </tr>
  <tr>
    <td>Asignatura:</td>
    <td class="auto-style1">
        <asp:DropDownList ID="AlumnAsignaturas" runat="server" DataSourceID="SqlDataSource1" DataTextField="codigo" DataValueField="codigo">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS19TAREASConnectionString %>" SelectCommand="SELECT DISTINCT [codigo] FROM [Asignaturas]"></asp:SqlDataSource>
      </td>
  </tr>
  <tr>
    <td>Media:</td>
    <td class="auto-style1">
        <asp:Label ID="LblResultMedia" runat="server"></asp:Label>
      </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="auto-style1">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="auto-style1">
        <asp:Button ID="Button1" runat="server" Text="Button" align="right" />
      </td>
  </tr>
</table>
    </div>
    </form>
</body>
</html>
