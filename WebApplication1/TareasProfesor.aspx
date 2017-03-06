<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TareasProfesor.aspx.vb" Inherits="WebApplication1.TareasProfesor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Gestión de Tarea Alumno</title>
    <style type="text/css">
        body{
             font-family: Georgia, 'Times New Roman', Times, serif;
        }
        #divTitulo {
              background-color: #F0F8FF;
              font-weight: bold;
              font-size: 20px;
        }
        #Button {
            width: 130px;
            font-weight: 700; margin-left: 760px
        }
        #Select1 {
            width: 190px;
        }
        #Select1Asignaturas {
            width: 204px;
        }
        #form1 {
            height: 676px;
        }
      </style>
</head>
<body style="height: 620px">
    <form id="form1" runat="server">
    <div id="divTitulo" style="height: 141px; margin-top: 9px;" title="ALUMNOS">
     <p align="center">
     <asp:Button ID="Button2CerrarSesion" runat="server" BackColor="Black" Font-Bold="True" align="right" Font-Names="Arial Black" Font-Size="10pt" ForeColor="White" Height="29px" Text="Cerrar Sesión" Width="164px" />
        
        </p>
        <p align="center">PROFESOR</p>
        <p align="center">GESTIÓN DE TAREAS GENÉRICAS</p>
        
    </div>
&nbsp;<div style="margin-left: 18px; width: 1075px; height: 349px;">
            <br />
        <p align="left">
            Seleccionar Asignatura:</p>
            <asp:DropDownList ID="DDList2Asig" runat="server" Height="36px" Width="314px">
            </asp:DropDownList>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3InsertarTarea" runat="server" Height="36px" Text="Insertar Nueva Tarea" Width="202px" />
        </div>
        <br />
        <br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
    </form>
    </body>
</html>
