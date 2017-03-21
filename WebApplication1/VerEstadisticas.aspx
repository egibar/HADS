<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="VerEstadisticas.aspx.vb" Inherits="WebApplication1.VerEstadisticas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>    
        <asp:DropDownList ID="DDList1Asig" runat="server" Height="36px" Width="314px" DataSourceID="SqlDataSource1" DataTextField="email" DataValueField="email">
        </asp:DropDownList>
        </div>
    <div>
    
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource2" Height="704px" Width="935px">
            <Series>
                <asp:Series Name="Series1" XValueMember="CodTarea" YValueMembers="HReales">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS19TAREASConnectionString %>" SelectCommand="SELECT [email] FROM [Usuarios] WHERE ([tipo] = @tipo)">
            <SelectParameters>
                <asp:Parameter DefaultValue="A" Name="tipo" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HADS19TAREASConnectionString %>" SelectCommand="SELECT [CodTarea], [HReales] FROM [EstudiantesTareas] WHERE ([Email] = @Email)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DDList1Asig" DefaultValue="pepe@ikasle.ehu.es" Name="Email" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
