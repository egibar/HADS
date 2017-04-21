<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Coordinador.aspx.vb" Inherits="WebApplication1.Coordinador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 424px;
            height: 73px;
        }
        .auto-style2 {
            height: 14px;
        }
        .auto-style3 {
            width: 424px;
            height: 14px;
        }
        #form1 {
            height: 515px;
        }
        .auto-style4 {
            height: 105px;
        }
        .auto-style5 {
            width: 424px;
            height: 105px;
        }
        .auto-style6 {
            height: 86px;
        }
        .auto-style7 {
            height: 50px;
        }
        .auto-style8 {
            width: 424px;
            height: 50px;
        }
        .auto-style9 {
            height: 73px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div align="right" style="height: 33px">
                <asp:Button ID="Button2CerrarSesion" runat="server" BackColor="Black" Font-Bold="True" align="right" Font-Names="Arial Black" Font-Size="10pt" ForeColor="White" Height="31px" Text="Cerrar Sesión" Width="164px" />
       </div>
       <table border="0" style="width: 591px; height: 347px">
  <tr>
    <td colspan="2" class="auto-style6"><h1>Coordinador:&nbsp;&nbsp;
        <asp:Label ID="Label1Coordinador" runat="server" Font-Names="Arial Rounded MT Bold" Font-Size="Medium" ForeColor="#3366FF"></asp:Label>
        </h1>
      </td>
  </tr>
  <tr>
    <td class="auto-style4">
        <asp:Label ID="Label1Asig" runat="server" Font-Names="Arial" Text="Asignatura : "></asp:Label>
      </td>
    <td class="auto-style5">
        <asp:DropDownList ID="AlumnAsignaturas" runat="server" DataSourceID="SqlDataSource1" DataTextField="codigo" DataValueField="codigo" Width="149px" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS19TAREASConnectionString %>" SelectCommand="SELECT DISTINCT [codigo] FROM [Asignaturas]"></asp:SqlDataSource>
      </td>
  </tr>
  <tr>
    <td class="auto-style7">
        <asp:Label ID="Label1Media" runat="server" Font-Names="Arial" Text="Media : "></asp:Label>
      </td>
    <td class="auto-style8">
        <asp:Label ID="LblResultMedia" runat="server"></asp:Label>
      </td>
  </tr>
  <tr>
    <td class="auto-style2"></td>
    <td class="auto-style3"></td>
  </tr>
  <tr>
    <td class="auto-style9"></td>
    <td class="auto-style1">
        <asp:Button ID="ButtonCalcular" runat="server" Text="Calcular" align="right" style="margin-left: 23px" Width="122px" Height="34px" />
      </td>
  </tr>
</table>
         <br />
         <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Profesor/Profesor.aspx" Font-Bold="True" >Volver a Menú Profesor</asp:HyperLink>
    </div>
    </form>
</body>
</html>
