<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormularioHome.aspx.cs" Inherits="Vistas.FormularioHome" %>

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
        }
        .auto-style7 {
            height: 49px;
        }
        .auto-style8 {
            width: 179px;
            text-align: center;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="lbSecciones" runat="server" Text="▬ Secciones ▬"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:Label ID="lbBienvenido" runat="server" Text="Bienvenido/a a este software de gestión."></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:HyperLink ID="hlArticulos" runat="server" NavigateUrl="~/FormularioArticulos.aspx">Artículos</asp:HyperLink>
                </td>
                <td class="auto-style3">usuario/admin</td>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:HyperLink ID="hlCategorias" runat="server" NavigateUrl="~/FormularioCategorias.aspx">Categorias</asp:HyperLink>
                </td>
                <td>usuario/admin</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:HyperLink ID="hlVentas" runat="server" NavigateUrl="~/FormularioVentas.aspx">Ventas</asp:HyperLink>
                </td>
                <td class="auto-style3">usuario/admin</td>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:HyperLink ID="hlPedidos" runat="server" NavigateUrl="~/FormularioPedidos.aspx">Pedidos</asp:HyperLink>
                </td>
                <td class="auto-style3">admin</td>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td class="auto-style10">
                    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/FormularioProveedores.aspx">Proveedores</asp:HyperLink>
                </td>
                <td class="auto-style11">admin</td>
                <td class="auto-style11"></td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:HyperLink ID="hlClientes" runat="server" NavigateUrl="~/FormularioClientes.aspx">Clientes</asp:HyperLink>
                </td>
                <td class="auto-style3">admin/ usuario, su propio cliente</td>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style3"></td>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style9">
                    <asp:Button ID="btnCerrarsesion" runat="server" Text="Cerrar sesión" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
