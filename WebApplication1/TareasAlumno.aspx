<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TareasAlumno.aspx.vb" Inherits="WebApplication1.TareasAlumno" %>

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
            height: 796px;
        }
      </style>
</head>
<body style="height: 749px">
    <form id="form1" runat="server">
    <div id="divTitulo" style="height: 125px" title="ALUMNOS">
     <p align="center">ALUMNOS</p>
     <p align="center">GESTIÓN DE TAREAS GENÉRICAS</p>
     <asp:Button ID="ButtonCerrarSesion" runat="server" BackColor="Black" Font-Bold="True" align="right" Font-Names="Arial Black" Font-Size="10pt" ForeColor="White" Height="29px" Text="Cerrar Sesión" Width="164px" />
        
    </div>
    <div id="divcontenido" style="height: 238px">
        <p align="left">Seleccionar Asignatura (sólo se muestran aquellas en las que está matriculado)</p>
        <p >&nbsp;</p>
        <asp:DropDownList ID="DDList1Asig" runat="server" Height="36px" Width="314px">
        </asp:DropDownList>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1VerTareas" runat="server" Text="Visualizar Tareas" />
     </div>
&nbsp;<asp:GridView ID="GridView1Tareas" runat="server" Height="322px" style="margin-left: 445px; margin-top: 3px" Width="670px">
            <Columns>
                <asp:ButtonField Text="Instanciar" />
            </Columns>
        </asp:GridView>
    </form>
    </body>
</html>
