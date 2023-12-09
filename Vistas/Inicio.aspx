﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Vistas.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 499px;
        }

        .auto-style12 {
            width: 80px;
        }

        .auto-style15 {
            width: 80px;
            height: 27px;
        }
        .auto-style18 {
            height: 25px;
            width: 193px;
        }
        .auto-style21 {
            text-align: center;
            height: 25px;
            width: 119px;
        }
        .auto-style22 {
            text-align: center;
            width: 119px;
        }
        .auto-style23 {
            text-align: center;
            height: 27px;
            width: 119px;
        }
        .auto-style25 {
            text-align: center;
            width: 285px;
        }
        .auto-style26 {
            text-align: center;
            height: 27px;
            width: 285px;
        }
        .auto-style33 {
            text-align: center;
            height: 11px;
            width: 119px;
        }
        .auto-style34 {
            text-align: center;
            height: 11px;
            width: 285px;
        }
        .auto-style37 {
            height: 11px;
            width: 193px;
        }
        .auto-style38 {
            text-align: center;
            height: 37px;
            width: 80px;
        }
        .auto-style39 {
            text-align: center;
            height: 11px;
            width: 80px;
        }
        .auto-style40 {
            text-align: center;
            height: 27px;
            width: 80px;
        }
        .auto-style41 {
            text-align: center;
            width: 80px;
        }
        .auto-style42 {
            text-align: center;
            height: 37px;
            width: 119px;
        }
        .auto-style43 {
            text-align: center;
            height: 37px;
            width: 285px;
        }
        .auto-style45 {
            text-align: center;
            height: 34px;
            width: 119px;
        }
        .auto-style46 {
            text-align: center;
            height: 34px;
            width: 285px;
        }
        .auto-style47 {
            text-align: center;
            height: 25px;
            width: 285px;
        }
        .auto-style48 {
            width: 80px;
            height: 25px;
        }
        .auto-style52 {
            text-align: center;
            height: 28px;
            width: 80px;
        }
        .auto-style54 {
            text-align: center;
            height: 28px;
            width: 119px;
        }
        .auto-style55 {
            text-align: center;
            height: 28px;
            width: 285px;
        }
        .auto-style56 {
            text-align: center;
            height: 26px;
            width: 119px;
        }
        .auto-style57 {
            text-align: center;
            height: 26px;
            width: 285px;
        }
        .auto-style58 {
            width: 80px;
            height: 26px;
        }
        .auto-style60 {
            text-align: center;
            height: 37px;
            width: 282px;
        }
        .auto-style61 {
            text-align: center;
            height: 34px;
            width: 282px;
        }
        .auto-style62 {
            text-align: center;
            height: 11px;
            width: 282px;
        }
        .auto-style63 {
            text-align: center;
            height: 27px;
            width: 282px;
        }
        .auto-style64 {
            text-align: center;
            height: 26px;
            width: 282px;
        }
        .auto-style65 {
            text-align: center;
            height: 25px;
            width: 282px;
        }
        .auto-style66 {
            text-align: center;
            height: 28px;
            width: 282px;
        }
        .auto-style67 {
            text-align: center;
            width: 282px;
        }
        .auto-style69 {
            height: 26px;
            width: 193px;
        }
        .auto-style70 {
            height: 27px;
            width: 193px;
        }
        .auto-style71 {
            height: 37px;
            width: 193px;
        }
        .auto-style72 {
            text-align: center;
            height: 27px;
            width: 193px;
        }
        .auto-style73 {
            text-align: center;
            height: 28px;
            width: 193px;
        }
        .auto-style74 {
            text-align: center;
            width: 193px;
        }

    </style>
        <link rel="stylesheet" href="StyleSheetG6.css"/>
