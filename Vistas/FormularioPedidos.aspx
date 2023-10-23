<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormularioPedidos.aspx.cs" Inherits="Vistas.FormularioPedidos" %>

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
            height: 26px;
            text-align: center;
        }
        .auto-style4 {
            width: 220px;
        }
        .auto-style5 {
            height: 26px;
            width: 220px;
        }
        .auto-style6 {
            width: 220px;
            height: 120px;
        }
        .auto-style7 {
            height: 120px;
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
                <td class="auto-style5"></td>
                <td class="auto-style3">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="XX-Large" Text="Pedidos"></asp:Label>
                </td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/FormularioHome.aspx">Volver al menú Principal</asp:HyperLink>
                </td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:Label ID="lbBuscarpedidosid" runat="server" Text="Buscar pedidos por ID:"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:Button ID="btnBuscarpedidosid" runat="server" Text="Buscar" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6"></td>
                <td class="auto-style7">
                    <asp:DataList ID="dtlPedidos" runat="server">
                    </asp:DataList>
                    <asp:SqlDataSource ID="sqldsPedidos" runat="server"></asp:SqlDataSource>
                </td>
                <td class="auto-style7"></td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style2">
                    <asp:Label ID="lbObservaciones1" runat="server" Font-Bold="True" Text="Observación: Solo se buscará por ID."></asp:Label>
                </td>
                <td class="auto-style2"></td>
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
