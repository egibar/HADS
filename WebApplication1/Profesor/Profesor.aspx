<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Profesor.aspx.vb" Inherits="WebApplication1.Profesor" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Gestión de Tareas Profesor</title>
    <style type="text/css">
        body{
             font-family: Georgia, 'Times New Roman', Times, serif;
        }
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            width: 19%;
            background-color: #f1f1f1;
            position: fixed;
            height: 100%;
            top: 15px;
            left: 10px;
        }
        li a {
            align-content:center;
            display: inline-block;
            color: #000;
            padding: 8px 16px;
            height: 18px;
            margin-top: 5px;
        }
        div p{
            text-align:center;
            font-weight: bold;
            font-family:serif;
            font-size: 25px;
            margin-top: 45px;
            margin-bottom: 35px;
        }
        #form1 {
            height: 650px;
        }
    </style>
</head>
<body style="height: 720px">
    <form id="form1" runat="server">

      <ul>
          <li><a href='VerEstadisticas.aspx'>Estadisticas</a></li>
          <li><a href=''>Asignaturas</a></li>
          <li><a href='TareasProfesor.aspx'>Tareas</a></li>
          <li><a href=''>Grupos</a></li>
          <li><a href='ImportarTareasXMLDocument.aspx'>Importar v.XMLDocument</a></li>
          <li><a href='ImportarTareasDataSet.aspx'>Importar v.DataSet</a></li>
          <li><a href='ExportarTareas.aspx'>Exportar</a></li>
          <li><a href='VerTareasconXSLT.aspx'>Ver Tareas con XSLT</a></li>
      </ul>
    <div style="height: 577px; width: 1067px; float:right; margin-left: 7px;" id="divRight">
            <div align="right" style="height: 25px">
             <asp:Button ID="Button2CerrarSesion" runat="server" BackColor="Black" Font-Bold="True" Font-Names="Arial Black" Font-Size="10pt" ForeColor="White" Height="29px" Text="Cerrar Sesión" Width="164px" /> 
            </div> 
            </br>
            <p align="center">Gestión Web de Tareas-Dedicación</p>
            <p align="center">Profesores</p>
<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">

            <ContentTemplate>
                <asp:Timer ID="Timer1" runat="server" Interval="2000">
                </asp:Timer>

                &nbsp;<table style="width: 100%; height: 220px;">
                    <tr>
                        <td style="width: 50%">
                            <h6 style="font-size: 18px">Alumnos(
                                <asp:Label ID="label_alu" runat="server" Text="0"></asp:Label>
                                )
                                    <asp:LinkButton ID="LinkButton1" runat="server">Mostrar/Ocultar</asp:LinkButton>
                            </h6>
                            <asp:Panel ID="Panel1" runat="server">
                                <asp:ListBox ID="ListBox1Alumn" runat="server" Width="98%" Height="79px"></asp:ListBox>
                            </asp:Panel>

                        </td>
                        <td style="width: 50%">
                            <h6 style="font-size: 18px">Profesores(<asp:Label ID="label_prof" runat="server" Text="0"></asp:Label>
                                )
                                    <asp:LinkButton ID="LinkButton2" runat="server">Mostrar/Ocultar</asp:LinkButton>
                                
                            </h6>
                            <asp:Panel ID="Panel2" runat="server">
                                <asp:ListBox ID="ListBox2Profes" runat="server" Width="100%"></asp:ListBox>

                            </asp:Panel>
                        </td>
                    </tr>
                </table>
                
                <ajaxToolkit:CollapsiblePanelExtender ID="cpe" runat="Server"
                    TargetControlID="Panel1"
                    CollapsedSize="0"
                    ExpandedSize="68"
                    Collapsed="True"
                    ExpandControlID="LinkButton1"
                    CollapseControlID="LinkButton1"
                    AutoCollapse="False"
                    AutoExpand="False"
                    ScrollContents="True"
                    ExpandDirection="Vertical" />
                <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender2" runat="Server"
                    TargetControlID="Panel2"
                    CollapsedSize="0"
                    ExpandedSize="68"
                    Collapsed="True"
                    ExpandControlID="LinkButton2"
                    CollapseControlID="LinkButton2"
                    AutoCollapse="False"
                    AutoExpand="False"
                    ScrollContents="True"
                    ExpandDirection="Vertical" />

            </ContentTemplate>
        </asp:UpdatePanel>

                 </div>
    </form>
</body>
</html>
