﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Inicio.aspx.vb" Inherits="WebApplication1.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>INICIO</title>
    <!--<link rel="stylesheet"
          href="diseno.css"/>-->
      <style type="text/css">
        body{
             font-family: Georgia, 'Times New Roman', Times, serif;
        }
        .labels {
              height: 446px;
        }
        #form1 {
              height: 737px;
        }
        .auto-style4 {
            height: 50px;
            width: 671px;
        }
        .auto-style5 {
              width: 164px;
              height: 30px;
          }
          .auto-style6 {
              height: 51px;
              width: 164px;
          }
          .auto-style7 {
              height: 57px;
              width: 164px;
          }
          .auto-style8 {
              height: 57px;
              width: 671px;
          }
          .auto-style9 {
              height: 97px;
          }
          .auto-style10 {
              width: 164px;
              height: 30px;
          }
        </style>
</head>
<body style="height: 711px">
    <form id="form1" runat="server">
  <div class="titulo" align="center" id="titulo" style="background-color: #CCCCCC">
     <asp:Label ID="Titulo" runat="server" Text="LOGIN" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
      <br />
      <br />
    </div>
    <div class="labels" >
      <br />
      <table align="center" style="border: medium solid #0066FF; width: 522px; height: 379px" border="0">
        <tr>
             <td class="auto-style7" align="center">
                 Correo Usuario: <br />
             </td>
             <td class="auto-style8">
                <asp:TextBox ID="Email" runat="server" style="margin-left: 0px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredValidatorEmail" runat="server" ControlToValidate="Email" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegExprValidEmail" runat="server" ControlToValidate="Email" ErrorMessage="Email incorrecto" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
             </td>
         </tr>
         <tr>
            <td class="auto-style6" align="center">
                 <asp:Label ID="LabelPassword" runat="server" Text="Password"></asp:Label>:<br />
            </td>
            <td class="auto-style4">
                 <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredValidatorPassword" runat="server" ControlToValidate="Password" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
               <!--<asp:RegularExpressionValidator ID="RegExprValid2" runat="server" ErrorMessage="Password incorrecto" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,15}$" ControlToValidate="Password" ForeColor="Red"></asp:RegularExpressionValidator>-->
            </td>
         </tr>
         <tr>
             <td style="margin-top: 40px" colspan="2" align="right" class="auto-style9">
                  <asp:Button ID="ButtonLogin" runat="server" Text="Login" class="form-btn" style="margin-left: 0px" Width="106px"/>
             </td>
         </tr>
          <tr>
            <td class="auto-style10">
               <asp:HyperLink ID="HyperLinkRegistrarse" runat="server" NavigateUrl="~/Registro.aspx">Registrarse</asp:HyperLink>
            </td>
         </tr>
          <tr>
           <td class="auto-style5">
               <asp:HyperLink ID="HyperLinkCambiarPassword" runat="server" NavigateUrl="~/CambiarContraseña.aspx">CambiarPassword</asp:HyperLink>
           </td>           
          </tr>
        </table>
        <br />
    </div>
        <div id="divInformativo" style="height: 284px">
            <asp:Label ID="Label1Informativo" runat="server" Visible="False"></asp:Label>
        </div>
    </form>
</body>
</html>