</head>
<body>
    <form id="form1" class="fontStyle" runat="server">
        <div>
            <table id="tablaAdmin" class="auto-style1">
                <tr>
                    <td class="auto-style42">
                    </td>
                    <td class="auto-style60">
                    </td>
                    <td class="auto-style43">
                        <asp:Label ID="lblTitulo"  CssClass="mainItem" runat="server" Font-Bold="True" Font-Overline="False" Font-Size="XX-Large" Text="Home" ForeColor="White"></asp:Label>
                    </td>
                    <td class="auto-style38">
                    </td>
                    <td class="auto-style71">
                        <asp:Label ID="lblCuentaIngresada" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style45">
                        <asp:HyperLink ID="lnkCarrito" runat="server" NavigateUrl="~/Articulos/Carrito.aspx" Visible="False">Mi carrito </asp:HyperLink>
                    </td>
                    <td class="auto-style61">
                    </td>
                    <td class="auto-style46">
                    </td>
                </tr>
                <tr>
                    <td class="auto-style33">
                        </td>
                    <td class="auto-style62">
                        <asp:Label ID="lbSecciones"  CssClass="subItem" runat="server" Text="▬ Secciones ▬" Font-Bold="True" Font-Italic="True" Font-Size="Large"></asp:Label>
                    </td>
                    <td class="auto-style34">
                        <asp:Label ID="lbBienvenido" runat="server" Text="¡Bienvenido/a a la seccion administrativa!"></asp:Label>
                    </td>
                    <td class="auto-style39">
                    </td>
                    <td class="auto-style37"></td>
                </tr>
                <tr>
                    <td class="auto-style23">
                        &nbsp;</td>
                    <td class="auto-style63">
                        <asp:Label ID="lblSeccionarticulos"  CssClass="subItem" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Text="▬Artículos▬"></asp:Label>
                    </td>
                    <td class="auto-style26">
                        &nbsp;</td>
                    <td class="auto-style40"></td>
                    <td class="auto-style72"></td>
                </tr>
                <tr>
                    <td class="auto-style56"></td>
                    <td class="auto-style64">
                        <asp:HyperLink ID="hlListarArticulos" runat="server" NavigateUrl="~/Admin/Articulos/ListarArticulos.aspx" Visible="False">Listar Articulos</asp:HyperLink>
                        </td>
                    <td class="auto-style57"></td>
                    <td class="auto-style58"></td>
                    <td class="auto-style69"></td>
                </tr>
                <tr>
                    <td class="auto-style23">&nbsp;</td>
                    <td class="auto-style63">
                        <asp:HyperLink ID="hlComprarArticulos" runat="server" NavigateUrl="~/Articulos/CompraArticulo.aspx" Visible="False">Buscar/Comprar Articulos</asp:HyperLink>
                    </td>
                    <td class="auto-style26">&nbsp;</td>
                    <td class="auto-style15">&nbsp;</td>
                    <td class="auto-style70">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style23">&nbsp;</td>
                    <td class="auto-style63">
                        <asp:HyperLink ID="hlHistorialCompras" runat="server" NavigateUrl="~/MiCuenta/HistorialCompra.aspx" Visible="False">Mi Historial de Compras</asp:HyperLink>
                    </td>
                    <td class="auto-style26">&nbsp;</td>
                    <td class="auto-style15">&nbsp;</td>
                    <td class="auto-style70">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style21"></td>
                    <td class="auto-style65">
                        <asp:Label ID="lblSeccioncategoria" CssClass="subItem" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Text="▬Categoría▬" Visible="False"></asp:Label>
                    </td>
                    <td class="auto-style47"></td>
                    <td class="auto-style48"></td>
                    <td class="auto-style18"></td>
                </tr>
                <tr>
                    <td class="auto-style54">
                    </td>
                    <td class="auto-style66">
                        <asp:HyperLink ID="hlListarCategorias" runat="server" NavigateUrl="~/Admin/Categorias/ListarCategoria.aspx" Visible="False">Listar Categorias</asp:HyperLink>
                    </td>
                    <td class="auto-style55">
                    </td>
                    <td class="auto-style52"></td>
                    <td class="auto-style73"></td>
                </tr>
                <tr>
                    <td class="auto-style54">
                        </td>
                    <td class="auto-style66">
                        <asp:HyperLink ID="hlAgregarCategorias" runat="server" NavigateUrl="~/Admin/Categorias/AgregarCategoria.aspx" Visible="False">Agregar Categorias</asp:HyperLink>
                    </td>
                    <td class="auto-style55">
                        </td>
                    <td class="auto-style52"></td>
                    <td class="auto-style73"></td>
                </tr>
                <tr>
                    <td class="auto-style22">
                        &nbsp;</td>
                    <td class="auto-style67">
                        <asp:Label ID="lblSeccionproveedores"  CssClass="subItem" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Text="▬Proveedores▬" Visible="False"></asp:Label>
                    </td>
                    <td class="auto-style25">
                        &nbsp;</td>
                    <td class="auto-style41">&nbsp;&nbsp;</td>
                    <td class="auto-style74"></td>
                </tr>
                <tr>
                    <td class="auto-style23">
                        &nbsp;</td>
                    <td class="auto-style63">
                        <asp:HyperLink ID="hlListarproveedores" runat="server" NavigateUrl="~/Admin/Proveedores/ListarProveedores.aspx" Visible="False">Listar Proveedores</asp:HyperLink>
                    </td>
                    <td class="auto-style26">
                        &nbsp;</td>
                    <td class="auto-style40"></td>
                    <td class="auto-style72"></td>
                </tr>
                <tr>
                    <td class="auto-style22">
                        &nbsp;</td>
                    <td class="auto-style67">
                        <asp:HyperLink ID="hlAgregarproveedores" runat="server" NavigateUrl="~/Admin/Proveedores/AgregarProveedor.aspx" Visible="False">Agregar Proveedor</asp:HyperLink>
                    </td>
                    <td class="auto-style25">
                        &nbsp;</td>
                    <td class="auto-style41">
                        &nbsp;</td>
                    <td class="auto-style74"></td>
                </tr>
                <tr>
                    <td class="auto-style23">
                    </td>
                    <td class="auto-style63">
                        <asp:Label ID="lblSeccionpedidos"  CssClass="subItem" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Text="▬Pedidos▬" Visible="False"></asp:Label>
                    </td>
                    <td class="auto-style26">
                    </td>
                    <td class="auto-style40">
                    </td>
                    <td class="auto-style72"></td>
                </tr>
                <tr>
                    <td class="auto-style23">
                        &nbsp;</td>
                    <td class="auto-style63">
                        <asp:HyperLink ID="hlListarpedidos" runat="server" NavigateUrl="~/Admin/Pedidos/ListarPedidos.aspx" Visible="False">Listar Pedidos</asp:HyperLink>
                    </td>
                    <td class="auto-style26">
                        &nbsp;</td>
                    <td class="auto-style40">
                    </td>
                    <td class="auto-style70"></td>
                </tr>
                <tr>
                    <td class="auto-style22">
                        &nbsp;</td>
                    <td class="auto-style67">
                        <asp:HyperLink ID="hlAgregarPedido" runat="server" NavigateUrl="~/Admin/Pedidos/AgregarPedido.aspx" Visible="False">Agregar Pedido</asp:HyperLink>
                    </td>
                    <td class="auto-style25">
                        &nbsp;</td>
                    <td class="auto-style41">
                        </td>
                    <td class="auto-style74"></td>
                </tr>
                <tr>
                    <td class="auto-style56">
                    </td>
                    <td class="auto-style64">
                        <asp:Label ID="lblSeccionVentas"  CssClass="subItem" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Text="▬Ventas▬" Visible="False"></asp:Label>
                    </td>
                    <td class="auto-style57">
                    </td>
                    <td class="auto-style58">
                        </td>
                    <td class="auto-style69"></td>
                </tr>
                <tr>
                    <td class="auto-style22">
                        &nbsp;</td>
                    <td class="auto-style67">
                        <asp:HyperLink ID="hlListarventas" runat="server" NavigateUrl="~/Admin/Ventas/ListarVentas.aspx" Visible="False">Listar Ventas</asp:HyperLink>
                    </td>
                    <td class="auto-style25">
                        &nbsp;</td>
                    <td class="auto-style12">
                        &nbsp;</td>
                    <td class="auto-style69">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style56">
                    </td>
                    <td class="auto-style64">
                        <asp:HyperLink ID="hlListarclientes" runat="server" NavigateUrl="~/Admin/Clientes/ListarClientes.aspx" Visible="False">Listar Clientes</asp:HyperLink>
                    </td>
                    <td class="auto-style57">
                    </td>
                    <td class="auto-style58">
                        </td>
                    <td class="auto-style69"></td>
                </tr>
                <tr>
                    <td class="auto-style22">
                        &nbsp;</td>
                    <td class="auto-style67">
                        <asp:Label ID="lblCuenta"  CssClass="subItem" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Text="▬Cuenta▬" Visible="False"></asp:Label>
                    </td>
                    <td class="auto-style25">
                        &nbsp;</td>
                    <td class="auto-style12">
                        &nbsp;</td>
                    <td class="auto-style69">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style22">
                        &nbsp;</td>
                    <td class="auto-style67">
                        <asp:HyperLink ID="hlGestionarMiCuenta" runat="server" NavigateUrl="~/MiCuenta/GestionCuenta.aspx" Visible="False">Gestionar mi Cuenta</asp:HyperLink>
                    </td>
                    <td class="auto-style25">
                        &nbsp;</td>
                    <td class="auto-style12">
                        &nbsp;</td>
                    <td class="auto-style69">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style22">
                        &nbsp;</td>
                    <td class="auto-style67">
                        &nbsp;</td>
                    <td class="auto-style25">
                        <asp:Button ID="btnCerrarsesion" CssClass="myButton" runat="server" Text="Cerrar sesión" OnClick="btnCerrarsesion_Click" />
                    </td>
                    <td class="auto-style12">
                        &nbsp;</td>
                    <td class="auto-style69">&nbsp;</td>
                </tr>
                </table>
        </div>
    </form>
</body>
</html>
