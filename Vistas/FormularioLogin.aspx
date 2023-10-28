<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormularioLogin.aspx.cs" Inherits="Vistas.FormularioLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            height: 26px;
        }
        .auto-style4 {
            text-align: center;
        }
        .auto-style5 {
            width: 42px;
        }
        .auto-style6 {
            height: 26px;
            width: 42px;
        }
        .auto-style7 {
            width: 42px;
            height: 29px;
        }
        .auto-style8 {
            text-align: right;
            height: 29px;
        }
        .auto-style9 {
            height: 29px;
        }
        .auto-style10 {
            height: 26px;
            text-align: center;
        }
        .auto-style11 {
            height: 26px;
            margin-left: 80px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style4" colspan="2">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Software de Sistema de Gestión"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6"></td>
                    <td class="auto-style10" colspan="2">
                        <asp:Label ID="lbGrupo6" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Grupo 6"></asp:Label>
                    </td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style3"></td>
                    <td class="auto-style3"></td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style8">
                        <asp:Label ID="lbUsuario" runat="server" Text="Usuario:"></asp:Label>
                    </td>
                    <td class="auto-style9">
                        <asp:TextBox ID="tbUserName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="tbUserName" ErrorMessage="Ingrese usuario"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style7"></td>
                    <td class="auto-style8">
                        <asp:Label ID="lbContraseña" runat="server" Text="Contraseña"></asp:Label>
                    </td>
                    <td class="auto-style9">
                        <asp:TextBox ID="tbUserPssw" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvUserPssw" runat="server" ControlToValidate="tbUserPssw" ErrorMessage="Ingrese Contraseña"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style6"></td>
                    <td class="auto-style3"></td>
                    <td class="auto-style11">
                        <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" OnClick="btnIngresar_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblErrorLogeo" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:LinkButton ID="lkbRegistrarse" runat="server">No tenes cuenta? Registrate!</asp:LinkButton>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
