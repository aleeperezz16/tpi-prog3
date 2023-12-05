<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Vistas.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style3 {
            height: 26px;
        }

        .auto-style4 {
            width: 179px;
        }

        .auto-style9 {
            text-align: center;
        }

        .auto-style10 {
            width: 179px;
            height: 23px;
        }
        .auto-style11 {
            height: 23px;
        }

    </style>
        <link rel="stylesheet" href="StyleSheetG6.css"/>
</head>
<body>
    <form id="form1" class="fontStyle" runat="server">
        <div>
            <table id="tablaAdmin" class="auto-style1">
                <tr>
                    <td class="auto-style9">
                        <asp:Label ID="lbSecciones"  CssClass="subItem" runat="server" Text="▬ Secciones ▬" Font-Bold="True" Font-Italic="True" Font-Size="Large"></asp:Label>
                    </td>
                    <td class="auto-style9">
                        <asp:Label ID="lblTitulo"  CssClass="mainItem" runat="server" Font-Bold="True" Font-Overline="False" Font-Size="XX-Large" Text="Home" ForeColor="White"></asp:Label>
                    </td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:Label ID="lblSeccionarticulos"  CssClass="subItem" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Text="▬Artículos▬"></asp:Label>
                    </td>
                    <td class="auto-style9"></td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Admin/Articulos/ListarArticulos.aspx">Listar Articulos</asp:HyperLink>
                        &nbsp;</td>
                    <td class="auto-style9">
                        <asp:Label ID="lbBienvenido" runat="server" Text="¡Bienvenido/a a la seccion administrativa!"></asp:Label>
                    </td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:HyperLink ID="hlAgregararticulos" runat="server" NavigateUrl="~/Admin/Articulos/AgregarArticulo.aspx">Agregar Articulo</asp:HyperLink>
                    </td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:Label ID="lblSeccioncategoria" CssClass="subItem" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Text="▬Categoría▬"></asp:Label>
                    </td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:HyperLink ID="hlCategorias" runat="server" NavigateUrl="~/Admin/Categorias/ListarCategoria.aspx">Listar Categoría</asp:HyperLink>
                        &nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:HyperLink ID="hlAgregarcategoria" runat="server" NavigateUrl="~/Admin/Categorias/AgregarCategoria.aspx">Agregar Categoría</asp:HyperLink>
                    </td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:Label ID="lblSeccionproveedores"  CssClass="subItem" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Text="▬Proveedores▬"></asp:Label>
                    </td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:HyperLink ID="hlListarproveedores" runat="server" NavigateUrl="~/Admin/Proveedores/ListarProveedores.aspx">Listar Proveedores</asp:HyperLink>
                    &nbsp;</td>
                    <td class="auto-style9"></td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:HyperLink ID="hlAgregarproveedores" runat="server" NavigateUrl="~/Admin/Proveedores/AgregarProveedor.aspx">Agregar Proveedor</asp:HyperLink>
                    </td>
                    <td class="auto-style9">&nbsp;&nbsp;</td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblSeccionpedidos"  CssClass="subItem" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Text="▬Pedidos▬"></asp:Label>
                        &nbsp;</td>
                    <td class="auto-style9"></td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:HyperLink ID="hlListarpedidos" runat="server" NavigateUrl="~/Admin/Pedidos/ListarPedidos.aspx">Listar Pedidos</asp:HyperLink>
                    </td>
                    <td class="auto-style9">
                        <asp:Button ID="btnCerrarsesion" CssClass="myButton" runat="server" Text="Cerrar sesión" OnClick="btnCerrarsesion_Click" />
                    </td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:HyperLink ID="hlAgregarPedido" runat="server" NavigateUrl="~/Admin/Pedidos/AgregarPedido.aspx">Agregar Pedido</asp:HyperLink>
                    </td>
                    <td class="auto-style9">
                    </td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:Label ID="lblSeccionVentas"  CssClass="subItem" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Text="▬Ventas▬"></asp:Label>
                    </td>
                    <td class="auto-style9">
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:HyperLink ID="hlListarventas" runat="server" NavigateUrl="~/Admin/Ventas/ListarVentas.aspx">Listar Ventas</asp:HyperLink>
                        &nbsp;</td>
                    <td class="auto-style9">
                        </td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:HyperLink ID="hlListarclientes" runat="server" NavigateUrl="~/Admin/Clientes/ListarClientes.aspx">Listar Clientes</asp:HyperLink>
                    </td>
                    <td class="auto-style12">
                        </td>
                    <td class="auto-style3"></td>
                </tr>
                </table>
        </div>
    </form>
</body>
</html>
