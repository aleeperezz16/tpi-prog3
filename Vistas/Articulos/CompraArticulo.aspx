<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompraArticulo.aspx.cs" Inherits="Vistas.Articulos.CompraArticulo" %>

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
            width: 206px;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            width: 577px;
        }
        .auto-style5 {
            height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:HyperLink ID="hlInicio" runat="server" NavigateUrl="~/InicioClientes.aspx">Volver al Menú Principal</asp:HyperLink>
                </td>
                <td class="auto-style3" colspan="2">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Artículos"></asp:Label>
                </td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3" colspan="2">
                    <asp:Label ID="lblVer" runat="server" Text="Ver/Buscar/Comprar/Filtrar"></asp:Label>
                </td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" rowspan="2">&nbsp;</td>
                <td class="auto-style4" rowspan="2">
                    <asp:Label ID="lblBuscarxID" runat="server" Text="Buscar Artículos por ID:"></asp:Label>
                    <asp:TextBox ID="tbBuscarxID" runat="server" ValidationGroup="1"></asp:TextBox>
                    <asp:Button ID="btnBuscarxID" runat="server" Text="Buscar" ValidationGroup="1" />
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Vista Principal" Width="132px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvBuscarxID" runat="server" ControlToValidate="tbBuscarxID" Font-Bold="False" ForeColor="#FF3300" ValidationGroup="1">*Por favor, ingrese algun valor ID numerico</asp:RequiredFieldValidator>
                </td>
                <td rowspan="2">&nbsp;</td>
                <td rowspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:RegularExpressionValidator ID="revBuscarxID" runat="server" ControlToValidate="tbBuscarxID" ForeColor="#FF3300" ValidationExpression="^\d+$" ValidationGroup="1">*Solo se deben ingresar números</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td colspan="2">
                    <asp:Label ID="lblFiltrarxCategoria" runat="server" Text="Filtrar por Categoria:"></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td colspan="2">
                    <asp:GridView ID="GridView1" runat="server">
                    </asp:GridView>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
