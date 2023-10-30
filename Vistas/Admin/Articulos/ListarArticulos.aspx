﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarArticulos.aspx.cs" Inherits="Vistas.FormularioArticulos" %>

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
            width: 222px;
        }

        .auto-style4 {
            width: 222px;
            height: 26px;
        }

        .auto-style5 {
            height: 26px;
        }
        .auto-style6 {
            width: 222px;
            height: 49px;
        }
        .auto-style7 {
            height: 49px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6"></td>
                    <td class="auto-style2">
                        <asp:Label ID="lbArticulos" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Artículos"></asp:Label>
                    </td>
                    <td class="auto-style7"></td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/FormularioHome.aspx">Volver al menú Principal</asp:HyperLink>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td>
                        <asp:Label ID="lbBuscararticulosid" runat="server" Text="Buscar Artículos por ID:"></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:Button ID="btnBuscararticulosid" runat="server" Text="Buscar" OnClick="btnBuscararticulosid_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style5"></td>
                    <td class="auto-style5"></td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td>
                        <asp:GridView ID="gvArticulos" runat="server" AllowPaging="True" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" OnPageIndexChanging="gvArticulos_PageIndexChanging" OnRowCancelingEdit="gvArticulos_RowCancelingEdit" OnRowDeleting="gvArticulos_RowDeleting" OnRowEditing="gvArticulos_RowEditing" OnRowUpdating="gvArticulos_RowUpdating" OnRowDataBound="gvArticulos_RowDataBound">
                            <Columns>
                                <asp:TemplateField HeaderText="IDArticulo">
                                    <EditItemTemplate>
                                        <asp:Label ID="lbl_eit_idArticulo" runat="server" Text='<%# Bind("IDArticulo") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_idArticulo" runat="server" Text='<%# Bind("IDArticulo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="NombreArticulo">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_NombreArticulo" runat="server" Text='<%# Bind("NombreArticulo") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_NombreArticulo" runat="server" Text='<%# Bind("NombreArticulo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="IDCategoria">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddl_eit_IdCategoria" runat="server">
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_IdCategoria" runat="server" Text='<%# Bind("IDCategoria") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="IDProveedor">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddl_eit_IdProveedor" runat="server">
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_IdProveedor" runat="server" Text='<%# Bind("IDProveedor") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PrecioDeVenta">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_PrecioDeVenta" runat="server" Text='<%# Bind("PrecioDeVenta") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_PrecioDeVenta" runat="server" Text='<%# Bind("PrecioDeVenta") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PrecioDeCompra">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_PrecioDeCompra" runat="server" Text='<%# Bind("PrecioDeCompra") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_PrecioDeCompra" runat="server" Text='<%# Bind("PrecioDeCompra") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Stock">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Stock" runat="server" Text='<%# Bind("Stock") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Stock" runat="server" Text='<%# Bind("Stock") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Estado">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddl_eit_Estado" runat="server">
                                            <asp:ListItem Value="True">Activado</asp:ListItem>
                                            <asp:ListItem Value="False">Dado de baja</asp:ListItem>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Estado" runat="server" Text='<%# Bind("Estado") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td>
                        <asp:Label ID="lbObservaciones" runat="server" Font-Bold="True" Text="Observación: Las acciones dentro del Gridview serán Editar,Eliminar."></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
