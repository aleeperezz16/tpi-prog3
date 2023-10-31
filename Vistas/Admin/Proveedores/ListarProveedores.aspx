﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarProveedores.aspx.cs" Inherits="Vistas.Admin.Proveedores.ListarProveedores" %>

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
            font-size: xx-large;
        }
        .auto-style3 {
            font-size: x-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table class="auto-style1">
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2"><strong>Proveedores</strong></td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style3"><strong>Filtros de Búsqueda</strong></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td rowspan="8">
                        <asp:GridView ID="gvProveedores" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="IDProveedor" ForeColor="Black" GridLines="Vertical" AutoGenerateEditButton="True" OnPageIndexChanging="gvProveedores_PageIndexChanging" OnRowCancelingEdit="gvProveedores_RowCancelingEdit" OnRowDeleting="gvProveedores_RowDeleting" OnRowEditing="gvProveedores_RowEditing" OnRowUpdating="gvProveedores_RowUpdating" AutoGenerateDeleteButton="True">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="IDProveedor">
                                    <EditItemTemplate>
                                        <asp:Label ID="lblEditId" runat="server" Text='<%# Bind("IDProveedor") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblItemId" runat="server" Text='<%# Bind("IDProveedor") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre" SortExpression="NombreProveedor">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditNombre" runat="server" Text='<%# Bind("NombreProveedor") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("NombreProveedor") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Telefono" SortExpression="Telefono">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditTelefono" runat="server" Text='<%# Bind("Telefono") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Telefono") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email" SortExpression="EMail">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditEmail" runat="server" Text='<%# Bind("EMail") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("EMail") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Direccion" SortExpression="Direccion">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditDireccion" runat="server" Text='<%# Bind("Direccion") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Direccion") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ciudad" SortExpression="NombreCiudad">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddlEditCiudad" runat="server">
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("NombreCiudad") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="chkEditEstado" runat="server" Checked='<%# Bind("Estado") %>' />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Estado") %>' Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <strong><em>No proveedores realizadas con los criterios de búsqueda propuestos</em></strong>
                            </EmptyDataTemplate>
                            <FooterStyle BackColor="#CCCC99" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#F7F7DE" />
                            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FBFBF2" />
                            <SortedAscendingHeaderStyle BackColor="#848384" />
                            <SortedDescendingCellStyle BackColor="#EAEAD3" />
                            <SortedDescendingHeaderStyle BackColor="#575357" />
                        </asp:GridView>
                    </td>
                    <td><strong>ID Proveedor</td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtIdProveedor" runat="server"></asp:TextBox>
                        <asp:CompareValidator runat="server" ControlToValidate="txtIdProveedor" Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><strong>Nombre</strong></td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtNombreProveedor" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator runat="server" ControlToValidate="txtNombreProveedor" ValidationExpression="^(?:[A-Za-z0-9]+\s*)*$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnFiltrar" runat="server" OnClick="btnFiltrar_Click" Text="Filtrar" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
