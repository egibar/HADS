<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Inicio.aspx.vb" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>INICIO</title>
    <!--<link rel="stylesheet"
          href="diseno.css"/>-->
      <style type="text/css">
          .labels {
              height: 321px;
          }
          #form1 {
              height: 635px;
          }
      </style>
</head>
<body style="height: 699px">
    <form id="form1" runat="server">
  <div class="titulo">
     <asp:Label ID="Titulo" runat="server" Text="LOGIN"></asp:Label>
    </div>
    <div class="labels">

        <asp:Label ID="LabelEmail" runat="server" Text="Email"></asp:Label><br />
        <asp:TextBox ID="Email" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredValidatorEmail" runat="server" ControlToValidate="Email" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegExprValidEmail" runat="server" ControlToValidate="Email" ErrorMessage="Email incorrecto" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <br />
        <br />
        <br />
        <asp:Label ID="LabelPassword" runat="server" Text="Password"></asp:Label><br />
        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredValidatorPassword" runat="server" ControlToValidate="Password" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegExprValid2" runat="server" ErrorMessage="Password incorrecto" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,15}$" ControlToValidate="Password" ForeColor="Red"></asp:RegularExpressionValidator>

        <br />

        <br />

        <asp:Button ID="ButtonLogin" runat="server" Text="Login" class="form-btn"/>
        <br />
        <br />

        <asp:HyperLink ID="HyperLinkRegistrarse" runat="server" NavigateUrl="~/Registro.aspx">Registrarse</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLinkCambiarPassword" runat="server" NavigateUrl="~/CambiarContraseña.aspx">CambiarPassword</asp:HyperLink>
        <br />
    </div>
        <div id="divInformativo" style="height: 284px">
            <asp:Label ID="Label1Informativo" runat="server" Visible="False"></asp:Label>
        </div>
    </form>
</body>
</html>
