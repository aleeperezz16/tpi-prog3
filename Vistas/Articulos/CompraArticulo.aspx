<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompraArticulo.aspx.cs" Inherits="Vistas.Articulos.CompraArticulo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 128px;
        }

        .auto-style4 {
            width: 577px;
        }
    </style>
    <link rel="stylesheet" href="../StyleSheetG6.css" />
</head>
<body>
    <form id="form1" class="fontStyle" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td colspan="2">
                        <asp:HyperLink ID="hlInicio" runat="server" NavigateUrl="~/InicioClientes.aspx">Volver al Menú Principal</asp:HyperLink>
                    </td>
                    <td>
                        <asp:Label ID="lblCuentaIngresada" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3" colspan="2">
                        <asp:Label ID="Label1" CssClass="mainItem" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Artículos"></asp:Label>
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3" colspan="2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:HyperLink ID="hpCarrito" runat="server" NavigateUrl="~/Articulos/CarritoDeCompras.aspx">Carrito de Compras</asp:HyperLink>
                    </td>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2" rowspan="2">&nbsp;</td>
                    <td class="auto-style4" rowspan="2">
                        <asp:Label ID="lblBuscarxID" CssClass="subItem" runat="server" Text="Buscar Artículos por ID:"></asp:Label>
                        <asp:TextBox ID="tbBuscarxID" runat="server" ValidationGroup="1"></asp:TextBox>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnBuscarxID" CssClass="myButton" runat="server" Text="Buscar" ValidationGroup="1" OnClick="btnBuscarxID_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnVistaPrincipal" CssClass="myButton" runat="server" OnClick="btnVistaPrincipal_Click" Text="Vista Principal" Width="176px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvBuscarxID" runat="server" ControlToValidate="tbBuscarxID" Font-Bold="False" ForeColor="#FF3300" ValidationGroup="1">*Por favor, ingrese algun valor ID numerico</asp:RequiredFieldValidator>
                    </td>
                    <td rowspan="2">&nbsp;</td>
                    <td rowspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:RegularExpressionValidator ID="revBuscarxID" runat="server" ControlToValidate="tbBuscarxID" ForeColor="#FF3300" ValidationExpression="^\d+$" ValidationGroup="1">*Solo se deben ingresar números</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td colspan="2">
                        <asp:Label ID="lblFiltrarxCategoria" CssClass="subItem" runat="server" Text="Filtrar por Categoria:"></asp:Label>
                        &nbsp;<asp:DropDownList ID="ddlCategorias" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataTextField="-- Seleccione --" DataValueField="0" OnSelectedIndexChanged="ddlCategorias_SelectedIndexChanged" ValidationGroup="2">
                            <asp:ListItem Selected="True" Value="0">-- Seleccione --</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td colspan="2">
                        <asp:GridView ID="gvComprarArticulos" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="gvComprarArticulos_PageIndexChanging" OnRowCommand="gvComprarArticulos_RowCommand" Width="871px">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="IDArticulo" HeaderText="Id" Visible="False" />
                                <asp:BoundField DataField="NombreArticulo" HeaderText="Articulo" />
                                <asp:BoundField DataField="NombreCategoria" HeaderText="Categoria" />
                                <asp:BoundField DataField="PrecioDeVenta" DataFormatString="{0:c}" HeaderText="Precio" />
                                <asp:BoundField DataField="Stock" HeaderText="Stock" />
                                <asp:TemplateField HeaderText="Cantidad">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_it_Cantidad" runat="server" TextMode="Number"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfv_it_Cantidad" runat="server" ControlToValidate="txt_it_Cantidad" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:ButtonField ButtonType="Button" CommandName="EventoAgregar" Text="Agregar al Carrito" CausesValidation="True" />
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
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
