<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InstanciarTarea.aspx.vb" Inherits="WebApplication1.InstanciarTarea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        body{
             font-family: Georgia, 'Times New Roman', Times, serif;
        }
        #form1 {
            height: 833px;
            width: 1239px;
        }
        #divTitulo {
              background-color: #F0F8FF;
              font-weight: bold;
        }
        #Button {
            width: 130px;
            font-weight: 700; margin-left: 760px
        }
        #h1{
            font-size:medium;
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
    <div id="divTitulo" align="center" style="height: 178px; width: 1232px;" title="ALUMNOS">
        <div align="right" style="height: 33px">
                <asp:Button ID="Button2CerrarSesion" runat="server" BackColor="Black" Font-Bold="False" align="right" Font-Names="Arial" Font-Size="10pt" ForeColor="White" Height="31px" Text="Cerrar Sesión" Width="164px" PostBackUrl="~/Inicio.aspx" />
        </div>
     <h1>ALUMNOS</h1>
     <h1>INSTANCIAR TAREAS GENÉRICA</h1>
     <div>
        <br />
        <div align="left" style="height: 575px; width: 471px; float:left;" id="divleft">
            Usuario:&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label1Usuario" runat="server"></asp:Label>
          
            <br />
            <br />
            Tarea:&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label2Tarea" runat="server"></asp:Label>
            <br />
            <br />
            Horas Estimadas&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3HEstimadas" runat="server"></asp:Label>
            <br />
            <br />
            Horas Reales 
                <asp:TextBox ID="TextBox1HReales" runat="server" Width="200px" style="margin-left: 10px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1HReales" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            <br/>
            <br/>
            <br/>
            <asp:Button ID="ButtonCrearTarea" runat="server" Height="45px" Align="right" Text="Crear Tarea" Width="168px" />
            <br/>
            <br/>
            <br/>
            <br/>
            <asp:Label ID="LabelTareaCreada" runat="server" Font-Bold="True" Font-Size="Medium" Visible="False"></asp:Label>

            <br/>
            <br/>
            <br/>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Alumnos/Alumno.aspx">Volver al Menú Alumno</asp:HyperLink>
            
        </div>
        <div style="height: 573px; width: 741px; float:right; margin-left: 16px;" id="divRight">
            <br />
            <br />
            <asp:GridView ID="GridViewTareasAsignatura" runat="server" Height="235px" Width="483px" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
