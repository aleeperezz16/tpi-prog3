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
        .auto-style3 {
            width: 214px;
        }
        .auto-style13 {
            width: 220px;
        }
        .auto-style9 {
            width: 29px;
            height: 50px;
        }
        .auto-style10 {
            width: 214px;
            height: 50px;
            font-weight: bold;
            font-size: x-large;
            color: #FFFAF0;
            background-color: #DC143C;
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
            width: 214px;
            height: 29px;
            color: #DC143C;
        }
        .auto-style27 {
            width: 214px;
            color: #DC143C;
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
                                <td class="auto-style9"></td>
                                <td class="auto-style10">
                                    Agregar Articulo</td>
                                <td class="auto-style15"></td>
                                <td class="auto-style12">
                                    <asp:HyperLink ID="hlAgregarArt" runat="server" NavigateUrl="~/Inicio.aspx">Volver al menú Principal</asp:HyperLink>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style22"></td>
                                <td class="auto-style26">
                                    Nombre:</td>
                                <td class="auto-style24">
                                    <asp:TextBox ID="txtNombreArticulo" runat="server" Width="210px"></asp:TextBox>
                                </td>
                                <td class="auto-style25">
                                    <asp:RequiredFieldValidator ID="rfvNombreArticulo" runat="server" ControlToValidate="txtNombreArticulo">Ingrese un nombre</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style22"></td>
                                <td class="auto-style26">
                                    Categoria:</td>
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
                                <td class="auto-style26">
                                    Proveedor:</td>
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
                                <td class="auto-style27">
                                    Precio de Venta:</td>
                                <td class="auto-style13">
                                    <asp:TextBox ID="txtPrecioVenta" runat="server" TextMode="Number"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfvPrecioDeVenta" runat="server" ControlToValidate="txtPrecioDeVenta" ErrorMessage="Ingrese precio de venta"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                                                        <tr>
                                <td class="auto-style2">&nbsp;</td>
                                <td class="auto-style27">
                                    Precio de Compra:</td>
                                <td class="auto-style13">
                                    <asp:TextBox ID="txtPrecioCompra" runat="server" TextMode="Number"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfvPrecioDeCompra" runat="server" ControlToValidate="txtPrecioDeCompra" ErrorMessage="Ingrese precio de compra"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                                                        <tr>
                                <td class="auto-style2">&nbsp;</td>
                                <td class="auto-style27">
                                    Stock:</td>
                                <td class="auto-style13">
                                    <asp:TextBox ID="txtStock" runat="server" TextMode="Number"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfvStock" runat="server" ControlToValidate="txtStock" ErrorMessage="Ingrese stock"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">&nbsp;</td>
                                <td class="auto-style3">
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
                                <td class="auto-style3">
                                    &nbsp;</td>
                                <td class="auto-style13">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style2">&nbsp;</td>
                                <td class="auto-style3">
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
