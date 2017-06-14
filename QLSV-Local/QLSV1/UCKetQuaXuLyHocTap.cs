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
    public partial class UCKetQuaXuLyHocTap : UserControl
    {
        public static int _isChon1=1;
        public static int _isChon2=4;
        public static int _isChon3=4;

        frmSettingCanhCaoHocTap frmCanhCao = new frmSettingCanhCaoHocTap();
        public UCKetQuaXuLyHocTap()
        {
            InitializeComponent();
            ThietKeDataGridView();

            chkMuc1.Checked = true;
            chkMuc2.Checked = false;
            chkMuc3.Checked = false;

            LoadDuLieu();

            PhanQuyenNguoiDung(frmTrangChu.LoaiNguoiDung);
        }

        private void btnCaiDat_Click(object sender, EventArgs e)
        {            
            frmCanhCao.ShowDialog();
            LoadDuLieu();
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

        private void LoadDuLieu()
        {
            Connection conn = new Connection();
            SqlConnection _sqlConnection;
            using (_sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_DIEM_XetCanhCaoHocTap", _sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.StoredProcedure;
                    _sqlCom.Parameters.Add("@Muc1", SqlDbType.NVarChar).Value = frmSettingCanhCaoHocTap.CanhCao1;
                    _sqlCom.Parameters.Add("@Muc2", SqlDbType.NVarChar).Value = frmSettingCanhCaoHocTap.CanhCao2;
                    _sqlCom.Parameters.Add("@Muc3", SqlDbType.NVarChar).Value = frmSettingCanhCaoHocTap.CanhCao3;
                    _sqlCom.Parameters.Add("@Chon1", SqlDbType.NVarChar).Value = _isChon1;
                    _sqlCom.Parameters.Add("@Chon2", SqlDbType.NVarChar).Value = _isChon2;
                    _sqlCom.Parameters.Add("@Chon3", SqlDbType.NVarChar).Value = _isChon3;

                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);
                    dataGridView.DataSource = _dt;
                }
            }
        }

        private void chkMuc1_CheckedChanged(object sender, EventArgs e)
        {
            if (chkMuc1.Checked == true) _isChon1 = 1;
            else _isChon1 = 4;

            LoadDuLieu();
        }

        private void chkMuc2_CheckedChanged(object sender, EventArgs e)
        {
            if (chkMuc2.Checked == true) _isChon2 = 2;
            else _isChon2 = 4;

            LoadDuLieu();
        }

        private void chkMuc3_CheckedChanged(object sender, EventArgs e)
        {
            if (chkMuc3.Checked == true) _isChon3 = 3;
            else _isChon3 = 4;

            LoadDuLieu();
        }

        private void btnInDanhSach_Click(object sender, EventArgs e)
        {
            frmRPDanhSachCanhCaoHocTap frmRPCanhCao = new frmRPDanhSachCanhCaoHocTap();
            frmRPCanhCao.ShowDialog();
        }

        private void PhanQuyenNguoiDung(int _loaiNguoiDung)
        {
            if (_loaiNguoiDung != 1) btnCaiDat.Visible = false;
        }
    }
}
