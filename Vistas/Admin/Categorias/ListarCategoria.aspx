<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarCategoria.aspx.cs" Inherits="Vistas.Admin.Categorias.ListarCategoria" %>

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
        .auto-style8 {
            height: 37px;
        }
        .auto-style14 {
            height: 27px;
            text-align: right;
        }
        .auto-style19 {
            height: 36px;
        }
        .auto-style21 {
            height: 27px;
            width: 642px;
        }
        .auto-style22 {
            height: 26px;
            text-align: center;
            width: 642px;
        }
        .auto-style23 {
            height: 37px;
            width: 642px;
        }
        .auto-style24 {
            width: 642px;
            text-align: center;
        }
        .auto-style25 {
            width: 642px;
        }
        .auto-style26 {
            height: 26px;
            width: 642px;
        }
        .auto-style27 {
            height: 27px;
            width: 393px;
        }
        .auto-style28 {
            height: 26px;
            text-align: center;
            width: 393px;
        }
        .auto-style29 {
            height: 37px;
            width: 393px;
        }
        .auto-style30 {
            width: 393px;
            text-align: center;
        }
        .auto-style31 {
            width: 393px;
        }
        .auto-style32 {
            height: 26px;
            width: 393px;
        }
        .auto-style33 {
            width: 642px;
            text-align: left;
        }
    </style>
     <link rel="stylesheet" href="../../StyleSheetG6.css"/>
</head>
<body>
    <form id="form1" class="fontStyle" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style27">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Inicio.aspx">Volver al menu Principal</asp:HyperLink>
                    </td>
                    <td class="auto-style21">
                        &nbsp;</td>
                    <td class="auto-style14">
                        <asp:Label ID="lblCuentaIngresada" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style28">
                        &nbsp;</td>
                    <td class="auto-style22">
                        <asp:Label ID="lbCategoria" CssClass="mainItem" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Categorías"></asp:Label>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style29">&nbsp;</td>
                    <td class="auto-style23"></td>
                    <td class="auto-style8"></td>
                </tr>
                <tr>
                    <td class="auto-style30" rowspan="3">
                        &nbsp;</td>
                    <td class="auto-style33" rowspan="3">
                        <asp:Label ID="lblBuscarXID" class="subItem" runat="server" Text="Buscar Categoría por ID:"></asp:Label>
                        <asp:TextBox ID="tbCategoriaporID" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblBuscarXNombre" class="subItem" runat="server" Text="Buscar Categoría por Nombre:"></asp:Label>
                        <asp:TextBox ID="tbCategoriaporNombre" runat="server"></asp:TextBox>
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;<asp:Button ID="btnBuscarCat" CssClass="myButton" runat="server" OnClick="btnBuscarCat_Click" Text="Buscar" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnVistaInicial" CssClass="myButton" runat="server" OnClick="btnVistaInicial_Click" Text="Vista Inicial" />
                    </td>
                    <td class="auto-style19">
                        <asp:CustomValidator ID="cvPorID" runat="server" ControlToValidate="tbCategoriaporID" OnServerValidate="cvPorID_ServerValidate"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CustomValidator ID="cvSoloNumeros" runat="server" ControlToValidate="tbCategoriaporID" OnServerValidate="cvSoloNumeros_ServerValidate"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CustomValidator ID="cvPorNombre" runat="server" ControlToValidate="tbCategoriaporNombre" OnServerValidate="cvPorNombre_ServerValidate"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style30">
                        &nbsp;</td>
                    <td class="auto-style24">
                        <asp:GridView ID="gdvCategorias" runat="server" AutoGenerateDeleteButton="True" AllowPaging="True" AutoGenerateEditButton="True" OnPageIndexChanging="gdvCategorias_PageIndexChanging" OnRowCancelingEdit="gdvCategorias_RowCancelingEdit" OnRowDeleting="gdvCategorias_RowDeleting" OnRowEditing="gdvCategorias_RowEditing" OnRowUpdating="gdvCategorias_RowUpdating" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="ID CATEGORIA">
                                    <EditItemTemplate>
                                        <asp:Label ID="lbl_eit_IDCategoria" runat="server" Text='<%# Bind("IDCategoria") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_IDCategoria" runat="server" Text='<%# Bind ("IDCategoria") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="NOMBRE">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbt_eit_NombreCategoria" runat="server" Text='<%# Bind("NombreCategoria") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_NombreCategoria" runat="server" Text='<%# Bind("NombreCategoria") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DESCRIPCION">
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
                    <td class="auto-style31">
                        &nbsp;</td>
                    <td class="auto-style25">
                        <asp:Label ID="lbObservaciones" runat="server" Font-Bold="True" Text="Observación: Las acciones dentro del Gridview serán Editar,Eliminar."></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style31">&nbsp;</td>
                    <td class="auto-style25">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style32">&nbsp;</td>
                    <td class="auto-style26"></td>
                    <td class="auto-style2"></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
