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
    public partial class UCThongKeTonGiao : UserControl
    {
        public static string UCTonGiao_Ten;
        DoDuLieuVaoComboBox _setDuLieuCombobox = new DoDuLieuVaoComboBox();
        public UCThongKeTonGiao()
        {
            InitializeComponent();
            ThietKeDataGridView();
            _setDuLieuCombobox.LayDuLieuVaoComboBox(cboTenTonGiao, "TenTonGiao", "TONGIAO");
            cboTenTonGiao.Text = "Thiên Chúa";
            LoadBangTonGiao();
        }
        private void LoadBangTonGiao()
        {
            Connection conn = new Connection();
            SqlConnection _sqlConnection;
            using (_sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_SINHVIEN_ThongKeTonGiao", _sqlConnection))
                {
                    try
                    {
                        _sqlCom.CommandType = CommandType.StoredProcedure;
                        _sqlCom.Parameters.Add("@TenTonGiao", SqlDbType.NVarChar).Value = cboTenTonGiao.Text;                        
                        SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                        DataTable _dt = new DataTable();
                        _sqlDa.Fill(_dt);
                        dataGridView.DataSource = _dt;
                    }
                    catch (Exception)
                    {
                        MessageBox.Show("Nhập thông tin sai, xin vui lòng nhập lại");
                    }
                }
            }
        }       

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            //btnInDanhSach.Visible = true;
            //btnTimKiem.Visible = false;
        }

        private void btnInDanhSach_Click(object sender, EventArgs e)
        {
            frmRPDanhSachSinhVienTonGiao frmTonGiao = new frmRPDanhSachSinhVienTonGiao();
            frmTonGiao.ShowDialog();
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

        private void cboTenTonGiao_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadBangTonGiao();
            UCTonGiao_Ten = cboTenTonGiao.Text;
            //btnTimKiem.Visible = true;
            //btnInDanhSach.Visible = false;
        }
    }
}
