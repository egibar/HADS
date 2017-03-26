<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="VerTareasconXLST.aspx.vb" Inherits="WebApplication1.VerTareasconXLST" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            height: 646px;
        }
    </style>
</head>
<body style="height: 602px">
    <form id="form1" runat="server">
    <div align="right" style="height: 25px">
       <asp:Button ID="Button2CerrarSesion" runat="server" BackColor="Black" Font-Bold="True" Font-Names="Arial Black" Font-Size="10pt" ForeColor="White" Height="29px" Text="Cerrar Sesión" Width="164px" PostBackUrl="~/Inicio.aspx" /> 
    </div> 
    <div style="height: 557px">
        <br />
        <asp:Xml ID="XmlHASoriginal" runat="server" DocumentSource="~/App_Data/HAS.xml" TransformSource="~/App_Data/XSLTFile.xsl"></asp:Xml>
        <asp:Xml ID="XmlCodigo" runat="server" DocumentSource="~/App_Data/HAS.xml" TransformSource="~/App_Data/XSLTCodigo.xsl"></asp:Xml>
        <asp:Xml ID="XmlDescripcion" runat="server" DocumentSource="~/App_Data/HAS.xml" TransformSource="~/App_Data/XSLTDescripcion.xsl"></asp:Xml>
        <asp:Xml ID="XmlHEstimadas" runat="server" DocumentSource="~/App_Data/HAS.xml" TransformSource="~/App_Data/XSLTHEstimadas.xsl"></asp:Xml>
        <br />
       <br /><asp:LinkButton ID="lnkCodigo" runat="server">Ordenar por Código</asp:LinkButton><br />
       <br /> <asp:LinkButton ID="lnkDescripcion" runat="server">Ordenar por Descripción</asp:LinkButton><br />
       <br /><asp:LinkButton ID="lnkHEstimadas" runat="server">Ordenar por Horas Estimadas</asp:LinkButton><br />

        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Profesor/Profesor.aspx">Volver al Menú</asp:HyperLink>

    </div>
    </form>
</body>
</html>
