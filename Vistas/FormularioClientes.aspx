<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormularioClientes.aspx.cs" Inherits="Vistas.FormularioClientes" %>

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
            height: 49px;
        }
        .auto-style4 {
            width: 193px;
        }
        .auto-style5 {
            height: 49px;
            width: 193px;
        }
        .auto-style6 {
            width: 193px;
            height: 27px;
        }
        .auto-style7 {
            height: 27px;
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
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Clientes"></asp:Label>
                </td>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/FormularioHome.aspx">Volver al menú Principal</asp:HyperLink>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Buscar  cliente por ID:"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:Button ID="btnBuscarclientesid" runat="server" Text="Buscar" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:DataList ID="dtlBuscarclientes" runat="server">
                    </asp:DataList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:SqlDataSource ID="sqldsBuscarclientes" runat="server"></asp:SqlDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6"></td>
                <td class="auto-style7">
                    <asp:Label ID="lbObservaciones1" runat="server" Font-Bold="True" Text="Observación: Solo se buscará por ID."></asp:Label>
                </td>
                <td class="auto-style7"></td>
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
