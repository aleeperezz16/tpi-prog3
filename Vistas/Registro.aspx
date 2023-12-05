<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Vistas.Registro" %>

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
            width: 156px;
        }

        .auto-style5 {
            width: 156px;
        }

        .auto-style8 {
            width: 261px;
            text-align: right;
        }

        .auto-style9 {
            height: 26px;
            width: 261px;
        }

        .auto-style11 {
            width: 261px;
            text-align: right;
            height: 26px;
        }

        .auto-style12 {
            width: 156px;
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
        .auto-style16 {
            width: 156px;
            height: 34px;
        }
        .auto-style17 {
            width: 261px;
            text-align: right;
            height: 34px;
        }
        .auto-style18 {
            height: 34px;
        }
    </style>
     <link rel="stylesheet" href="StyleSheetG6.css"/>
</head>
<body>
    <form id="form1" class="fontStyle" runat="server">
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
                        <asp:Label ID="lbMenuregistro" CssClass="mainItem" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Menú de Registro"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:HyperLink ID="hlLogin" runat="server" NavigateUrl="~/Login.aspx">Volver al Menú de Ingreso</asp:HyperLink>
                    </td>
                    <td class="auto-style9"></td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style2 mainItem" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Datos Necesarios para el registro de la cuenta:</td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style11">
                        <asp:Label ID="lbNombre" CssClass="subItem" runat="server" Text="Nombres:"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="tbNombres" runat="server"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="rfvNombres" runat="server" ControlToValidate="tbNombres" ForeColor="Red" ValidationGroup="1">*Debe ingresar su/s Nombre/s</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style11">
                        <asp:Label ID="lbApellido" CssClass="subItem" runat="server" Text="Apellido:"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="tbApellido" runat="server"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="rfvApellidos" runat="server" ControlToValidate="tbApellido" ForeColor="#FF3300" ValidationGroup="1">*Debe ingresar su/s Apellido/s</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style11">
                        <asp:Label ID="Label3" CssClass="subItem" runat="server" Text="DNI (Solo números):"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="tbDni" runat="server"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="tbDni" ForeColor="#FF3300">*Debe ingresar su DNI</asp:RequiredFieldValidator>
&nbsp;
                        <asp:RegularExpressionValidator ID="revDNI" runat="server" ControlToValidate="tbDni" ForeColor="#FF3300" ValidationExpression="^\d+$" ValidationGroup="1">*Solo se aceptan números</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style12"></td>
                    <td class="auto-style13">
                        <asp:Label ID="lbProvincia" CssClass="subItem" runat="server" Text="Provincia:"></asp:Label>
                    </td>
                    <td class="auto-style14">
                        <asp:DropDownList ID="ddlProvincias" runat="server" AppendDataBoundItems="True" CausesValidation="True" DataTextField="-- Seleccionar --" DataValueField="0">
                            <asp:ListItem Value="0">-- Seleccionar --</asp:ListItem>
                        </asp:DropDownList>
                    &nbsp;<asp:RequiredFieldValidator ID="rfvddlProvincias" runat="server" ControlToValidate="ddlProvincias" ForeColor="#FF3300" InitialValue="0" ValidationGroup="1">*Debe seleccionar una Provincia</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style14"></td>
                </tr>
                <tr>
                    <td class="auto-style12"></td>
                    <td class="auto-style13">
                        <asp:Label ID="lbCiudad" CssClass="subItem" runat="server" Text="Ciudad:"></asp:Label>
                    </td>
                    <td class="auto-style14">
                        <asp:DropDownList ID="ddlCiudades" runat="server" AppendDataBoundItems="True" DataTextField="-- Seleccionar --" DataValueField="0">
                            <asp:ListItem Selected="True" Value="0">-- Seleccionar --</asp:ListItem>
                        </asp:DropDownList>
                    &nbsp;<asp:RequiredFieldValidator ID="rfvddlCiudades" runat="server" ControlToValidate="ddlCiudades" ForeColor="#FF3300" InitialValue="0" ValidationGroup="1"> *Debe Seleccionar una Ciudad</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style14"></td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style11">
                        <asp:Label ID="lbDireccion" CssClass="subItem" runat="server" Text="Dirección:"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="tbDireccion" runat="server"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="tbDireccion" ForeColor="#FF3300" ValidationGroup="1">*Debe ingresar una Dirección</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style8">
                        <asp:Label ID="lbTelefono" CssClass="subItem" runat="server" Text="Teléfono:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbTelefono" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="tbTelefono" ForeColor="#FF3300">*Debe Seleccionar un Telefono</asp:RequiredFieldValidator>
&nbsp;
                        <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="tbTelefono" ForeColor="#FF3300" ValidationExpression="^\d+$" ValidationGroup="1">*Solo se aceptan números</asp:RegularExpressionValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style11">
                        <asp:Label ID="lbEmail" CssClass="subItem" runat="server" Text="Email:"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="tbEmail" ForeColor="#FF3300" ValidationGroup="1">*Debe ingresar un Email</asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="tbEmail" ForeColor="#FF3300" ValidationExpression="^[^@]+@[^@]+\.[a-zA-Z]{2,}$" ValidationGroup="1">*Debe ingresar una sintaxis de Email válida</asp:RegularExpressionValidator>
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
                    <td class="auto-style15 mainItem" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Datos para el ingreso del Usuario a la plataforma:</td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style12"></td>
                    <td class="auto-style13">
                        <asp:Label ID="lbUsuario" CssClass="subItem" runat="server" Text="Nombre de usuario:"></asp:Label>
                    </td>
                    <td class="auto-style14">
                        <asp:TextBox ID="tbNombreusuario" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombreUsuario" runat="server" ControlToValidate="tbNombreusuario" ForeColor="#FF3300" ValidationGroup="1">*Debe Ingresar un Nombre de usuario</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style14"></td>
                </tr>
                <tr>
                    <td class="auto-style16"></td>
                    <td class="auto-style17">
                        <asp:Label ID="lbContraseña" CssClass="subItem" runat="server" Text="Contraseña:"></asp:Label>
                    </td>
                    <td class="auto-style18">
                        <asp:TextBox ID="tbContraseña" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvContraseña" runat="server" ControlToValidate="tbContraseña" ForeColor="#FF3300" ValidationGroup="1">*Debe completar su contraseña</asp:RequiredFieldValidator>
&nbsp;<asp:CompareValidator ID="cvContraseñas" runat="server" ControlToCompare="tbRepetirContraseña" ControlToValidate="tbContraseña" ForeColor="#FF3300" ValidationGroup="1">*Las contraseñas deben coincidir</asp:CompareValidator>
                    </td>
                    <td class="auto-style18"></td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style8">
                        <asp:Label ID="lbContraseña0" CssClass="subItem" runat="server" Text="Repetir Contraseña:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbRepetirContraseña" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvRepetirContraseña" CssClass="subItem" runat="server" ControlToValidate="tbRepetirContraseña" ErrorMessage="RequiredFieldValidator" ForeColor="#FF3300" ValidationGroup="1">*Debe volver a repetir su contraseña</asp:RequiredFieldValidator>
&nbsp;
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td>
                        <asp:Button ID="btnCrear" CssClass="myButton" runat="server" Text="Crear" OnClick="btnCrear_Click" ValidationGroup="1" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
