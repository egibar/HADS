<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InstanciarTarea.aspx.vb" Inherits="WebApplication1.InstanciarTarea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            height: 833px;
        }
        #divTitulo {
              background-color: #F0F8FF;
              font-weight: bold;
        }
        #Button {
            width: 130px;
            font-weight: 700; margin-left: 760px
        }
        .p{
            margin-top:3px;
            margin-bottom:4px;
            margin-left:3px;
        }
    </style>
</head>
<body style="height: 871px">
    <form id="form1" runat="server">
    <div id="divTitulo" style="height: 115px" title="ALUMNOS">
     <p align="center">ALUMNOS</p>
     <p align="center">INSTANCIAR TAREAS GENÉRICA</p>
     <asp:Button ID="Button2" runat="server" BackColor="Black" Font-Bold="True" align="right" Font-Names="Arial Black" Font-Size="10pt" ForeColor="White" Height="29px" Text="Cerrar Sesión" Width="164px" />    
        <br />
        <br />
        <div style="height: 415px; width: 435px; float:left;" id="divleft">
            <p align="left" id="Usuario" style="margin-left: 10px">Usuario</p>
            <p align="left">
                <asp:TextBox ID="TextBox1Usuario" runat="server" Width="262px" style="margin-left: 10px"></asp:TextBox>
            </p>
            <p align="left" id="Tarea" style="margin-left: 11px">Tarea</p>
                <asp:TextBox ID="TextBox1Tarea" runat="server" Width="262px" style="margin-left: 10px"></asp:TextBox>
            <br />
            <p align="left" id="HorasEstimadas" style="margin-left: 10px">Horas Estimadas</p>
                <asp:TextBox ID="TextBox1HEstimadas" runat="server" Width="262px" style="margin-left: 10px"></asp:TextBox>
            <br />
            <p align="left" id="HorasReales" style="margin-left: 10px; margin-bottom: 5px;">Horas Reales</p> 
                <asp:TextBox ID="TextBox1HReales" runat="server" Width="262px" style="margin-left: 10px"></asp:TextBox>
         
            <br/>
            <br/>
            <br/>
            <asp:Button ID="ButtonCrearTarea" runat="server" Height="45px" Text="Crear Tarea" Width="185px" />
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            
                <asp:HyperLink ID="HLink1Alumnos" runat="server" Font-Names="Arial" Font-Size="Medium" NavigateUrl="~/Alumno.aspx">Página Anterior</asp:HyperLink>
            
        </div>
        <div style="height: 415px; width: 640px;float:right; margin-left: 7px;" id="divRight">
            <br />
            <br />
        </div>
    </div>

    </form>
</body>
</html>
