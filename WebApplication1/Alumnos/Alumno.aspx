<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Alumno.aspx.vb" Inherits="WebApplication1.Alumno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Gestión de Tareas Alumno</title>
    <style type="text/css">
        body{
             font-family: Georgia, 'Times New Roman', Times, serif;
        }
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            width: 20%;
            background-color: #f1f1f1;
            position: fixed;
            height: 100%;
        }
        li a {
            align-content:center;
            display: inline-block;
            color: #000;
            padding: 8px 16px;
            height: 18px;
            margin-top: 5px;
        }
        div p{
            text-align:center;
            font-weight: bold;
            font-family:serif;
            font-size: 25px;
            margin-top: 45px;
            margin-bottom: 35px;
        }
        #form1 {
            height: 650px;
        }
    </style>
</head>
<body style="height: 720px">
    <form id="form1" runat="server">

      <ul>
          <li><a href='TareasAlumno.aspx' id="tareasGenericas">Tareas Genéricas</a></li>
          <!--<li><a href=''>Tareas Propias</a></li>
          <li><a href=''>Grupos</a></li>-->
      </ul>
    <div align="center" style="height: 577px; width: 904px; float:right; margin-left: 7px;" id="divRight">
        <div align="right" style="height: 33px">
                <asp:Button ID="Button2CerrarSesion" runat="server" BackColor="Black" Font-Bold="False" align="right" Font-Names="Arial" Font-Size="10pt" ForeColor="White" Height="31px" Text="Cerrar Sesión" Width="164px" PostBackUrl="~/Inicio.aspx" />
        </div>
        </br>
        <h1>Gestión Web de Tareas-Dedicación</h1>
        <h1>Alumnos</h1>
     </div>
   
    </form>
</body>
</html>
