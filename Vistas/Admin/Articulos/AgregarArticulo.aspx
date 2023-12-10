<%@ Page Language="C#" AutoEventWireup="true" UnobtrusiveValidationMode="None" CodeBehind="AgregarArticulo.aspx.cs" Inherits="Vistas.Admin.Articulos.AgregarArticulo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 29px;
        }
        .auto-style13 {
            width: 220px;
        }
        .auto-style9 {
            width: 29px;
            height: 50px;
        }
        .auto-style15 {
            width: 220px;
            height: 50px;
        }
        .auto-style12 {
            height: 50px;
            text-align: right;
        }
        .auto-style21 {
            margin-left: 0px;
        }
        .auto-style22 {
            width: 29px;
            height: 29px;
        }
        .auto-style24 {
            width: 220px;
            height: 29px;
        }
        .auto-style25 {
            height: 29px;
        }
        .auto-style26 {
            height: 50px;
        }
        .auto-style27 {
            width: 233px;
            height: 50px;
        }
        .auto-style28 {
            width: 233px;
            height: 29px;
        }
        .auto-style29 {
            width: 233px;
        }
        </style>
    <link rel="stylesheet" href="../../StyleSheetG6.css"/>
</head>
<body>
    <form id="form1" class="fontStyle" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td>
                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style26" colspan="2">
                                    <asp:HyperLink ID="hlnkAgregarArt" runat="server" NavigateUrl="~/Inicio.aspx">Volver al menú Principal</asp:HyperLink>
                                </td>
                                <td class="auto-style15">&nbsp;</td>
                                <td class="auto-style12">
                        <asp:Label ID="lblCuentaIngresada" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style9"></td>
                                <td class="auto-style27">
                                    <asp:Label ID="lblAgregarArticulo" CssClass="mainItem" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Agregar Articulo"></asp:Label>
                                </td>
                                <td class="auto-style15"></td>
                                <td class="auto-style12">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style22"></td>
                                <td class="auto-style28">
                                    <asp:Label ID="lblNombreArticulo" CssClass="subItem" runat="server" Text="Nombre:"></asp:Label>
                                </td>
                                <td class="auto-style24">
                                    <asp:TextBox ID="txtNombreArticulo" runat="server" Width="210px"></asp:TextBox>
                                </td>
                                <td class="auto-style25">
                                    <asp:RequiredFieldValidator ID="rfvNombreArticulo" runat="server" ControlToValidate="txtNombreArticulo">Ingrese un nombre</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style22"></td>
                                <td class="auto-style28">
                                    <asp:Label ID="lblCategoria" CssClass="subItem" runat="server" Text="Categoria:"></asp:Label>
                                </td>
                                <td class="auto-style24">
                                    <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="auto-style21">
                                        <asp:ListItem>--Seleccionar--</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style25">
                                    <asp:RequiredFieldValidator ID="rfvCategoria" runat="server" ControlToValidate="ddlCategoria" ErrorMessage="Seleccione una categoria" InitialValue="--Seleccionar--"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                                                        <tr>
                                <td class="auto-style22"></td>
                                <td class="auto-style28">
                                    <asp:Label ID="lblProveedor" CssClass="subItem" runat="server" Text="Proveedor:"></asp:Label>
                                </td>
                                <td class="auto-style24">
                                    <asp:DropDownList ID="ddlProveedor" runat="server" CssClass="auto-style21">
                                        <asp:ListItem>--Seleccionar--</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style25">
                                    <asp:RequiredFieldValidator ID="rfvProveedor" runat="server" ControlToValidate="ddlProveedor" ErrorMessage="Seleccione un proveedor" InitialValue="--Seleccionar--"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">&nbsp;</td>
                                <td class="auto-style29">
                                    <asp:Label ID="lblPrecioVenta" CssClass="subItem" runat="server" Text="Precio de Venta:"></asp:Label>
                                </td>
                                <td class="auto-style13">
                                    <asp:TextBox ID="txtPrecioVenta" runat="server" TextMode="Number"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfvPrecioDeVenta" runat="server" ControlToValidate="txtPrecioDeVenta" ErrorMessage="Ingrese precio de venta"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                                                        <tr>
                                <td class="auto-style2">&nbsp;</td>
                                <td class="auto-style29">
                                    <asp:Label ID="lblPrecioCompra" CssClass="subItem" runat="server" Text="Precio De Compra:"></asp:Label>
                                </td>
                                <td class="auto-style13">
                                    <asp:TextBox ID="txtPrecioCompra" runat="server" TextMode="Number"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfvPrecioDeCompra" runat="server" ControlToValidate="txtPrecioDeCompra" ErrorMessage="Ingrese precio de compra"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                                                        <tr>
                                <td class="auto-style2">&nbsp;</td>
                                <td class="auto-style29">
                                    <asp:Label ID="lblStock" CssClass="subItem" runat="server" Text="Stock:"></asp:Label>
                                </td>
                                <td class="auto-style13">
                                    <asp:TextBox ID="txtStock" runat="server" TextMode="Number"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfvStock" runat="server" ControlToValidate="txtStock" ErrorMessage="Ingrese stock"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">&nbsp;</td>
                                <td class="auto-style29">
                                    &nbsp;</td>
                                <td class="auto-style13">
                                    <asp:Button ID="btnAceptar" class="myButton" runat="server" Text="Aceptar" OnClick="btnAceptar_Click" style="height: 29px" />
                                </td>
                                <td>
                                    <asp:Label ID="lblResultado" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">&nbsp;</td>
                                <td class="auto-style29">
                                    &nbsp;</td>
                                <td class="auto-style13">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style2">&nbsp;</td>
                                <td class="auto-style29">
                                    &nbsp;</td>
                                <td class="auto-style13">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                </table>
        </div>
    </form>
</body>
</html>
