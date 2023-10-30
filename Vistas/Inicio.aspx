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
            width: 212px;
        }

        .auto-style5 {
            height: 26px;
            width: 212px;
        }

        .auto-style6 {
            width: 212px;
            height: 49px;
        }

        .auto-style7 {
            height: 49px;
        }

        .auto-style8 {
            width: 212px;
            text-align: center;
            height: 26px;
        }

        .auto-style9 {
            text-align: center;
        }

        .auto-style10 {
            height: 25px;
            width: 212px;
        }

        .auto-style11 {
            height: 25px;
        }
        .auto-style12 {
            text-align: center;
            height: 26px;
        }
        .auto-style13 {
            width: 212px;
            height: 30px;
            text-align: center;
        }
        .auto-style14 {
            height: 30px;
        }
        .auto-style15 {
            height: 25px;
            width: 212px;
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
                    <td class="auto-style6"></td>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Overline="False" Font-Size="XX-Large" Text="Home"></asp:Label>
                    </td>
                    <td class="auto-style7"></td>
                </tr>
                <tr>
                    <td class="auto-style13">
                        <asp:Label ID="lbSecciones" runat="server" Text="▬ Secciones ▬" Font-Bold="True" Font-Italic="True" Font-Size="Large"></asp:Label>
                    </td>
                    <td class="auto-style14"></td>
                    <td class="auto-style14"></td>
                </tr>
                <tr>
                    <td class="auto-style8">
                        <asp:Label ID="lblSeccionarticulos" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Text="▬Artículos▬"></asp:Label>
                    </td>
                    <td class="auto-style12">
                        <asp:Label ID="lbBienvenido" runat="server" Text="Bienvenido/a a este software de gestión."></asp:Label>
                    </td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Admin/Articulos/ListarArticulos.aspx">Listar Articulos</asp:HyperLink>
                    </td>
                    <td class="auto-style3">usuario/admin</td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:HyperLink ID="hlAgregararticulos" runat="server" NavigateUrl="~/Admin/Articulos/AgregarArticulo.aspx">Agregar Articulos</asp:HyperLink>
                    </td>
                    <td class="auto-style3">usuario/admin</td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style15">
                        <asp:Label ID="lblSeccioncategoria" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Text="▬Categoría▬"></asp:Label>
                    </td>
                    <td class="auto-style11">usuario/admin</td>
                    <td class="auto-style11"></td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:HyperLink ID="hlCategorias" runat="server" NavigateUrl="~/Admin/Categorias/ListarCategoria.aspx">Listar Categorías</asp:HyperLink>
                    </td>
                    <td class="auto-style3">admin</td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style10">
                        <asp:HyperLink ID="hlAgregarcategoria" runat="server" NavigateUrl="~/Admin/Categorias/AgregarCategoria.aspx">Agregar Categoría</asp:HyperLink>
                    </td>
                    <td class="auto-style11">admin</td>
                    <td class="auto-style11"></td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="lblSeccionproveedores" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Text="▬Proveedores▬"></asp:Label>
                    </td>
                    <td class="auto-style3">admin/ usuario, su propio cliente</td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/FormularioProveedores.aspx">Proveedores</asp:HyperLink>
                    </td>
                    <td>&nbsp;&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style3"></td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style9">
                        <asp:Button ID="btnCerrarsesion" runat="server" Text="Cerrar sesión" OnClick="btnCerrarsesion_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:HyperLink ID="hlVentas" runat="server" NavigateUrl="~/FormularioVentas.aspx">Ventas</asp:HyperLink>
                    </td>
                    <td class="auto-style12">
                    </td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:HyperLink ID="hlPedidos" runat="server" NavigateUrl="~/FormularioPedidos.aspx">Pedidos</asp:HyperLink>
                    </td>
                    <td class="auto-style12">
                    </td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:HyperLink ID="hlClientes" runat="server" NavigateUrl="~/FormularioClientes.aspx">Clientes</asp:HyperLink>
                    </td>
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
                <tr>
                    <td class="auto-style4">&nbsp;</td>
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
