<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Profesor.aspx.vb" Inherits="WebApplication1.Profesor" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Gestión de Tareas Profesor</title>
    <style type="text/css">
        body{
             font-family: Georgia, 'Times New Roman', Times, serif;
        }
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            width: 19%;
            background-color: #f1f1f1;
            position: fixed;
            height: 100%;
            top: 15px;
            left: 10px;
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
          <li><a href='VerEstadisticas.aspx'>Estadisticas</a></li>
          <li><a href=''>Asignaturas</a></li>
          <li><a href='TareasProfesor.aspx'>Tareas</a></li>
          <li><a href=''>Grupos</a></li>
          <li><a href=''>Importar v.XMLDocument</a></li>
          <li><a href='TareasAlumno.aspx'>Exportar</a></li>
          <li><a href=''>Importar v.DataSet</a></li>
      </ul>
    <div style="height: 577px; width: 963px; float:right; margin-left: 7px;" id="divRight">
            <div align="right" style="height: 25px">
             <asp:Button ID="Button2CerrarSesion" runat="server" BackColor="Black" Font-Bold="True" Font-Names="Arial Black" Font-Size="10pt" ForeColor="White" Height="29px" Text="Cerrar Sesión" Width="164px" /> 
            </div> 
            </br>
            <p align="center">Gestión Web de Tareas-Dedicación</p>
            <p align="center">Profesores</p>
     </div>
   
    </form>
</body>
</html>
