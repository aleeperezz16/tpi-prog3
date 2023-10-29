<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarVentas.aspx.cs" Inherits="Vistas.Admin.ListarVentas" %>

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
            height: 25px;
        }

        .auto-style3 {
            height: 26px;
        }

        .auto-style4 {
            height: 25px;
            text-align: center;
            width: 690px;
        }

        .auto-style5 {
            width: 206px;
        }

        .auto-style6 {
            height: 25px;
            width: 206px;
        }

        .auto-style7 {
            height: 26px;
            width: 206px;
        }

        .auto-style8 {
            width: 690px;
        }

        .auto-style9 {
            height: 26px;
            width: 690px;
        }

        .auto-style10 {
            width: 206px;
            height: 120px;
        }

        .auto-style11 {
            width: 690px;
            height: 120px;
        }

        .auto-style12 {
            height: 120px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6"></td>
                    <td class="auto-style4">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Ventas"></asp:Label>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/FormularioHome.aspx">Volver al menú Principal</asp:HyperLink>
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7"></td>
                    <td class="auto-style9">
                        <asp:Label ID="lbBuscarventasid" runat="server" Text="Buscar venta por ID:"></asp:Label>
                        <asp:TextBox ID="tbBuscarventasid" runat="server"></asp:TextBox>
                        <asp:Button ID="btnBuscarventasid" runat="server" Text="Buscar" />
                    </td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style10"></td>
                    <td class="auto-style11">
                        <asp:DataList ID="dtlVentas" runat="server">
                        </asp:DataList>
                        <asp:SqlDataSource ID="sqldsVentas" runat="server"></asp:SqlDataSource>
                    </td>
                    <td class="auto-style12"></td>
                </tr>
                <tr>
                    <td class="auto-style7"></td>
                    <td class="auto-style9">
                        <asp:Label ID="lbObservaciones1" runat="server" Font-Bold="True" Text="Observación: Solo se buscará por ID."></asp:Label>
                    </td>
                    <td class="auto-style3"></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
