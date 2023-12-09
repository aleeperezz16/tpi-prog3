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
            width: 206px;
        }

        .auto-style4 {
            width: 577px;
        }

        .auto-style6 {
            text-align: center;
            font-weight: bold;
            font-size: xx-large;
            color: #FFFAF0;
            background-color: #DC143C;
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
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:HyperLink ID="hlnkInicio" runat="server" NavigateUrl="~/Inicio.aspx">Volver al Menú Principal</asp:HyperLink>
                    </td>
                    <td class="auto-style6">Artículos</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:HyperLink ID="hlnkCarrito" runat="server" NavigateUrl="~/Articulos/CarritoDeCompras.aspx">Carrito de Compras</asp:HyperLink>
                    </td>
                    <td></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:Label ID="lblFiltrarCategoria" CssClass="subItem" runat="server" Text="Filtrar por Categoria:"></asp:Label>
                        <asp:DropDownList ID="ddlCategorias" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataTextField="-- Seleccione --" DataValueField="0" OnSelectedIndexChanged="ddlCategorias_SelectedIndexChanged" ValidationGroup="2">
                            <asp:ListItem Selected="True" Value="0">-- Seleccione --</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:GridView ID="gvComprarArticulos" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="gvComprarArticulos_PageIndexChanging" OnRowCommand="gvComprarArticulos_RowCommand" Width="871px">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="Articulo">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Articulo" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                                        <asp:Label ID="lbl_it_IdArticulo" runat="server" Text='<%# Eval("Id") %>' Visible="False"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Categoria" HeaderText="Categoria" />
                                <asp:BoundField DataField="Precio Venta" DataFormatString="{0:c}" HeaderText="Precio" />
                                <asp:BoundField DataField="Stock" HeaderText="Stock" />
                                <asp:TemplateField HeaderText="Cantidad">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_it_Cantidad" runat="server" Height="20px" Width="86px" TextMode="Number"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:ButtonField ButtonType="Button" CommandName="EventoAgregar" Text="Agregar al Carrito" />
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
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
