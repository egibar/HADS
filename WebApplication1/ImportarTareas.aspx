﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ImportarTareas.aspx.vb" Inherits="WebApplication1.ImportarTareas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div style="margin-left: 40px; margin-right: 40px">
        <asp:Panel ID="Panel1" runat="server" BackColor="Silver">
            <h1>PROFESOR</h1>
            <h1>IMPORTAR TAREAS GENERICAS</h1>
        </asp:Panel>
    </div>
        Escoje la asignatura<br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" Height="36px" Width="314px" DataTextField="codigogrupo" DataValueField="codigogrupo">
        </asp:DropDownList>
        <br /><br /><br />
                   <br />
         <asp:Button ID="Button1" runat="server" Text="Importar Tareas" Height="52px" Width="231px" />
                   </div>
                   <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/MenuProfesor.aspx" >Volver Atras</asp:HyperLink>
        <div style="margin-right: 40px;text-align:center">
                  
                    <asp:Xml ID="Xml1" runat="server" TransformSource="~/App_Data/XSLTFile.xsl"></asp:Xml>
                    
                </div>
    </div>
    </form>
</body>
</html>