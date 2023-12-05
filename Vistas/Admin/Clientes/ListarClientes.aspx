<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarClientes.aspx.cs" Inherits="Vistas.Admin.Clientes.ListarClientes" %>

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
            text-align: center;
            height: 49px;
        }

        .auto-style3 {
            height: 49px;
        }

        .auto-style4 {
            width: 193px;
        }

        .auto-style5 {
            height: 49px;
            width: 193px;
        }

        .auto-style6 {
            width: 193px;
            height: 27px;
        }

        .auto-style7 {
            height: 27px;
        }
    </style>
     <link rel="stylesheet" href="../../StyleSheetG6.css"/>
</head>
<body>
    <form id="form1" class="fontStyle" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5"></td>
                    <td class="auto-style2">
                        <asp:Label ID="lblClientes" CssClass="mainItem" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Clientes"></asp:Label>
                    </td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/Inicio.aspx" Width="105%">Volver al menú Principal</asp:HyperLink>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        <asp:Label ID="Label2" CssClass="subItem" runat="server" Text="Buscar  cliente por DNI:"></asp:Label>
                        <asp:TextBox ID="lblBuscarClientePorId" runat="server"></asp:TextBox>
                        <asp:Button ID="btnBuscarClientePorId" CssClass="myButton" runat="server" Text="Buscar" OnClick="btnBuscarClientePorId_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        <asp:GridView ID="gdvClientes" runat="server" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="gdvClientes_PageIndexChanging" OnRowCancelingEdit="gdvClientes_RowCancelingEdit" OnRowDataBound="gdvClientes_RowDataBound" OnRowDeleting="gdvClientes_RowDeleting" OnRowEditing="gdvClientes_RowEditing" OnRowUpdating="gdvClientes_RowUpdating">
                            <Columns>
                                <asp:TemplateField HeaderText="DNI">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_DNI" runat="server" Text='<%# Bind("DNI") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_DNI" runat="server" Text='<%# Bind("DNI") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Apellido">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Apellido" runat="server" Text='<%# Bind("Apellido") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Apellido" runat="server" Text='<%# Bind("Apellido") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Nombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Nombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Alias">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Alias" runat="server" Text='<%# Bind("Alias") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Alias" runat="server" Text='<%# Bind("Alias") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Contraseña">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Contrasenia" runat="server" Text='<%# Bind("Contrasenia") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Contrasenia" runat="server" Text='<%# Bind("Contrasenia") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Teléfono">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Telefono" runat="server" Text='<%# Bind("Telefono") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_telefono" runat="server" Text='<%# Bind("Telefono") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EMail">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_EMail" runat="server" Text='<%# Bind("EMail") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_email" runat="server" Text='<%# Bind("EMail") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Dirección">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Direccion" runat="server" Text='<%# Bind("Direccion") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_direccion" runat="server" Text='<%# Bind("Direccion") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Código de Ciudad">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddl_eit_Ciudad" runat="server">
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_codigoCiudad" runat="server" Text='<%# Bind("Ciudad") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Estado">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="chkBoxEditEstado" runat="server" Checked='<%# Bind("Estado") %>' Enabled="false" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Estado") %>' Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6"></td>
                    <td class="auto-style7">
                        <asp:Label ID="lbObservaciones1" runat="server" Font-Bold="True" Text="Observación: Solo se buscará por ID."></asp:Label>
                    </td>
                    <td class="auto-style7"></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
