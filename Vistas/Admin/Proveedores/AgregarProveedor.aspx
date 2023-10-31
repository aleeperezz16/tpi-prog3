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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Agregar Proveedor</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Nombre:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="tbNombreProveedor" runat="server" Width="259px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvNombreProveedor" runat="server" ControlToValidate="tbNombreProveedor" ErrorMessage="Ingrese Nombre"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Telefono:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="tbTelefono" runat="server" Width="258px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="tbTelefono" ErrorMessage="Ingrese Telefono"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">EMail:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="tbEmail" runat="server" Width="256px"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="tbEmail" ErrorMessage="Ingrese Email"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Direccion:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="tbDireccion" runat="server" CssClass="auto-style4" Width="256px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="tbDireccion" ErrorMessage="Ingrese Direccion"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Provincia:</td>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddlProvincia" runat="server" AutoPostBack="True" Height="16px" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged" Width="114px">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Ciudad:</td>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddlCiudad" runat="server" Height="16px" Width="110px">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" Text="Aceptar" />
                </td>
                <td>
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
