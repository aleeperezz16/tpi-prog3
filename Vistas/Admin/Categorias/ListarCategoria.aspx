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
            width: 104px;
        }
        .auto-style5 {
            height: 26px;
            width: 104px;
        }
        .auto-style6 {
            width: 584px;
        }
        .auto-style7 {
            height: 37px;
            width: 104px;
        }
        .auto-style8 {
            height: 37px;
        }
        .auto-style9 {
            height: 54px;
        }
        .auto-style10 {
            color: #DC143C;
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
                    <td colspan="2">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Inicio.aspx">Volver al menu Principal</asp:HyperLink>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                    <td class="auto-style3" colspan="2">
                        <asp:Label ID="lbCategoria" CssClass="mainItem" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Categorías"></asp:Label>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style7">
                    </td>
                    <td class="auto-style8" colspan="2"></td>
                    <td class="auto-style8"></td>
                </tr>
                <tr>
                    <td class="auto-style4" rowspan="2">&nbsp;</td>
                    <td class="auto-style6" rowspan="2">
                        <span class="auto-style10">Buscar categría por id:</span><asp:TextBox ID="txtIdCategoria" runat="server" ValidationGroup="1"></asp:TextBox>
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;<asp:Button ID="btnBuscar" CssClass="myButton" runat="server" OnClick="btnBuscarCat_Click" Text="Buscar" ValidationGroup="1" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnVistaInicial" CssClass="myButton" runat="server" OnClick="btnVistaInicial_Click" Text="Vista Inicial" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvBuscarcatxID" runat="server" ControlToValidate="tbCategoriaporid" ForeColor="Red" ValidationGroup="1">*Por favor ingrese un ID a buscar.</asp:RequiredFieldValidator>
                    </td>
                    <td rowspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:RegularExpressionValidator ID="revBuscarcatxID" runat="server" ControlToValidate="tbCategoriaporid" ErrorMessage="RegularExpressionValidator" ForeColor="#FF3300" ValidationExpression="^\d+$" ValidationGroup="1">*Solo ingrese números.</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td colspan="2">
                        <asp:GridView ID="gvCategorias" runat="server" AutoGenerateDeleteButton="True" AllowPaging="True" AutoGenerateEditButton="True" OnPageIndexChanging="gvCategorias_PageIndexChanging" OnRowCancelingEdit="gvCategorias_RowCancelingEdit" OnRowDeleting="gvCategorias_RowDeleting" OnRowEditing="gvCategorias_RowEditing" OnRowUpdating="gvCategorias_RowUpdating" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="Id">
                                    <EditItemTemplate>
                                        <asp:Label ID="lbl_eit_IDCategoria" runat="server" Text='<%# Bind("IDCategoria") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_IDCategoria" runat="server" Text='<%# Bind ("IDCategoria") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbt_eit_NombreCategoria" runat="server" Text='<%# Bind("NombreCategoria") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_NombreCategoria" runat="server" Text='<%# Bind("NombreCategoria") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Descripción">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbt_eit_DescripcionCategoria" runat="server" Text='<%# Bind("Descripcion") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_DescripcionCategoria" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td colspan="2">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5"></td>
                    <td class="auto-style2" colspan="2"></td>
                    <td class="auto-style2"></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
