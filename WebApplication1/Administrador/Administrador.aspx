<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Administrador.aspx.vb" Inherits="WebApplication1.Administrador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div align="right" style="height: 33px">
                <asp:Button ID="Button2CerrarSesion" runat="server" BackColor="Black" Font-Bold="False" align="right" Font-Names="Arial" Font-Size="10pt" ForeColor="White" Height="31px" Text="Cerrar Sesión" Width="164px" PostBackUrl="~/Inicio.aspx" />
    </div>
    <form id="form1" runat="server">
    <div>
    BIENVENIDO ADMIN!!
    </div>
    </form>
</body>
</html>
