using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace QLSV1
{
    public partial class UCXetHocBong : UserControl
    {
        public static string NamHoc;
        public static string Hocki;
        public static decimal SoLuong;
        public static bool isSoLuong;
        DoDuLieuVaoComboBox connComboBox = new DoDuLieuVaoComboBox();
        public UCXetHocBong()
        {
            InitializeComponent();
            ThietKeDataGridView();

            connComboBox.LayDuLieuVaoComboBox(cboNamHoc, "TenNamHoc", "NamHOc");
            connComboBox.LayDuLieuVaoComboBox(cboHocKi, "TenHocKy", "HOcKY");
            
            
            cboHocKi.Text = "Học kỳ 1";
            cboNamHoc.Text = "2009 - 2010";
            updSoLuong.Value = 10;
            LoadDuLieuVaoDataGridview();
        }

        private void ThietKeDataGridView()
        {
            dataGridView.DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridView.RowHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridView.ColumnHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridView.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridView.RowHeadersWidthSizeMode = DataGridViewRowHeadersWidthSizeMode.AutoSizeToAllHeaders;

            dataGridView.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
            dataGridView.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;

            dataGridView.RowsDefaultCellStyle.BackColor = Color.Bisque;
            dataGridView.AlternatingRowsDefaultCellStyle.BackColor = Color.Beige;
            //dataGridView.CellBorderStyle = DataGridViewCellBorderStyle.SingleHorizontal;

            dataGridView.DefaultCellStyle.SelectionBackColor = Color.Red;
            dataGridView.DefaultCellStyle.SelectionForeColor = Color.Yellow;

            dataGridView.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridView.AllowUserToResizeColumns = false;

            dataGridView.ReadOnly = true;



            dataGridView.AllowUserToAddRows = false;
            dataGridView.AllowUserToDeleteRows = false;
            dataGridView.RowHeadersVisible = false;
            dataGridView.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
        }

        private void UCXetHocBong_Load(object sender, EventArgs e)
        {
    
        }

        private void radioSoLuong_CheckedChanged(object sender, EventArgs e)
        {
            if (radioSoLuong.Checked == true)
            {
                updSoLuong.Visible = true;
                updPhanTram.Visible = false;
                LoadDuLieuVaoDataGridview();
            }
            else
            {
                updPhanTram.Visible = true;
                updSoLuong.Visible = false;
                LoadDuLieuVaoDataGridview();
            }
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void XuatKetQuaHocBong()
        {
            Connection conn = new Connection();
            SqlConnection _sqlConnection;
            using (_sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_KQHKTH_LenDSHocBong", _sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.StoredProcedure;
                    _sqlCom.Parameters.Add("@TenNamHoc", SqlDbType.NVarChar).Value = cboNamHoc.Text;
                    _sqlCom.Parameters.Add("@TenHocKy", SqlDbType.NVarChar).Value = cboHocKi.Text;
                    _sqlCom.Parameters.Add("@Top", SqlDbType.NVarChar).Value = updSoLuong.Value;
                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);
                    dataGridView.DataSource = _dt;
                }
            }
        }

        private void XuatKetQuaHocBongPhanTram()
        {
            Connection conn = new Connection();
            SqlConnection _sqlConnection;
            using (_sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_KQHKTH_LenDSHocBong_PhanTram", _sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.StoredProcedure;
                    _sqlCom.Parameters.Add("@TenNamHoc", SqlDbType.NVarChar).Value = cboNamHoc.Text;
                    _sqlCom.Parameters.Add("@TenHocKy", SqlDbType.NVarChar).Value = cboHocKi.Text;
                    _sqlCom.Parameters.Add("@Top", SqlDbType.NVarChar).Value = updPhanTram.Value;
                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);
                    dataGridView.DataSource = _dt;
                }
            }
        }

        private void LoadDuLieuVaoDataGridview()
        {
            if (radioPhanTram.Checked == true)
            {
                XuatKetQuaHocBongPhanTram();
            }
            else
            {
                XuatKetQuaHocBong();
            }
        }

        private void updSoLuong_ValueChanged(object sender, EventArgs e)
        {
            LoadDuLieuVaoDataGridview();
        }

        private void updPhanTram_ValueChanged(object sender, EventArgs e)
        {
            LoadDuLieuVaoDataGridview();
        }

        private void cboHocKi_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDuLieuVaoDataGridview();
        }

        private void cboNamHoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDuLieuVaoDataGridview();
        }

        private void btnInDanhSach_Click(object sender, EventArgs e)
        {
            NamHoc = cboNamHoc.Text;
            Hocki = cboHocKi.Text;
            if (radioPhanTram.Checked == true)
            { isSoLuong = false; SoLuong = updPhanTram.Value; }
            else
            {
                isSoLuong = true;
                SoLuong = updSoLuong.Value;
            }
            frmDanhSachSVXuatSac frmHocBong = new frmDanhSachSVXuatSac();
            frmHocBong.ShowDialog();
        }

    }
}
