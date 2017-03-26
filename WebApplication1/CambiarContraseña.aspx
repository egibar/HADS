<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CambiarContraseña.aspx.vb" Inherits="WebApplication1.CambiarContraseña" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Cambiar Contraseña</title>
     <style type="text/css">
         body{
             font-family: Georgia, 'Times New Roman', Times, serif;
        }
         #form1 {
             height: 1062px;
         }
     </style>
</head>
<body style="height: 1096px">
    <form id="form1" runat="server">
    <div style="height: 30px">
    
        <asp:Label ID="LabelTitulo" runat="server" Text="CAMBIAR CONTRASEÑA" Font-Bold="True" Font-Names="Arial"></asp:Label>
        <br />

        <br />
    
    </div>
         <div style="height: 43px;" align="right">
        <asp:Button ID="btnVolverInicio" runat="server" CausesValidation="False"  Text="Volver a inicio" />

        </div>
         <br />
         <asp:Label ID="LabelEmail" runat="server" Text="Introduce Email"></asp:Label><br />

            <asp:TextBox ID="TextBoxEmail" runat="server" Height="25px" Width="219px"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredValidatorEmail" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
       &nbsp;<asp:RegularExpressionValidator ID="RegExprValidMail" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Email incorrecto" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <br />
       <br />
        <asp:Button ID="Comprobar" runat="server" Text="Comprobar" />
        <br />
        <br />
        <br />
        <asp:Label ID="LabelPregunta" runat="server" Text="Pregunta Secreta :"></asp:Label><br />
                <asp:TextBox ID="TextBoxPregunta" runat="server" BorderStyle="None" Height="23px" Visible="False" Width="469px"></asp:TextBox>
        <br />
        <br/>

        <asp:Label ID="LabelRespuesta" runat="server" Text="Respuesta Secreta"></asp:Label><br />
            <asp:TextBox ID="TextBoxRespuesta" runat="server" Height="25px" Width="220px"></asp:TextBox>
       
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBoxRespuesta"></asp:RequiredFieldValidator>
&nbsp;<br />
        <br />
        <asp:Label ID="LabelRespCorrecta" runat="server" Visible="False" ForeColor="Red"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <asp:Button ID="btnComprobar2" runat="server" Text="Comprobar Respuesta" Height="21px" Width="144px" Visible="False" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <br />
        <asp:Label ID="NuevoPass" runat="server" Text="Introduce la nueva contraseña"></asp:Label>
        <br />
       
                <asp:TextBox ID="TextBoxPassword" TextMode="Password" runat="server" Height="25px" Width="220px"></asp:TextBox>
                                        &nbsp;<asp:RequiredFieldValidator ID="RequiredValidatorPassword" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                &nbsp;<asp:RegularExpressionValidator ID="RegExprValidPassword" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="No es una contraseña válida" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,15}$" ForeColor="Red"></asp:RegularExpressionValidator>
        
        
            <br />
        <br />
        <asp:Label ID="NuevoPass2" runat="server" Text="Vuelve a introducir la contraseña"></asp:Label>
        <br />

        <asp:TextBox ID="TextBoxPassword2" TextMode="Password" runat="server" Height="25px" Width="219px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredValidatorPassword2" runat="server" ControlToValidate="TextBoxPassword2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

        &nbsp;

        <asp:RegularExpressionValidator ID="RegExprValidPassword2" runat="server" ControlToValidate="TextBoxPassword2" ErrorMessage="No es una contraseña válida" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,15}$" ForeColor="Red"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:CompareValidator ID="CompareValidatorPassword" runat="server" ErrorMessage="Las contraseñas no coinciden" ControlToCompare="TextBoxPassword" ControlToValidate="TextBoxPassword2" ForeColor="Red"></asp:CompareValidator>
        <br />
        <br />
        <asp:Button ID="btnCambiarContraseña" runat="server" Text="Cambiar Contraseña" Visible="False" Width="139px" />

        <br />
        <br />
        <br />
        <br />
        <asp:Label ID="LabelCambio" runat="server" Visible="False" ForeColor="Green"></asp:Label>

        <br />
        <br />
        <br />
        <asp:HyperLink ID="HyperLinkPagAnterior" runat="server" NavigateUrl="~/Inicio.aspx">Volver a la página anterior</asp:HyperLink>

    </form>
</body>
</html>