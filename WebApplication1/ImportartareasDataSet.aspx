<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ImportarTareasDataSet.aspx.vb" Inherits="WebApplication1.ImportarTareasDataSet1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            height: 941px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <div align="center" style="height: 174px" >
        <asp:Panel ID="Panel2" runat="server" BackColor="Silver" Height="166px">
            <div align="right" style="height: 33px">
                <asp:Button ID="Button2CerrarSesion" runat="server" BackColor="Black" Font-Bold="True" align="right" Font-Names="Arial Black" Font-Size="10pt" ForeColor="White" Height="31px" Text="Cerrar Sesión" Width="164px" />
            </div>
            <h1>PROFESOR</h1>
            <h1>IMPORTAR TAREAS GENERICAS</h1>
        </asp:Panel>
      </div>
    <div style="height: 370px;">
        <div style="margin-left:17px; height: 350px; width: 514px; float:left; margin-bottom: 9px;" >
         Escoje la asignatura<br />
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" Height="36px" Width="314px" DataTextField="codigoasig" DataValueField="codigoasig">
        </asp:DropDownList>
        <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS19TAREASConnectionString %>" SelectCommand="SELECT [codigoasig]FROM [GruposClase] INNER JOIN [ProfesoresGrupo] ON [GruposClase].[codigo] = [ProfesoresGrupo].[codigogrupo] WHERE ([email] = @email)">
            <SelectParameters>
                  <asp:SessionParameter Name="email" SessionField="email" />
              </SelectParameters>
          </asp:SqlDataSource>
                   <br /><br />
                   <br />
            <asp:Label ID="lblMensaje" runat="server" Font-Bold="True" ForeColor="Red" Visible="False"></asp:Label>
          <br />
                   <br />
             <asp:Button ID="Button1" runat="server" Text="Importar Tareas" Height="52px" Width="231px" />
      </div>
      <div style="height: 349px; width: 700px; float:right">

          <br />
          <asp:GridView ID="GridViewDatos" runat="server" Height="220px" Width="413px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
              <AlternatingRowStyle BackColor="#CCCCCC" />
              <FooterStyle BackColor="#CCCCCC" />
              <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
              <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#808080" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#383838" />
          </asp:GridView>

          <asp:Xml ID="Xml1" runat="server"></asp:Xml>

      </div>
          <br />
    </div>
    <div style="height: 186px">
        <br />
        <asp:Label ID="Label1Importar" runat="server" Visible="False"></asp:Label>
        <br />
        <br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Profesor.aspx">Volver a Menú Profesor</asp:HyperLink>
        <br />
    </div>
   </form>
</body>
</html>