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
      <div style="height: 411px; width: 1248px;">
      <div style="height: 400px; float:left; width: 430px; margin-top: 7px;" id="divleft">
          <p>Seleccionar Asignatura a Exportar:</p>

          <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="AsignaturasProfe" DataTextField="codigoasig" DataValueField="codigoasig" Width="165px" AutoPostBack="True">
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
      <div style="float:right; width: 800px; height: 400px; margin-top: 6px; top: auto;" id="divright">

          <br />
          <br />
          <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
              <AlternatingRowStyle BackColor="White" />
              <EditRowStyle BackColor="#2461BF" />
              <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
              <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
              <RowStyle BackColor="#EFF3FB" />
              <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
              <SortedAscendingCellStyle BackColor="#F5F7FB" />
              <SortedAscendingHeaderStyle BackColor="#6D95E1" />
              <SortedDescendingCellStyle BackColor="#E9EBEF" />
              <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>

      </div>
     </div>
     <div style="height: 109px">
          
         <asp:Label ID="Label1Exportar" runat="server" Visible="False" Font-Bold="True" Font-Size="Large"></asp:Label>
         <br />
         <br />
         <br />
         <br />
         <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Profesor/Profesor.aspx" Font-Bold="True">Volver a Menú Profesor</asp:HyperLink>
     </div>
    </form>
    
</body>
</html>
