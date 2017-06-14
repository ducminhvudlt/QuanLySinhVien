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
    public partial class UCHocPhi : UserControl
    {
        public static string HocPhi_HocKi;
        public static string HocPhi_NamHoc;
        DoDuLieuVaoComboBox connComboBox = new DoDuLieuVaoComboBox();
        public UCHocPhi()
        {
            InitializeComponent();

            ThietKeDataGridView();
             
            connComboBox.LayDuLieuVaoComboBox(cboNamHoc, "TenNamHoc", "NamHOc");
            connComboBox.LayDuLieuVaoComboBox(cboHocKi, "TenHocKy", "HOcKY");
            connComboBox.LayDuLieuVaoComboBox(cboMaSinhVien, "MaSinhVien", "SinhVien");

            cboHocKi.Text = "Học kỳ 1";
            cboMaSinhVien.Text = "SV0001";
            cboNamHoc.Text = "2009 - 2010";

            TimKiemHocPhi();
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

        private void chkIsMaSoSinhVien_CheckedChanged(object sender, EventArgs e)
        {
            if (cboMaSinhVien.Visible == true)
            {
                
                cboMaSinhVien.Visible = false;
                //dataGridView.Visible = true;
                btnInDanhSach.Visible = true;
                TimKiemHocPhi();
            }
            else
            {
                             
                cboMaSinhVien.Visible = true;
                //dataGridView.Visible = false;
                btnInDanhSach.Visible = false;
                TraHocPhiSinhVien(); 
            }
        }

        private void TimKiemHocPhi()
        {
            HocPhi_HocKi = cboHocKi.Text;
            HocPhi_NamHoc = cboNamHoc.Text;

            Connection conn = new Connection();
            SqlConnection _sqlConnection;         
            using (_sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_DIEM_XemHocPhi", _sqlConnection))
                {
                        _sqlCom.CommandType = CommandType.StoredProcedure;
                        _sqlCom.Parameters.Add("@TenNamHoc", SqlDbType.NVarChar).Value = cboNamHoc.Text;
                        _sqlCom.Parameters.Add("@TenHocKy", SqlDbType.NVarChar).Value = cboHocKi.Text;
                        SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                        DataTable _dt = new DataTable();
                        _sqlDa.Fill(_dt);
                        dataGridView.DataSource = _dt;                   
                }
            }
        }

        private void TraHocPhiSinhVien()
        {
            try
            {
                Connection conn = new Connection();
                SqlConnection _sqlConnection;
                using (_sqlConnection = new SqlConnection(conn._sqlConnectionString))
                {
                    using (SqlCommand _sqlCom = new SqlCommand("sp_DIEM_XemHocPhi_MotSinhVien", _sqlConnection))
                    {
                        _sqlCom.CommandType = CommandType.StoredProcedure;
                        _sqlCom.Parameters.Add("@TenNamHoc", SqlDbType.NVarChar).Value = cboNamHoc.Text;
                        _sqlCom.Parameters.Add("@TenHocKy", SqlDbType.NVarChar).Value = cboHocKi.Text;
                        _sqlCom.Parameters.Add("@MaSinhVien", SqlDbType.NVarChar).Value = cboMaSinhVien.Text+"%";
                        SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                        DataTable _dt = new DataTable();
                        _sqlDa.Fill(_dt);
                        dataGridView.DataSource = _dt;
                    }
                }
            }
            catch (Exception)
            {
            
            }
        }
        private void TimKiemHocPhi(string _maSoSinhVien)
        {

        }

        private void cboMaSinhVien_SelectedIndexChanged(object sender, EventArgs e)
        {
            TraHocPhiSinhVien();
        }

        private void cboHocKi_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (chkIsMaSoSinhVien.Checked == false)
            {
                TimKiemHocPhi();
            }
            else TraHocPhiSinhVien();
        }

        private void cboNamHoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (chkIsMaSoSinhVien.Checked == false)
            {
                TimKiemHocPhi();
            }
            else TraHocPhiSinhVien();
        }

        private void cboMaSinhVien_TextChanged(object sender, EventArgs e)
        {
            TraHocPhiSinhVien();
        }

        private void btnInDanhSach_Click(object sender, EventArgs e)
        {
            RPDanhSachHocPhi rp_DanhSachHocPhi = new RPDanhSachHocPhi();
            rp_DanhSachHocPhi.ShowDialog();
        }

        private void grpTimKiem_Enter(object sender, EventArgs e)
        {

        }

        private void cboMaSinhVien_SelectedValueChanged(object sender, EventArgs e)
        {
            TraHocPhiSinhVien();
        }


    }
}
