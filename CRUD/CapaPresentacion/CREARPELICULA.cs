using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CapaDatos;
using CapaNegocio;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace CapaPresentacion
{
    public partial class CREARPELICULA : Form
    {
        CD_PELICULAS PeliculaCN = new CD_PELICULAS();   
        private string idProducto=null;
        private string idCat = null;
        private bool Editar = false;

        public CREARPELICULA()
        {
            InitializeComponent();
           
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            MostrarProdctos();
            llenarCategoria();
        }

        void llenarCategoria()
        {
            CD_Conexion con = new CD_Conexion();
            DataTable dt = new DataTable();
            using (con.AbrirConexion())
            {
                const string sql = "select  CAId, Nombre from CATEGORIAS ";
                using (SqlCommand cmd = new SqlCommand(sql, con.AbrirConexion()))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            // Asumiendo que tu columna en la base de datos se llama "NombreColumna"
                            cmbCategoria.Items.Add(reader["Nombre"].ToString());
                            cmbCategoria.ValueMember = reader["CAId"].ToString();
                            idCat = reader["CAId"].ToString();
                            idCat = cmbCategoria.ValueMember.ToString();
                        }
                    }

                }
            }
        }

        private void MostrarProdctos() {

            CD_PELICULAS objeto = new CD_PELICULAS();
            dataGridView1.DataSource = objeto.Mostrar();
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            //INSERTAR
            if (Editar == false)
            {
                try
                {
                    
                    PeliculaCN.InsertarPE(txtNombre.Text, txtDesc.Text, idCat);
                    MessageBox.Show("se inserto correctamente");
                    MostrarProdctos();
                    limpiarForm();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("no se pudo insertar los datos por: " + ex);
                }
            }
            //EDITAR
            if (Editar == true) {

                try
                {
                    PeliculaCN.Editar(txtNombre.Text, txtDesc.Text, Convert.ToInt32(idProducto));
                    MessageBox.Show("se edito correctamente");
                    MostrarProdctos();
                    limpiarForm();
                    Editar = false;
                }
                catch (Exception ex) {
                    MessageBox.Show("no se pudo editar los datos por: " + ex);
                }
            }
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                Editar = true;
                txtNombre.Text = dataGridView1.CurrentRow.Cells["Nombre"].Value.ToString();
                txtDesc.Text = dataGridView1.CurrentRow.Cells["Descripcion"].Value.ToString();
                idProducto = dataGridView1.CurrentRow.Cells["PiD"].Value.ToString();
            }
            else
                MessageBox.Show("seleccione una fila por favor");
        }

        private void limpiarForm() {
            txtDesc.Clear();
            txtNombre.Clear();
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                idProducto = dataGridView1.CurrentRow.Cells["PiD"].Value.ToString();
                PeliculaCN.Eliminar(Convert.ToInt32(idProducto));
                MessageBox.Show("Eliminado correctamente");
                    MostrarProdctos();
            }
            else
                MessageBox.Show("seleccione una fila por favor");

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Buscar.Text = "";
            

                CD_PELICULAS objeto = new CD_PELICULAS();
                dataGridView1.DataSource = objeto.MostrarNombre(Buscar.Text);
            
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView1_CellContentDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                Editar = true;
                txtNombre.Text = dataGridView1.CurrentRow.Cells["Nombre"].Value.ToString();
                txtDesc.Text = dataGridView1.CurrentRow.Cells["Descripcion"].Value.ToString();
                idProducto = dataGridView1.CurrentRow.Cells["PiD"].Value.ToString();
                MessageBox.Show("Descripcion: " + txtDesc.Text);
            }
            else
                MessageBox.Show("seleccione una fila por favor");
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            
            if (dataGridView1.SelectedRows.Count > 0)
            {
                Editar = true;
                txtDesc.Text = dataGridView1.CurrentRow.Cells["Descripcion"].Value.ToString();
                MessageBox.Show("Descripcion: " + txtDesc.Text);
            }
         
        }
    }
}
