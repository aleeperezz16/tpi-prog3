<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarPedidos.aspx.cs" Inherits="Vistas.Admin.Pedidos.ListarPedidos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 26px;
        }
        .auto-style5 {
            height: 26px;
            width: 692px;
        }
        .auto-style6 {
            width: 692px;
        }
        .auto-style7 {
            width: 692px;
            text-align: center;
            height: 74px;
            font-weight: bold;
            font-size: x-large;
            color: #FFFAF0;
            background-color: #DC143C;
        }
        .auto-style11 {
            height: 74px;
        }
        .auto-style12 {
            height: 26px;
            width: 249px;
        }
        .auto-style13 {
            height: 74px;
            width: 249px;
        }
        .auto-style14 {
            width: 249px;
        }
        .auto-style15 {
            height: 26px;
            width: 1083px;
        }
        .auto-style16 {
            width: 692px;
            text-align: center;
        }
    </style>
     <link rel="stylesheet" href="../../StyleSheetG6.css"/>
</head>
<body>
    <form id="form1" class="fontStyle" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style12">&nbsp;</td>
                    <td class="auto-style5" colspan="2">
                        <asp:HyperLink ID="hlVolverinicio" runat="server" BorderStyle="None" NavigateUrl="~/Inicio.aspx">Volver al Menú Principal</asp:HyperLink>
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="lblCuentaIngresada" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13">
                    </td>
                    <td class="auto-style7" colspan="2">
                        Listar pedidos</td>
                    <td class="auto-style11"></td>
                </tr>
                <tr>
                    <td class="auto-style12" rowspan="2"></td>
                    <td class="auto-style15" rowspan="2">
                        <span class="auto-style16">Buscar pedido por id:</span><asp:TextBox ID="txtBuscar" runat="server" ValidationGroup="1"></asp:TextBox>
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnBuscar" CssClass="myButton" runat="server" Text="Buscar" OnClick="btnBuscar_Click" ValidationGroup="1" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                    <td class="auto-style5">
                        &nbsp;</td>
                    <td class="auto-style2" rowspan="2"></td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbBuscarPedidoPorId" ErrorMessage="*Solo debe ingresar números." ForeColor="#FF3300" ValidationExpression="^\d+$" ValidationGroup="1"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14">&nbsp;</td>
                    <td class="auto-style6" colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style14">&nbsp;</td>
                    <td class="auto-style16" colspan="2">
                        <asp:GridView ID="gvListarPedidos" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="gdvListarPedidos_PageIndexChanging">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="IDPedido" HeaderText="Id" />
                                <asp:BoundField DataField="NombreArticulo" HeaderText="Articulo" />
                                <asp:BoundField DataField="NombreProveedor" HeaderText="Proveedor" />
                                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                                <asp:BoundField DataField="FechaVenta" HeaderText="Fecha" />
                                <asp:BoundField DataField="CostoTotal" HeaderText="Total" />
                            </Columns>
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
                    <td class="auto-style14">&nbsp;</td>
                    <td class="auto-style6" colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style14">&nbsp;</td>
                    <td class="auto-style6" colspan="2">
                        <asp:Label ID="lbObservaciones1" runat="server" Font-Bold="True" Text="Observación: Solo se buscará por ID."></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style14">&nbsp;</td>
                    <td class="auto-style6" colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style14">&nbsp;</td>
                    <td class="auto-style6" colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
