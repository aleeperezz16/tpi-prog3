<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Vistas.FormularioHome" %>

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
            text-align: center;
            height: 49px;
        }

        .auto-style3 {
            height: 26px;
        }

        .auto-style4 {
            width: 179px;
        }

        .auto-style5 {
            height: 26px;
            width: 179px;
        }

        .auto-style6 {
            width: 179px;
            height: 49px;
            text-align: center;
        }

        .auto-style7 {
            height: 49px;
        }

        .auto-style9 {
            text-align: center;
        }

        .auto-style10 {
            height: 25px;
            width: 179px;
        }

        .auto-style11 {
            height: 25px;
        }
        .auto-style12 {
            text-align: center;
            height: 26px;
        }
        .auto-style13 {
            width: 179px;
            height: 30px;
            text-align: center;
        }
        .auto-style14 {
            height: 30px;
        }
        .auto-style15 {
            height: 25px;
            width: 179px;
            text-align: center;
        }
        .auto-style19 {
            width: 179px;
            text-align: left;
            height: 26px;
        }
        .auto-style20 {
            height: 24px;
            width: 179px;
            text-align: center;
        }
        .auto-style21 {
            height: 24px;
        }
        .auto-style22 {
            width: 179px;
            text-align: center;
            height: 26px;
        }
        .auto-style23 {
            width: 179px;
            text-align: left;
            height: 25px;
        }
        .auto-style24 {
            text-align: center;
            height: 25px;
        }
        .auto-style25 {
            width: 179px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:Label ID="lbSecciones" runat="server" Text="▬ Secciones ▬" Font-Bold="True" Font-Italic="True" Font-Size="Large"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Overline="False" Font-Size="XX-Large" Text="Home"></asp:Label>
                    </td>
                    <td class="auto-style7"></td>
                </tr>
                <tr>
                    <td class="auto-style13">
                        <asp:Label ID="lblSeccionarticulos" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Text="▬Artículos▬"></asp:Label>
                    </td>
                    <td class="auto-style14"></td>
                    <td class="auto-style14"></td>
                </tr>
                <tr>
                    <td class="auto-style19">
                        <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Admin/Articulos/ListarArticulos.aspx">Listar Articulos</asp:HyperLink>
                    &nbsp;U</td>
                    <td class="auto-style12">
                        <asp:Label ID="lbBienvenido" runat="server" Text="Bienvenido/a a este software de gestión."></asp:Label>
                    </td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style10">
                        <asp:HyperLink ID="hlAgregararticulos" runat="server" NavigateUrl="~/Admin/Articulos/AgregarArticulo.aspx">Agregar Articulo</asp:HyperLink>
                    </td>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style11"></td>
                </tr>
                <tr>
                    <td class="auto-style20">
                        <asp:Label ID="lblSeccioncategoria" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Text="▬Categoría▬"></asp:Label>
                    </td>
                    <td class="auto-style21">&nbsp;</td>
                    <td class="auto-style21"></td>
                </tr>
                <tr>
                    <td class="auto-style10">
                        <asp:HyperLink ID="hlCategorias" runat="server" NavigateUrl="~/Admin/Categorias/ListarCategoria.aspx">Listar Categoría</asp:HyperLink>
                    &nbsp;U</td>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style11"></td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:HyperLink ID="hlAgregarcategoria" runat="server" NavigateUrl="~/Admin/Categorias/AgregarCategoria.aspx">Agregar Categoría</asp:HyperLink>
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style15">
                        <asp:Label ID="lblSeccionproveedores" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Text="▬Proveedores▬"></asp:Label>
                    </td>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style11"></td>
                </tr>
                <tr>
                    <td class="auto-style19">
                        <asp:HyperLink ID="hlListarproveedores" runat="server" NavigateUrl="~/Admin/Proveedores/ListarProveedores.aspx">Listar Proveedores</asp:HyperLink>
                    &nbsp;</td>
                    <td class="auto-style3"></td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style10">
                        <asp:HyperLink ID="hlAgregarproveedores" runat="server" NavigateUrl="~/Admin/Proveedores/AgregarProveedor.aspx">Agregar Proveedor</asp:HyperLink>
                    </td>
                    <td class="auto-style11">&nbsp;&nbsp;</td>
                    <td class="auto-style11"></td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:HyperLink ID="hlListarpedidos" runat="server" NavigateUrl="~/Admin/Pedidos/ListarPedidos.aspx">Listar Pedidos</asp:HyperLink>
                    </td>
                    <td class="auto-style3"></td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style23">
                        <asp:HyperLink ID="hlAgregarPedido" runat="server" NavigateUrl="~/Admin/Pedidos/AgregarPedido.aspx">Agregar Pedido</asp:HyperLink>
                    </td>
                    <td class="auto-style24">
                        <asp:Button ID="btnCerrarsesion" runat="server" Text="Cerrar sesión" OnClick="btnCerrarsesion_Click" />
                    </td>
                    <td class="auto-style11"></td>
                </tr>
                <tr>
                    <td class="auto-style22">
                        <asp:Label ID="lblSeccionVentas" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Text="▬Ventas▬"></asp:Label>
                    </td>
                    <td class="auto-style12">
                    </td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:HyperLink ID="hlListarventas" runat="server" NavigateUrl="~/Admin/ListarVentas.aspx">Listar Ventas</asp:HyperLink>
                    &nbsp;U</td>
                    <td class="auto-style9">
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:HyperLink ID="hlListarclientes" runat="server" NavigateUrl="~/Admin/ListarClientes.aspx">Listar Clientes</asp:HyperLink>
                    </td>
                    <td class="auto-style12">
                        </td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style22">&nbsp;</td>
                    <td class="auto-style12">
                        </td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style25">&nbsp;</td>
                    <td class="auto-style9">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style9">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
