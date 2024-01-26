using CapaDatos;
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
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace CapaPresentacion
{
    public partial class CATEGORIA : Form
    {

        CD_CATEGORIA PeliculaCN = new CD_CATEGORIA();
        private string idProducto = null;
        private bool Editar = false;

        public CATEGORIA()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            MostrarProdctos();
        }

        private void MostrarProdctos()
        {

            CD_CATEGORIA objeto = new CD_CATEGORIA();
            dataGridView1.DataSource = objeto.Mostrar();
            llenaUsuarios();



        }

        void llenaUsuarios()
        {
            CD_Conexion con = new CD_Conexion();
            DataTable dt = new DataTable();
            using (con.AbrirConexion())
            {
                const string sql = "select  * from CATEGORIAS ";
                using (SqlCommand cmd = new SqlCommand(sql, con.AbrirConexion()))
                {
                    SqlDataReader rd;
                    rd = cmd.ExecuteReader();
                    if (rd.HasRows)
                    {
                        rd.Read();
                        dt.Load(rd);
                        cmbCategoria.DataSource = dt;
                    }
                }
            }
        }

        private void txtNombre_TextChanged(object sender, EventArgs e)
        {

        }

        private void limpiarForm()
        {
            txtNombre.Clear();
        }
        private void btnGuardar_Click(object sender, EventArgs e)
        {
            //INSERTAR
            if (Editar == false)
            {
                try
                {

                    PeliculaCN.InsertarC(txtNombre.Text);
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
            if (Editar == true)
            {

                try
                {
                    PeliculaCN.Editar(txtNombre.Text, Convert.ToInt32(idProducto));
                    MessageBox.Show("se edito correctamente");
                    MostrarProdctos();
                    limpiarForm();
                    Editar = false;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("no se pudo editar los datos por: " + ex);
                }
            }
        }

        private void CATEGORIA_Load(object sender, EventArgs e)
        {
            MostrarProdctos();
        }
    }
}
