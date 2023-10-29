<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Vistas.FormularioRegistro" %>

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
            height: 26px;
        }

        .auto-style3 {
            text-align: center;
        }

        .auto-style4 {
            height: 26px;
            width: 181px;
        }

        .auto-style5 {
            width: 181px;
        }

        .auto-style8 {
            width: 261px;
            text-align: right;
        }

        .auto-style9 {
            height: 26px;
            width: 261px;
        }

        .auto-style10 {
            width: 261px;
        }

        .auto-style11 {
            width: 261px;
            text-align: right;
            height: 26px;
        }

        .auto-style12 {
            width: 181px;
            height: 29px;
        }

        .auto-style13 {
            width: 261px;
            text-align: right;
            height: 29px;
        }

        .auto-style14 {
            height: 29px;
        }

        .auto-style15 {
            text-align: left;
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style2" colspan="2"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style3" colspan="2">
                        <asp:Label ID="lbMenuregistro" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Menú de Registro"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:HyperLink ID="hlLogin" runat="server" NavigateUrl="~/FormularioLogin.aspx">Volver al Menú de Ingreso</asp:HyperLink>
                    </td>
                    <td class="auto-style9"></td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style2" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Datos Necesarios para el registro de la cuenta:</td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style11">
                        <asp:Label ID="lbNombre" runat="server" Text="Nombres:"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="tbNombres" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style11">
                        <asp:Label ID="lbApellido" runat="server" Text="Apellido:"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="tbApellido" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style11">
                        <asp:Label ID="Label3" runat="server" Text="DNI (Solo números):"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="tbDni" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style12"></td>
                    <td class="auto-style13">
                        <asp:Label ID="lbProvincia" runat="server" Text="Provincia:"></asp:Label>
                    </td>
                    <td class="auto-style14">
                        <asp:DropDownList ID="ddlProvincias" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style14"></td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style8">
                        <asp:Label ID="lbCiudad" runat="server" Text="Ciudad:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlCiudades" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style11">
                        <asp:Label ID="lbDireccion" runat="server" Text="Dirección:"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="tbDireccion" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style8">
                        <asp:Label ID="lbTelefono" runat="server" Text="Teléfono:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbTelefono" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style11">
                        <asp:Label ID="lbEmail" runat="server" Text="Email:"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style11"></td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style15" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Datos para el ingreso del Usuario a la plataforma:</td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style8">
                        <asp:Label ID="lbUsuario" runat="server" Text="Nombre de usuario:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbNombreusuario" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style8">
                        <asp:Label ID="lbContraseña" runat="server" Text="Contraseña:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbContraseña" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td>
                        <asp:Button ID="btnCrear" runat="server" Text="Crear" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
