<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ExportarTareas.aspx.vb" Inherits="WebApplication1.ExportarTareas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            height: 766px;
        }
    </style>
</head>
<body style="height: 1009px">
    <form id="form1" runat="server">
      <div align="center" style="height: 195px" >
        <asp:Panel ID="Panel1" runat="server" BackColor="Silver" Height="187px">
            <div align="right" style="height: 33px">
                <asp:Button ID="Button2CerrarSesion" runat="server" BackColor="Black" Font-Bold="True" align="right" Font-Names="Arial Black" Font-Size="10pt" ForeColor="White" Height="31px" Text="Cerrar Sesión" Width="164px" />
            </div>
            <h1>PROFESOR</h1>
            <h1>EXPORTAR TAREAS GENERICAS</h1>
        </asp:Panel>
      </div>
      <div style="height: 574px; width: 1223px;">
      <div style="height: 550px; float:left; width: 514px; margin-top: 7px;" id="divleft">
          <p>Seleccionar Asignatura a Exportar:</p>

          <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="AsignaturasProfe" DataTextField="codigoasig" DataValueField="codigoasig" Width="165px">
          </asp:DropDownList>
          <asp:SqlDataSource ID="AsignaturasProfe" runat="server" ConnectionString="<%$ ConnectionStrings:HADS19TAREASConnectionString %>" SelectCommand="SELECT codigoasig FROM GruposClase INNER JOIN ProfesoresGrupo ON GruposClase.codigo = ProfesoresGrupo.codigogrupo AND ProfesoresGrupo.email = @email">
              <SelectParameters>
                  <asp:SessionParameter Name="email" SessionField="email" />
              </SelectParameters>
          </asp:SqlDataSource>
          <br />
          <br />
          <br />
          <br />
          <asp:Button ID="ButtonExpXML" runat="server" Text="Exportar XML" Width="185px" />

          <br />
          <br />
          <asp:Button ID="ButtonExpJSON" runat="server" Text="Exportar JSON" Width="185px" />

          <br />

      </div>
      <div style="float:right; width: 691px; height: 553px; margin-top: 6px; top: auto;" id="divright">

          <br />
          <br />
          <asp:SqlDataSource ID="DatosExportar" runat="server" ConnectionString="<%$ ConnectionStrings:HADS19TAREASConnectionString %>" SelectCommand="SELECT [Codigo], [Descripcion], [HEstimadas], [Explotacion] FROM [TareasGenericas] WHERE ([CodAsig] = @CodAsig)">
              <SelectParameters>
                  <asp:ControlParameter ControlID="DropDownList1" DefaultValue="SelectedValue" Name="CodAsig" PropertyName="SelectedValue" />
              </SelectParameters>
          </asp:SqlDataSource>
          <asp:GridView ID="GridView1" runat="server" Height="250px" Width="618px" AutoGenerateColumns="False" DataKeyNames="Codigo" DataSourceID="DatosExportar">
              <Columns>
                  <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
                  <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                  <asp:BoundField DataField="HEstimadas" HeaderText="HEstimadas" SortExpression="HEstimadas" />
                  <asp:CheckBoxField DataField="Explotacion" HeaderText="Explotacion" SortExpression="Explotacion" />
              </Columns>
          </asp:GridView>

      </div>
     </div>
     <div style="height: 109px">
          
         <asp:Label ID="Label1Exportar" runat="server" Visible="False"></asp:Label>
         <br />
         <br />
         <br />
         <br />
         <br />
         <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Profesor.aspx">Menú Profesor</asp:HyperLink>
     </div>
    </form>
    
</body>
</html>
