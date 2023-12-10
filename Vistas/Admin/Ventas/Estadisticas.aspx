<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Estadisticas.aspx.cs" Inherits="Vistas.Admin.Ventas.WebForm1" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 270px;
        }
        .auto-style3 {
            width: 88px;
        }
    </style>
    <link rel="stylesheet" href="../../StyleSheetG6.css"/>
</head>
<body>
    <form id="form1" class="fontStyle" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblTituloEstadisticas" runat="server" class="mainItem" Text="Estadisticas de compra/venta"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlCategorias" runat="server">
                            <asp:ListItem>--Seleccionar--</asp:ListItem>
                            <asp:ListItem>Recaudacion Total</asp:ListItem>
                            <asp:ListItem>Recaudacion Por Articulo</asp:ListItem>
                            <asp:ListItem>Cantidad De Ventas Por Categoria</asp:ListItem>
                            <asp:ListItem>Gastos En Mercaderia</asp:ListItem>
                            <asp:ListItem>Gastos Por Producto</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvTipoRsumen" runat="server" ControlToValidate="ddlCategorias" ErrorMessage="Seleccione una categoria" InitialValue="--Seleccionar--"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFechaInicio" runat="server" CssClass="ocultar"></asp:TextBox>
                        <asp:TextBox ID="txtFechaCierre" runat="server" CssClass="ocultar"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblFechaInicio" runat="server" CssClass="subItem" Text="Fecha Inicio"></asp:Label>
                    </td>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblFechaCierre" runat="server" CssClass="subItem" Text="FechaCierre"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:Calendar ID="calInicio" runat="server" CssClass="myCalendar" OnDayRender="calInicio_DayRender" OnSelectionChanged="calInicio_SelectionChanged"></asp:Calendar>
                        <asp:RequiredFieldValidator ID="rfvFechaIncio" runat="server" ControlToValidate="txtFechaInicio" ErrorMessage="Seleccione una fecha de incio"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:Calendar ID="calCierre" runat="server" CssClass="myCalendar" OnSelectionChanged="Calendar2_SelectionChanged"></asp:Calendar>
                        <asp:RequiredFieldValidator ID="rfvFechaCierre" runat="server" ControlToValidate="txtFechaCierre" ErrorMessage="Seleccione una fecha de cierre"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td colspan="2">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnVisualizar" runat="server" CssClass="myButton" OnClick="btnVisualizar_Click" Text="Ver Estadisticas" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td colspan="2">
                        <asp:GridView ID="grvDatos" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:Chart ID="chGrafico1" runat="server">
                            <Series>
                                <asp:Series Name="Series1">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                    </td>
                    <td>
                        <asp:Chart ID="chGrafico2" runat="server">
                            <Series>
                                <asp:Series Name="Series1">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
