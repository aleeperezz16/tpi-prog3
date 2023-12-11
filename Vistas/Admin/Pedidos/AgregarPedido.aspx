<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarPedido.aspx.cs" Inherits="Vistas.Admin.Pedidos.AgregarPedido" %>

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
            height: 48px;
            font-weight: bold;
            font-size: x-large;
            color: #FFFAF0;
            background-color: #DC143C;
        }
        .auto-style5 {
            height: 26px;
        }
        .auto-style7 {
            height: 48px;
        }
        .auto-style8 {
            text-align: center;
        }
        .auto-style9 {
            text-align: left;
        }
        .auto-style11 {
            height: 64px;
        }
        .auto-style12 {
            height: 64px;
            width: 580px;
            text-align: center;
        }
        .auto-style14 {
            height: 40px;
        }
        .auto-style15 {
            height: 24px;
        }
        .auto-style16 {
            height: 42px;
        }
        .auto-style17 {
            width: 48px;
        }
        .auto-style18 {
            height: 48px;
            width: 48px;
        }
        .auto-style19 {
            height: 24px;
            width: 48px;
        }
        .auto-style20 {
            height: 64px;
            width: 48px;
        }
        .auto-style21 {
            height: 26px;
            width: 48px;
        }
        .auto-style22 {
            height: 26px;
            text-align: right;
        }
        .auto-style23 {
            text-align: right;
        }
        .auto-style24 {
            width: 48px;
            height: 27px;
        }
        .auto-style25 {
            height: 27px;
        }
    </style>
     <link rel="stylesheet" href="../../StyleSheetG6.css"/>
</head>
<body>
    <form id="form1" class="fontStyle" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style9">
                    <asp:HyperLink ID="hlVolverInicio" runat="server" NavigateUrl="~/Inicio.aspx">Volver al Menú Principal</asp:HyperLink>
                </td>
                <td class="auto-style23">
                    <asp:Label ID="lblCuentaIngresada" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style18">
                    &nbsp;</td>
                <td class="auto-style2" colspan="2">
                    Agregar Pedido</td>
                <td class="auto-style7"></td>
            </tr>
            <tr>
                <td class="auto-style19"></td>
                <td class="auto-style15" colspan="2"></td>
                <td class="auto-style15"></td>
            </tr>
            <tr>
                <td class="auto-style20" rowspan="2"></td>
                <td class="auto-style12" rowspan="2">
                    <span class="auto-style23">Buscar artículo por id:</span><asp:TextBox ID="txtIdArticulo" runat="server" ValidationGroup="1" TextMode="Number"></asp:TextBox>
                    <br />
                    <asp:Button ID="btnBuscar" CssClass="myButton" runat="server" OnClick="btnBuscar_Click" Text="Buscar" ValidationGroup="1" />
                    &nbsp;&nbsp;&nbsp;
                    </td>
                <td class="auto-style16">
                    &nbsp;</td>
                <td class="auto-style11" rowspan="2"></td>
            </tr>
            <tr>
                <td class="auto-style14">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtIdArticulo" ErrorMessage="RegularExpressionValidator" ForeColor="#FF3300" ValidationExpression="^\d+$" ValidationGroup="1">*Solo debe ingresar Números</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style9" colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style8" colspan="2">
                    <asp:GridView ID="gvAgregarPedido" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="gvAgregarPedido_RowCommand" PageSize="5" OnPageIndexChanging="gvAgregarPedido_PageIndexChanging">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="IDArticulo" HeaderText="Id" />
                            <asp:BoundField DataField="NombreArticulo" HeaderText="Articulo" />
                            <asp:BoundField DataField="NombreCategoria" HeaderText="Categoria" />
                            <asp:BoundField DataField="NombreProveedor" HeaderText="Proveedor" />
                            <asp:BoundField DataField="PrecioDeCompra" DataFormatString="{0:c}" HeaderText="Precio" />
                            <asp:TemplateField HeaderText="Cantidad">
                                <ItemTemplate>
                                    <asp:TextBox ID="txt_it_Cantidad" runat="server" TextMode="Number"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:ButtonField ButtonType="Button" CommandName="EventoAgregar" Text="Comprar" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style21"></td>
                <td class="auto-style22" colspan="2">
                    &nbsp;</td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style24"></td>
                <td colspan="2" class="auto-style25"></td>
                <td class="auto-style25"></td>
            </tr>
            <tr>
                <td class="auto-style21"></td>
                <td class="auto-style5" colspan="2">&nbsp;</td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
