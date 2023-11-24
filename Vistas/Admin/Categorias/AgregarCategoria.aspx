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
        .auto-style8 {
            width: 138px;
        }
        .auto-style10 {
            width: 642px;
            text-align: left;
        }
        .auto-style11 {
            width: 454px;
        }
        .auto-style12 {
            width: 237px;
            height: 39px;
        }
        .auto-style13 {
            width: 642px;
            height: 39px;
        }
        .auto-style14 {
            height: 39px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style12">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Agregar Categoria"></asp:Label>
                </td>
                <td class="auto-style13" colspan="2"></td>
                <td class="auto-style14">
                    <asp:HyperLink ID="hlAgregarcat" runat="server" NavigateUrl="~/Inicio.aspx">Volver al menú Principal</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style4"></td>
                <td class="auto-style7" colspan="2"></td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="lbNombrecat" runat="server" Text="Nombre de la categoría:"></asp:Label>
                </td>
                <td class="auto-style6" colspan="2">
                    <asp:TextBox ID="tbNombre" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="rfvNombreCategoria" runat="server" ControlToValidate="tbNombre" ForeColor="#FF3300">Ingrese un nombre de Categoria</asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="lbDescripcioncat" runat="server" Text="Descripción:"></asp:Label>
                </td>
                <td class="auto-style10" colspan="2">
                    <asp:TextBox ID="tbDescripcion" runat="server" Height="146px" Width="626px"></asp:TextBox>
                </td>
                <td>(Opcional)</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style8">
                    <asp:Button ID="btnAgregarcat" runat="server" Text="Agregar" OnClick="btnAgregarcat_Click" />
                </td>
                <td class="auto-style11">
                    <asp:Label ID="lblResultado" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6" colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6" colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4"></td>
                <td class="auto-style7" colspan="2"></td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6" colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
