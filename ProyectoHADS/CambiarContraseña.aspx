<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CambiarContraseña.aspx.vb" Inherits="WebApplication2.CambiarContraseña" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cambiar Contraseña</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="LabelTitulo" runat="server" Text="CAMBIAR CONTRASEÑA"></asp:Label>
    
    </div>
         <asp:Label ID="LabelEmail" runat="server" Text="Introduce Email"></asp:Label><br />

            <asp:TextBox ID="Email" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredValidatorEmail" runat="server" ControlToValidate="Email" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
       <asp:RegularExpressionValidator ID="RegExprValidMail" runat="server" ControlToValidate="Email" ErrorMessage="Email incorrecto" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
       <br />
        <asp:Button ID="Comprobar" runat="server" Text="Comprobar" /><br />
        <asp:Label ID="LabelPregunta" runat="server" Text="Pregunta Secreta :"></asp:Label><br />
                <asp:TextBox ID="Pregunta" runat="server" BorderStyle="None" Height="23px" Visible="False" Width="469px"></asp:TextBox><br/>

        <asp:Label ID="LabelRespuesta" runat="server" Text="Respuesta Secreta"></asp:Label><br />
            <asp:TextBox ID="Respuesta" runat="server"></asp:TextBox>
       
            <p>Introduce la nueva contraseña</p>

                <asp:TextBox ID="Password" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredValidatorPassword" runat="server" ControlToValidate="Password" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator ID="RegExprValidPassword" runat="server" ControlToValidate="Password" ErrorMessage="No es una contraseña válida" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,15}$" ForeColor="Red"></asp:RegularExpressionValidator>
        
        
            <p>Vuelve a introducir la contraseña</p>

        <asp:TextBox ID="Password2" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredValidatorPassword2" runat="server" ControlToValidate="Password2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

        <asp:RegularExpressionValidator ID="RegExprValidPassword2" runat="server" ControlToValidate="Password2" ErrorMessage="No es una contraseña válida" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,15}$" ForeColor="Red"></asp:RegularExpressionValidator>
        <br />
        <asp:CompareValidator ID="CompareValidatorPassword" runat="server" ErrorMessage="Las contraseñas no coinciden" ControlToCompare="Password" ControlToValidate="Password2" ForeColor="Red"></asp:CompareValidator>
        <br />
        <asp:Button ID="btnComprobar" runat="server" Text="Comprobar" />
        <asp:Button ID="btnVolverInicio" runat="server" CausesValidation="False" Text="Volver a inicio" />


    </form>
</body>
</html>
