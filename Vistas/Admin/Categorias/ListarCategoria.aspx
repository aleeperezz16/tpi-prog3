﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarCategoria.aspx.cs" Inherits="Vistas.Admin.Categorias.ListarCategoria" %>

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
            height: 26px;
        }
        .auto-style3 {
            height: 26px;
            text-align: center;
        }
        .auto-style4 {
            width: 210px;
        }
        .auto-style5 {
            height: 26px;
            width: 210px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5"></td>
                    <td class="auto-style3">
                        <asp:Label ID="lbCategoria" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Categorías"></asp:Label>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Inicio.aspx">Volver al menu Principal</asp:HyperLink>
                    </td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Buscar Categoría por ID:"></asp:Label>
                        <asp:TextBox ID="tbCategoriaporid" runat="server"></asp:TextBox>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Buscar" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5"></td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        <asp:GridView ID="gdvCategorias" runat="server" AutoGenerateDeleteButton="True" AllowPaging="True" AutoGenerateEditButton="True" OnPageIndexChanging="gdvCategorias_PageIndexChanging" OnRowCancelingEdit="gdvCategorias_RowCancelingEdit" OnRowDeleting="gdvCategorias_RowDeleting" OnRowEditing="gdvCategorias_RowEditing" OnRowUpdating="gdvCategorias_RowUpdating" AutoGenerateColumns="False" DataKeyNames="IDCategoria" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:TemplateField HeaderText="ID Categoria">
                                    <EditItemTemplate>
                                        <asp:Label ID="lbl_eit_IDcategoria" runat="server" Text='<%# Bind("IDCategoria") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_IDcategoria" runat="server" Text='<%# Bind("IDCategoria") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbt_eit_Nombrecat" runat="server" Text='<%# Bind("NombreCategoria") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Nombrecat" runat="server" Text='<%# Bind("NombreCategoria") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Descripcion">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbt_eit_Descripcion" runat="server" Text='<%# Bind("Descripcion") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Descripcion" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TPIntegradorGrupo6ConnectionString2 %>" SelectCommand="SELECT * FROM [CATEGORIAS]"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        <asp:Label ID="lbObservaciones" runat="server" Font-Bold="True" Text="Observación: Las acciones dentro del Gridview serán Editar,Eliminar."></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5"></td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>