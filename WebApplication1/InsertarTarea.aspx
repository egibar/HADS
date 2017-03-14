<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InsertarTarea.aspx.vb" Inherits="WebApplication1.InsertarTarea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Gestión de Tarea Alumno</title>
    <style type="text/css">
        body{
            font-family: Georgia, 'Times New Roman', Times, serif;
            height: 880px;
            margin-bottom: 53px;
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
        #form1 {
            height: 905px;
        }
      </style>
</head>

<body>
    <form id="form1" runat="server">
     <div id="divTitulo" style="height: 128px; margin-top: 9px; margin-left: 7px;" title="ALUMNOS">
        <div align="right" style="height: 25px">
             <asp:Button ID="Button2CerrarSesion" runat="server" BackColor="Black" Font-Bold="True" Font-Names="Arial Black" Font-Size="10pt" ForeColor="White" Height="29px" Text="Cerrar Sesión" Width="164px" /> 
        </div>
        <p align="center" style="margin-bottom: 14px">PROFESOR</p>
        <p align="center">GESTIÓN DE TAREAS GENÉRICAS</p>
         <br/>
         <br/>
         <p align:"right" style="width: 170px">Código</p>
         <asp:TextBox ID="TextBox1Codigo" runat="server"></asp:TextBox>
         <br/>
         <p align:"right" style="width: 170px">Descripción</p>
             
         <p>
             <asp:TextBox ID="TextBox1Descripcion" runat="server" Height="107px" Width="298px"></asp:TextBox>
         </p>
         <p align:"right" style="width: 150px">Asignatura</p>
         <asp:DropDownList ID="DDList1Asignatura" runat="server" Width="185px" DataSourceID="SqlDataSource1" DataTextField="codigogrupo" DataValueField="codigogrupo">
         </asp:DropDownList>
         <p align:"right" style="width: 180px">Horas Estimadas</p>
         <asp:TextBox ID="TextBox3TipoTarea" runat="server" Width="169px"></asp:TextBox>
         <p align:"right" style="width: 178px">Tipo de Tareas</p>
         <asp:DropDownList ID="DDList1TipoTareas" runat="server" Width="185px">
            <asp:ListItem>Examen</asp:ListItem>
            <asp:ListItem>Trabajo</asp:ListItem>
            <asp:ListItem>Ejercicio</asp:ListItem>
            <asp:ListItem>Laboratorio</asp:ListItem>
         </asp:DropDownList>
         <br/>
         <br/>
         <br/>
         <br/>
         <asp:Button ID="Button1AñadirTarea" runat="server" Text="Añadir Tarea" Width="146px" />
         <br/>
         <br/>
         <asp:Label ID="LabelTareaCreada" runat="server" Font-Bold="True" Font-Size="Medium" Visible="False"></asp:Label>
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS19TAREASConnectionString %>" SelectCommand="SELECT [codigogrupo] FROM [ProfesoresGrupo] WHERE ([email] = @email)">
            <SelectParameters>
                <asp:SessionParameter Name="email" SessionField="email" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
