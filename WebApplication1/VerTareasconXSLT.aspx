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
<body style="height: 527px">
    <form id="form1" runat="server">
    <div style="height: 63px">
        <h1>MIS TAREAS</h1>
    </div>
    <div style="height: 437px">
        <br />
        <asp:Xml ID="XmlHASoriginal" runat="server" DocumentSource="~/App_Data/HAS.xml" TransformSource="~/App_Data/XSLTFile.xsl"></asp:Xml>
        <asp:Xml ID="XmlCodigo" runat="server" DocumentSource="~/App_Data/HAS.xml" TransformSource="~/App_Data/XSLTCodigo.xsl"></asp:Xml>
        <asp:Xml ID="XmlDescripcion" runat="server" DocumentSource="~/App_Data/HAS.xml" TransformSource="~/App_Data/XSLTDescripcion.xsl"></asp:Xml>
        <asp:Xml ID="XmlHEstimadas" runat="server" DocumentSource="~/App_Data/HAS.xml" TransformSource="~/App_Data/XSLTHEstimadas.xsl"></asp:Xml>
        <br />
       <br /><asp:LinkButton ID="lnkCodigo" runat="server">Ordenar por Código</asp:LinkButton><br />
       <br /> <asp:LinkButton ID="lnkDescripcion" runat="server">Ordenar por Descripción</asp:LinkButton><br />
       <br /><asp:LinkButton ID="lnkHEstimadas" runat="server">Ordenar por Horas Estimadas</asp:LinkButton><br />

    </div>
    </form>
</body>
</html>
