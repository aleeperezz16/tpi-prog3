<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarCategoria.aspx.cs" Inherits="Vistas.Admin.Categorias.AgregarCategoria" %>

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
            width: 237px;
        }
        .auto-style4 {
            height: 26px;
            width: 237px;
        }
        .auto-style5 {
            width: 237px;
            text-align: right;
        }
        .auto-style6 {
            width: 642px;
        }
        .auto-style7 {
            height: 26px;
            width: 642px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Agregar Categoria"></asp:Label>
                </td>
                <td class="auto-style6">&nbsp;</td>
                <td>
                    <asp:HyperLink ID="hlAgregarcat" runat="server">Volver al menu Principal</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style4"></td>
                <td class="auto-style7"></td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="lbNombrecat" runat="server" Text="Nombre de la categoría:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="tbNombre" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="lbDescripcioncat" runat="server" Text="Descripción:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="tbDescripcion" runat="server" Height="146px" Width="540px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Button ID="btnAgregarcat" runat="server" Text="Agregar" OnClick="btnAgregarcat_Click" />
                    <asp:Label ID="lblResultado" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
