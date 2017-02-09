<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Registro.aspx.vb" Inherits="WebApplication2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registro</title>
    <style type="text/css">
        #form1 {
            height: 923px;
            margin-left: 0px;
        }
    </style>
</head>
<body >
    <form id="form1" runat="server">
    <div class="titulo">
    
        <asp:Label ID="Titulo" runat="server" Text="REGISTRO" Font-Bold="True" Font-Size="XX-Large" Font-Strikeout="False" Height="187px" style="margin-left: 0px" Width="1039px"></asp:Label>
    </div>
   <div class="labels">
       <asp:Label ID="LabelNombre" runat="server" Text="Nombre"></asp:Label><br />
       <asp:TextBox ID="Nombre" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredValidatorNombre" runat="server" ControlToValidate="Nombre" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegExprValidNombre" runat="server" ControlToValidate="Nombre" ErrorMessage="No es un nombre válido" ValidationExpression="^([A-ZÁÉÍÓÚ]{1}[a-zñáéíóú]+[\s]*)+$" ForeColor="Red"></asp:RegularExpressionValidator>

       <br />
       <asp:Label ID="LabelApellido" runat="server" Text="Apellido"></asp:Label><br />
       <asp:TextBox ID="Apellido" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredValidatorApellido" runat="server" ControlToValidate="Apellido" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
       <asp:RegularExpressionValidator ID="RegExprValidApellido" runat="server" ControlToValidate="Apellido" ErrorMessage="No es un apellido válido" ValidationExpression="^([A-ZÁÉÍÓÚ]{1}[a-zñáéíóú]+[\s]*)+$" ForeColor="Red"></asp:RegularExpressionValidator>

       <br />
       <asp:Label ID="LabelEmail" runat="server" Text="Email"></asp:Label><br />
       <asp:TextBox ID="Email" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredValidatorEmail" runat="server" ControlToValidate="Email" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
       <asp:RegularExpressionValidator ID="RegExprValidMail" runat="server" ControlToValidate="Email" ErrorMessage="Email incorrecto" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
       <br />
       <asp:Label ID="LabelPassword" runat="server" Text="Password"></asp:Label><br />
       <asp:TextBox ID="Password" TextMode="Password" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredValidatorPassword" runat="server" ControlToValidate="Password" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="RegExprValidPassword" runat="server" ControlToValidate="Password" ErrorMessage="No es una contraseña válida" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,15}$" ForeColor="Red"></asp:RegularExpressionValidator>

       <br />
       <asp:Label ID="LabelPassword2" runat="server" Text="Repita la password"></asp:Label><br />
       <asp:TextBox ID="Password2" TextMode="Password" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredValidatorPassword2" runat="server" ControlToValidate="Password2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="RegExprValidPassword2" runat="server" ControlToValidate="Password2" ErrorMessage="No es una contraseña válida" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,15}$" ForeColor="Red"></asp:RegularExpressionValidator>
              <asp:CompareValidator ID="CompareValidatorPassword" runat="server" ErrorMessage="Las contraseñas no coinciden" ControlToCompare="Password" ControlToValidate="Password2" ForeColor="Red"></asp:CompareValidator>
       <br />
       <asp:Label ID="LabelDNI" runat="server" Text="DNI"></asp:Label><br />
       <asp:TextBox ID="DNI" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredValidatorDNI" runat="server" ControlToValidate="DNI" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
       <asp:RegularExpressionValidator ID="RegExprValidDNI" runat="server" ControlToValidate="DNI" ErrorMessage="No es un DNI válido" ValidationExpression="^[0-9]{8}[TRWAGMYFPDXBNJZSQVHLCKET]{1}$" ForeColor="Red"></asp:RegularExpressionValidator>

       <br />
       <asp:Label ID="LabelPregunta" runat="server" Text="Pregunta Secreta"></asp:Label><br />
       <asp:TextBox ID="Pregunta" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredValidatorPregunta" runat="server" ControlToValidate="Pregunta" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
       <br />
       <asp:Label ID="LabelRespuesta" runat="server" Text="Respuesta Secreta"></asp:Label><br />
       <asp:TextBox ID="Respuesta" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredValidatorRespuesta" runat="server" ControlToValidate="Respuesta" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

       <br />

       <asp:Button ID="btnRegistrarse" runat="server" Text="Registrarse" class="form-btn"/>
       <asp:Button ID="btnVolverInicio" runat="server" CausesValidation="False" Text="Volver a inicio" />


       </div>
    </form>
</body>
</html>
