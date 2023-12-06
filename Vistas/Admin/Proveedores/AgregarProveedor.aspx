<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarProveedor.aspx.cs" Inherits="Vistas.Admin.Proveedores.AgregarProveedor" %>

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
            width: 161px;
            text-align: center;
            height: 48px;
            font-weight: bold;
            font-size: x-large;
            color: #FFFAF0;
            background-color: #DC143C;
        }
        .auto-style3 {
            width: 281px;
        }
        .auto-style4 {
            margin-right: 3px;
        }
        .auto-style5 {
            width: 161px;
            height: 26px;
        }
        .auto-style6 {
            width: 281px;
            height: 26px;
        }
        .auto-style7 {
            height: 26px;
        }
        .auto-style8 {
            text-align: right;
            height: 26px;
        }
        .auto-style9 {
            width: 161px;
            height: 26px;
            color: #FF0000;
        }
    </style>
    <link rel="stylesheet" href="../../StyleSheetG6.css"/>
</head>
<body>
    <form id="form1" class="fontStyle" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Agregar Proveedor</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style6"></td>
                <td class="auto-style8">
                    <asp:HyperLink ID="hlVolverInicio" runat="server" NavigateUrl="~/Inicio.aspx">Volver al Menú Principal</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">Nombre:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtNombreProveedor" runat="server" Width="259px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvNombreProveedor" runat="server" ControlToValidate="txtNombreProveedor" ErrorMessage="Ingrese Nombre"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">Telefono:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtTelefono" runat="server" Width="258px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Ingrese Telefono"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">EMail:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtEmail" runat="server" Width="256px"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Ingrese Email"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">Direccion:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtDireccion" runat="server" CssClass="auto-style4" Width="256px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Ingrese Direccion"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">Provincia:</td>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddlProvincia" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged" Width="180px" AppendDataBoundItems="True">
                        <asp:ListItem>--Seleccionar--</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlProvincia" InitialValue="--Seleccionar--">Seleccione una provincia</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">Ciudad:</td>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddlCiudad" runat="server" Width="180px">
                        <asp:ListItem>--Seleccione una provincia--</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlCiudad" InitialValue="--Seleccione una provincia--">Seleccione una ciudad</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Button ID="btnAgregar" CssClass="myButton" runat="server" OnClick="btnAgregar_Click" Text="Aceptar" />
                </td>
                <td>
                    <asp:Label ID="lblNotificacion" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
