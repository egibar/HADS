<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ImportarTareas.aspx.vb" Inherits="WebApplication1.ImportarTareas" %>

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
               <div style="margin-left:40px">

        Escoje la asignatura<br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" Height="36px" Width="314px" DataTextField="codigoasig" DataValueField="codigoasig">
        </asp:DropDownList>
        <br /><br /><br />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS19TAREASConnectionString %>" SelectCommand="SELECT codigoasig FROM GruposClase INNER JOIN ProfesoresGrupo ON GruposClase.codigo = ProfesoresGrupo.codigogrupo AND ProfesoresGrupo.email = @email">
            <SelectParameters>
                  <asp:SessionParameter Name="email" SessionField="email" />
              </SelectParameters>
          </asp:SqlDataSource>
    </form>
</body>
</html>