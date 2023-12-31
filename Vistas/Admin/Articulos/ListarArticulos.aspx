﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarArticulos.aspx.cs" Inherits="Vistas.Admin.Articulos.ListarArticulos" %>

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
            font-weight: bold;
            font-size: xx-large;
            color: #FFFAF0;
            background-color: #DC143C;
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
            width: 268435376px;
        }
        .auto-style6 {
            width: 222px;
            height: 49px;
        }
        .auto-style7 {
            height: 49px;
            font-size: x-large;
            width: 268435376px;
            color: #FF0000;
            background-color: #FFFFFF;
        }
        .auto-style8 {
            text-align: right;
            width: 121px;
        }
        .auto-style9 {
            width: 1278px;
        }
        .auto-style11 {
            font-size: x-large;
            width: 268435376px;
        }
        .auto-style12 {
            height: 26px;
            font-size: x-large;
            width: 268435376px;
        }
        .auto-style13 {
            width: 268435376px;
        }
        .auto-style14 {
            height: 49px;
            font-size: x-large;
            width: 304px;
        }
        .auto-style15 {
            font-size: x-large;
            width: 304px;
        }
        .auto-style17 {
            height: 26px;
            font-size: x-large;
            width: 304px;
        }
        .auto-style18 {
            width: 304px;
        }
        .auto-style19 {
            width: 304px;
            height: 26px;
        }
        .auto-style20 {
            width: 268435376px;
            text-align: right;
        }
    </style>
    <link rel="stylesheet" href="../../StyleSheetG6.css"/>
</head>
<body>
    <form id="form1" class="fontStyle" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style9" colspan="2">
                        <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/Inicio.aspx">Volver al menú Principal</asp:HyperLink>
                    </td>
                    <td class="auto-style8">
                        &nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style20">
                        <asp:Label ID="lblCuentaIngresada" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6"></td>
                    <td class="auto-style2" colspan="2">
                        <asp:Label ID="lblArticulos" CssClass="mainItem" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Artículos"></asp:Label>
                    </td>
                    <td class="auto-style14">&nbsp;</td>
                    <td class="auto-style7 subItem"><strong>Filtros de Búsqueda</strong></td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        &nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style13">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td colspan="2">
                        &nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style13">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td colspan="2" rowspan="18">
                        <asp:GridView ID="gvArticulos" runat="server" AllowPaging="True" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" OnPageIndexChanging="gvArticulos_PageIndexChanging" OnRowCancelingEdit="gvArticulos_RowCancelingEdit" OnRowDeleting="gvArticulos_RowDeleting" OnRowEditing="gvArticulos_RowEditing" OnRowUpdating="gvArticulos_RowUpdating" OnRowDataBound="gvArticulos_RowDataBound" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="Id">
                                    <EditItemTemplate>
                                        <asp:Label ID="lbl_eit_Id" runat="server" Text='<%# Eval("IDArticulo") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Id" runat="server" Text='<%# Eval("IDArticulo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Nombre" runat="server" Text='<%# Eval("NombreArticulo") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfv_eit_Nombre" runat="server" ForeColor="Red" ControlToValidate="txt_eit_Nombre">*</asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Nombre" runat="server" Text='<%# Eval("NombreArticulo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Categoria">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddl_eit_Categoria" runat="server">
                                        </asp:DropDownList>
                                        <asp:Label ID="lbl_eit_IdCategoria" runat="server" Text='<%# Eval("IDCategoria") %>' Visible="False"></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Categoria" runat="server" Text='<%# Eval("NombreCategoria") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Proveedor">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddl_eit_Proveedor" runat="server">
                                        </asp:DropDownList>
                                        <asp:Label ID="lbl_eit_IdProveedor" runat="server" Text='<%# Eval("IDProveedor") %>' Visible="False"></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Proveedor" runat="server" Text='<%# Eval("NombreProveedor") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Precio">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Precio" runat="server" Text='<%# Eval("PrecioDeVenta", "{0:F}") %>'></asp:TextBox>
                                        <asp:CustomValidator ID="cv_eit_Precio" runat="server" ControlToValidate="txt_eit_Precio" ForeColor="Red" OnServerValidate="cv_eit_Precio_ServerValidate" ValidateEmptyText="True">*</asp:CustomValidator>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Precio" runat="server" Text='<%# Eval("PrecioDeVenta", "${0:F}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Stock">
                                    <EditItemTemplate>
                                        <asp:Label ID="lbl_eit_Stock" runat="server" Text='<%# Eval("Stock") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Stock" runat="server" Text='<%# Eval("Stock") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Estado">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="chk_eit_Estado" runat="server" Checked='<%# Eval("Estado") %>' Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chk_it_Estado" runat="server" Checked='<%# Eval("Estado") %>' Enabled="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                    </td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style13">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style15">&nbsp;</td>
                    <td class="auto-style11">Id</td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style19">&nbsp;</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtFiltroId" runat="server"></asp:TextBox>
                        <asp:CompareValidator ID="cpvFiltroId" runat="server" ControlToValidate="txtFiltroId" ForeColor="Red" Operator="GreaterThan" Type="Integer" ValueToCompare="0">*</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style19">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style12">Categoría</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style12">
                        <asp:DropDownList ID="ddlFiltroCategoria" runat="server" AppendDataBoundItems="True">
                            <asp:ListItem>-- Seleccione --</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style12">Proveedor</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style12">
                        <asp:DropDownList ID="ddlFiltroProveedor" runat="server" AppendDataBoundItems="True">
                            <asp:ListItem>-- Seleccione --</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style12">Precio</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style19">&nbsp;</td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="ddlFiltroPrecio" runat="server">
                            <asp:ListItem Selected="True">&gt;=</asp:ListItem>
                            <asp:ListItem>&lt;=</asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="txtFiltroPrecio" runat="server"></asp:TextBox>
                        <asp:CustomValidator ID="cvFiltroPrecio" runat="server" ControlToValidate="txtFiltroPrecio" ForeColor="Red" OnServerValidate="cvFiltroPrecio_ServerValidate">*</asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style19">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style12">Estado</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style12"><asp:DropDownList ID="ddlFiltroEstado" runat="server">
                            <asp:ListItem Value="0">Todos</asp:ListItem>
                            <asp:ListItem Value="1">Activos</asp:ListItem>
                            <asp:ListItem Value="2">Inactivos</asp:ListItem>
                        </asp:DropDownList>
                        </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style12">
                        <asp:Button ID="btnFiltrar" class="myButton" runat="server" Text="Filtrar" OnClick="btnFiltrar_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style13">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td colspan="2">
                        &nbsp;</td>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style13">&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
