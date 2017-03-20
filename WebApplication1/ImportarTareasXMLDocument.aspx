<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ImportarTareasXMLDocument.aspx.vb" Inherits="WebApplication1.ImportarTareas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 543px;
        }
    </style>
</head>
<body style="height: 530px">
    <form id="form1" runat="server">
    <div>
        <div align="center" style="height: 174px" >
        <asp:Panel ID="Panel2" runat="server" BackColor="Silver" Height="166px">
            <div align="right" style="height: 33px">
                <asp:Button ID="Button2CerrarSesion" runat="server" BackColor="Black" Font-Bold="True" align="right" Font-Names="Arial Black" Font-Size="10pt" ForeColor="White" Height="31px" Text="Cerrar Sesión" Width="164px" />
            </div>
            <h1>PROFESOR</h1>
            <h1>IMPORTAR TAREAS GENERICAS</h1>
        </asp:Panel>
      </div>
      <div style="margin-left:40px; height: 231px;">
         Escoje la asignatura<br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" Height="36px" Width="314px" DataTextField="codigoasig" DataValueField="codigoasig">
        </asp:DropDownList>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS19TAREASConnectionString %>" SelectCommand="SELECT codigoasig FROM GruposClase INNER JOIN ProfesoresGrupo ON GruposClase.codigo = ProfesoresGrupo.codigogrupo AND ProfesoresGrupo.email = @email">
            <SelectParameters>
                  <asp:SessionParameter Name="email" SessionField="email" />
              </SelectParameters>
          </asp:SqlDataSource>
                   <br /><br />
                   <br />
         <asp:Button ID="Button1" runat="server" Text="Importar Tareas" Height="52px" Width="231px" />
                   </div>
                   <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Profesor.aspx" >Volver Atras</asp:HyperLink>
<div style="margin-left: 40px; margin-right: 40px">                  
                    <asp:Xml ID="Xml1" runat="server" TransformSource="~/App_Data/XSLTFile.xsl"></asp:Xml>
                    
                    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/&amp; DropDownList1.SelectedValue &amp; &quot;.xml&quot;"></asp:XmlDataSource>
                    
                </div>
    </div>
    </form>
</body>
</html>