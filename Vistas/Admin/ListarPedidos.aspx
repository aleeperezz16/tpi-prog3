<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarPedidos.aspx.cs" Inherits="Vistas.Admin.ListarPedidos" %>

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
        .auto-style5 {
            height: 26px;
            width: 692px;
        }
        .auto-style6 {
            width: 692px;
        }
        .auto-style7 {
            width: 692px;
            text-align: center;
        }
        .auto-style8 {
            height: 26px;
            width: 270px;
        }
        .auto-style9 {
            width: 270px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style5"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:HyperLink ID="hlVolverinicio" runat="server" BorderStyle="None" NavigateUrl="~/Inicio.aspx">Volver al Menú Principal</asp:HyperLink>
                    </td>
                    <td class="auto-style7">
                        <asp:Label ID="lbListarpedidos" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Listar Pedidos"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8"></td>
                    <td class="auto-style5">
                        <asp:Label ID="lbBuscarpedidosID" runat="server" Text="Buscar  cliente por ID:"></asp:Label>
                        <asp:TextBox ID="lblBuscarPedidoPorId" runat="server"></asp:TextBox>
                        <asp:Button ID="btnBuscarPedidoPorId" runat="server" Text="Buscar" />
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style6">
                        <asp:Label ID="lbObservaciones1" runat="server" Font-Bold="True" Text="Observación: Solo se buscará por ID."></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
