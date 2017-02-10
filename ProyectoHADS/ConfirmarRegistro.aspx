<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ConfirmarRegistro.aspx.vb" Inherits="WebApplication2.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Confirmar Registro</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <p>Tu registro se ha completado con exito, ya puede loguearse sin problemas. Para volver pulse el boton.</p>
           <asp:Button ID="btnVolverInicio" runat="server" CausesValidation="False" Text="Volver a inicio" />
    </div>
    </form>
</body>
</html>
