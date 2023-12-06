﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;
using System.Data;

namespace Vistas.Admin.Articulos
{
    public partial class AgregarArticulo : Admin
    {
        private NegocioCategorias _negocioCat = new NegocioCategorias();
        private NegocioProveedores _negocioProv = new NegocioProveedores();
        private NegocioArticulos _negocioArt = new NegocioArticulos();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlCategoria.DataSource = _negocioCat.ObtenerCategorias();
                ddlCategoria.DataTextField = "NombreCategoria";
                ddlCategoria.DataValueField = "IDCategoria";
                ddlCategoria.DataBind();

                ddlProveedor.DataSource = _negocioProv.ObtenerProveedores();
                ddlProveedor.DataTextField = "NombreProveedor";
                ddlProveedor.DataValueField = "IDProveedor";
                ddlProveedor.DataBind();
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Articulo nuevoArticulo = new Articulo
            {
                Nombre = txtNombreArticulo.Text.Trim(),
                Categoria = ObtenerCategoria(int.Parse(ddlCategoria.SelectedValue)),
                Proveedor = new Proveedor
                {
                    Id = int.Parse(ddlProveedor.SelectedValue)
                },
                PrecioVenta = decimal.Parse(txtPrecioVenta.Text.Trim()),
                PrecioCompra = decimal.Parse(txtPrecioCompra.Text.Trim()),
                Stock = int.Parse(txtStock.Text.Trim()),
                Estado = true
            };

            lblResultado.Text = _negocioArt.AgregarArticulo(nuevoArticulo) ? "El articulo se ha agregado con exito" : "No se pudo agregar el articulo";
        }

        private Categoria ObtenerCategoria(int id)
        {
            DataRow dr = _negocioCat.ObtenerCategorias(id).Rows[0];
            return new Categoria
            {
                Id = int.Parse(dr.Field<string>("IDCategoria")),
                Nombre = dr.Field<string>("NombreCategoria"),
                Descripcion = dr.Field<string>("Descripcion")
            };
        }
    }
}