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
        #h1{
            font-size:medium;
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
            height: 861px;
        }
      </style>
</head>
<body style="height: 891px">
    <form id="form1" runat="server">
        
    <div id="divTitulo" align="center" style="height: 174px" title="ALUMNOS">
      <div align="right" style="height: 33px">
                <asp:Button ID="Button2CerrarSesion" runat="server" BackColor="Black" Font-Bold="False" align="right" Font-Names="Arial" Font-Size="10pt" ForeColor="White" Height="31px" Text="Cerrar Sesión" Width="164px" PostBackUrl="~/Inicio.aspx" />
            </div>
     <h1>ALUMNOS</h1>
     <h1>GESTIÓN DE TAREAS GENÉRICAS</h1>       
    </div>
    <div id="divcontenido" style="height: 238px">
        <br/>
        <p align="left" style="margin-top: 0px">Seleccionar Asignatura (sólo se muestran aquellas en las que está matriculado)</p>
        <p >&nbsp;</p>
        <asp:DropDownList ID="DDList1Asig" runat="server" Height="36px" Width="314px">
        </asp:DropDownList>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1VerTareas" runat="server" Text="Visualizar Tareas" />
     </div>
&nbsp;<asp:GridView ID="GridView1Tareas" AllowSorting="True" runat="server" Height="267px" Width="554px">

            <Columns>
                <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Instanciar" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Alumnos/Alumno.aspx">Volver al Menú Alumno</asp:HyperLink>
    </form>
    </body>
</html>
