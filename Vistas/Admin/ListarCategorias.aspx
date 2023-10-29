<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarCategorias.aspx.cs" Inherits="Vistas.FormularioCategorias" %>

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
        }

        .auto-style4 {
            width: 200px;
        }

        .auto-style5 {
            width: 200px;
            height: 26px;
        }

        .auto-style6 {
            height: 26px;
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
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:Label ID="lbCategorias" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Categorías"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/FormularioHome.aspx">Volver al menú Principal</asp:HyperLink>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        <asp:Label ID="lbBuscarcategoriaid" runat="server" Text="Buscar categoría por ID:"></asp:Label>
                        <asp:TextBox ID="tbBuscarcategoriaid" runat="server"></asp:TextBox>
                        <asp:Button ID="btnBuscarcategoriasid" runat="server" Text="Buscar" />
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
                    <td>
                        <asp:GridView ID="GridView1" runat="server">
                        </asp:GridView>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        <asp:Label ID="lbObservaciones" runat="server" Font-Bold="True" Text="Observación: Las acciones dentro del Gridview serán Editar,Agregar,Eliminar."></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
