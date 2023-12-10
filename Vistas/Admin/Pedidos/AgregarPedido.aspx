<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarPedido.aspx.cs" Inherits="Vistas.Admin.Pedidos.AgregarPedido" %>

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
            text-align: center;
            height: 48px;
        }
        .auto-style5 {
            height: 26px;
        }
        .auto-style7 {
            height: 48px;
        }
        .auto-style8 {
            text-align: center;
        }
        .auto-style9 {
            text-align: left;
        }
        .auto-style11 {
            height: 64px;
        }
        .auto-style12 {
            height: 64px;
            width: 580px;
            text-align: center;
        }
        .auto-style14 {
            height: 40px;
        }
        .auto-style15 {
            height: 24px;
        }
        .auto-style16 {
            height: 42px;
        }
        .auto-style17 {
            width: 48px;
        }
        .auto-style18 {
            height: 48px;
            width: 48px;
        }
        .auto-style19 {
            height: 24px;
            width: 48px;
        }
        .auto-style20 {
            height: 64px;
            width: 48px;
        }
        .auto-style21 {
            height: 26px;
            width: 48px;
        }
        .auto-style22 {
            height: 26px;
            text-align: right;
        }
        .auto-style23 {
            text-align: right;
        }
    </style>
     <link rel="stylesheet" href="../../StyleSheetG6.css"/>
</head>
<body>
    <form id="form1" class="fontStyle" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style9">
                    <asp:HyperLink ID="hlVolverInicio" runat="server" NavigateUrl="~/Inicio.aspx">Volver al Menú Principal</asp:HyperLink>
                </td>
                <td class="auto-style23">
                    <asp:Label ID="lblCuentaIngresada" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style18">
                    &nbsp;</td>
                <td class="auto-style2" colspan="2">
                    <asp:Label ID="lbl_TituloPagina" CssClass="mainItem" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Agregar Pedido"></asp:Label>
                </td>
                <td class="auto-style7"></td>
            </tr>
            <tr>
                <td class="auto-style19"></td>
                <td class="auto-style15" colspan="2"></td>
                <td class="auto-style15"></td>
            </tr>
            <tr>
                <td class="auto-style20" rowspan="2"></td>
                <td class="auto-style12" rowspan="2">
                    <asp:Label ID="lblBuscarArticuloxID" CssClass="subItem" runat="server" Text="Buscar Articulo Por ID:"></asp:Label>
                    <asp:TextBox ID="tbBuscarArticuloxID" runat="server" ValidationGroup="1"></asp:TextBox>
                    <br />
                    <asp:Button ID="btnBuscar" CssClass="myButton" runat="server" OnClick="btnBuscar_Click" Text="Buscar" ValidationGroup="1" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnVistaInicial" CssClass="myButton" runat="server" OnClick="btnVistaInicial_Click" Text="Vista Inicial" />
                </td>
                <td class="auto-style16">
                    <asp:RequiredFieldValidator ID="rfvBuscarxID" runat="server" ControlToValidate="tbBuscarArticuloxID" ForeColor="#CC3300" ValidationGroup="1">*Ingrese un número de ID para buscarlo.</asp:RequiredFieldValidator>
                </td>
                <td class="auto-style11" rowspan="2"></td>
            </tr>
            <tr>
                <td class="auto-style14">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbBuscarArticuloxID" ErrorMessage="RegularExpressionValidator" ForeColor="#FF3300" ValidationExpression="^\d+$" ValidationGroup="1">*Solo debe ingresar Números</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style9" colspan="2">Especificar la cantidad de unidades que se desea ordenar al proveedor, del articulo deseado y presionar Agregar, para ordenarlo.</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style8" colspan="2">
                    <asp:GridView ID="gdvAgregarpedido" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="gdvAgregarpedido_RowCommand" PageSize="5" OnPageIndexChanging="gdvAgregarpedido_PageIndexChanging">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="ID Articulo">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_it_IDArticulo" runat="server" Text='<%# Bind ("IDArticulo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nombre de Articulo">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_it_NombreArticulo" runat="server" Text='<%# Bind ("NombreArticulo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ID Categoria">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_it_IDCategoria" runat="server" Text='<%# Bind ("IDCategoria") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ID Proveedor">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_it_IDProveedor" runat="server" Text='<%# Bind ("IDProveedor") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Precio de Venta">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_it_PrecioVenta" runat="server" Text='<%# Bind ("PrecioDeVenta") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Precio de Compra">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_it_PrecioCompra" runat="server" Text='<%# Bind ("PrecioDeCompra") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Estado">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_it_Estado" runat="server" Text='<%# Bind ("Estado") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Stock Disponible">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_it_Stock" runat="server" Text='<%# Bind ("Stock") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Cantidad a Comprar">
                                <ItemTemplate>
                                    <asp:TextBox ID="tbCantidadaComprar" runat="server" Height="24px" Width="55px" ValidationGroup="2"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:ButtonField ButtonType="Button" CommandName="EventoAgregar" Text="Comprar" />
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
                <td class="auto-style21"></td>
                <td class="auto-style22" colspan="2">
                    &nbsp;</td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style21"></td>
                <td class="auto-style5" colspan="2">&nbsp;</td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
