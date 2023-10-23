<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormularioProveedores.aspx.cs" Inherits="Vistas.FormularioProveedores" %>

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
        .auto-style3 {
            text-align: center;
        }
        .auto-style5 {
            height: 26px;
            width: 200px;
        }
        .auto-style6 {
            width: 200px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Label ID="lbProveedores" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Proveedores"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/FormularioProveedores.aspx">Volver al menú Principal</asp:HyperLink>
                </td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style2">
                    <asp:Label ID="lbBuscaridproveedor" runat="server" Text="Buscar proveedor por ID:"></asp:Label>
                    <asp:TextBox ID="tbBuscarproveedor" runat="server"></asp:TextBox>
                    <asp:Button ID="btnBuscarproveedoresid" runat="server" Text="Buscar" />
                </td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td>
                    <asp:GridView ID="GridView1" runat="server">
                    </asp:GridView>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style2">
                    <asp:Label ID="lbObservaciones" runat="server" Font-Bold="True" Text="Observación: Las acciones dentro del Gridview serán Editar,Agregar,Eliminar."></asp:Label>
                </td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
