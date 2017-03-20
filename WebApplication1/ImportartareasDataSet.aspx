<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ImportarTareasDataSet.aspx.vb" Inherits="WebApplication1.ImportartareasDataSet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            height: 895px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 795px">
        <div align="center" style="height: 174px" >
        <asp:Panel ID="Panel2" runat="server" BackColor="Silver" Height="166px">
            <div align="right" style="height: 33px">
                <asp:Button ID="Button2CerrarSesion" runat="server" BackColor="Black" Font-Bold="True" align="right" Font-Names="Arial Black" Font-Size="10pt" ForeColor="White" Height="31px" Text="Cerrar Sesión" Width="164px" />
            </div>
            <h1>PROFESOR</h1>
            <h1>IMPORTAR TAREAS GENERICAS</h1>
        </asp:Panel>
      </div>
      <div style="margin-left:17px; height: 339px; width: 497px; float:left; margin-bottom: 9px;" >
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
          <br />
                   <br />
                   <asp:Button ID="Button1" runat="server" Text="Importar Tareas" Height="52px" Width="231px" />
      </div>
      <div style="height: 342px; width: 715px; float:right">

          <asp:Xml ID="Xml1" runat="server" TransformSource="~/App_Data/XSLTFile.xsl"></asp:Xml>
          <asp:GridView ID="GridView1" runat="server" Height="205px" Width="568px">
          </asp:GridView>

      </div>
                   <br />
                <div style="margin-left: 13px; margin-right: 40px; height: 226px; margin-top: 334px;">                  
            
                    
                    <br />
                    <asp:Label ID="Label1Importar" runat="server" Visible="False"></asp:Label>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Profesor.aspx" >Volver a Menú Profesor</asp:HyperLink>
                    <br />
            
                    
                </div>
    </div>
    </form>
</body>
</html>
