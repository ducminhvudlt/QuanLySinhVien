using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DevComponents.DotNetBar;
using System.Data.SqlClient;

namespace QLSV1
{
    public partial class UCThongTinNguoiDung : UserControl
    {
        Connection conn = new Connection();
        string TaiKhoanDangDuocChon;
        public UCThongTinNguoiDung()
        {
            InitializeComponent();
            LoadBangNguoiDung();
            ThietKeDataGridView();
        }
        private SqlConnection _sqlConnection;
        private void LoadBangNguoiDung()
        {/*
            SqlConnection sqlConnection = new SqlConnection();
            sqlConnection.ConnectionString = Connection._sqlConnectionString;
            sqlConnection.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sqlConnection;
            cmd.CommandText = "select TenDNhap,MatKhau,TenLoaiND from NGuoidung left join LOAINGUOIDUNG on NGUOIDUNG.MaLoai=LOAINGUOIDUNG.MaLoai";
            SqlDataReader rd;
            rd = cmd.ExecuteReader();
            DataTable td = new DataTable();
            td.Load(rd);
            for (int i = 0; i < td.Rows.Count; i++)
            {
                ListViewItem item = new ListViewItem(td.Rows[i][0].ToString());
                item.SubItems.Add(td.Rows[i][1].ToString());
                item.SubItems.Add(td.Rows[i][2].ToString());
                listView.Items.Add(item);
            }
            sqlConnection.Close();
            */

            using (_sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                string _select="select MaND as [Mã Người Dùng],TenND as[ Tên Người Dùng],TenDNhap as[Tên Đăng Nhập],MatKhau as [Mật Khẩu],TenLoaiND as [Phân Quyền] from NGuoidung left join LOAINGUOIDUNG on NGUOIDUNG.MaLoai=LOAINGUOIDUNG.MaLoai";
                using (SqlCommand _sqlCom = new SqlCommand(_select, _sqlConnection))
                {
                    {
                        SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                        DataSet _ds = new DataSet();
                        _sqlDa.Fill(_ds);
                        dataGridView.DataSource = _ds.Tables[0];
                    }
                }
            }
           
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
            dataGridView.ReadOnly = false;

            dataGridView.Columns[0].ReadOnly = true;
            dataGridView.Columns[1].ReadOnly = true;
            dataGridView.Columns[2].ReadOnly = true;
            dataGridView.Columns[3].ReadOnly = true;
            dataGridView.Columns[4].ReadOnly = true;

            dataGridView.AllowUserToAddRows = false;
            dataGridView.RowHeadersVisible = false;
            dataGridView.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
        }
        private void btnLoadLaiData_Click(object sender, EventArgs e)
        {
            LoadBangNguoiDung();
        }

        private void btnSua_Click(object sender, EventArgs e)
        {

        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            //try
            {
                TaiKhoanDangDuocChon = dataGridView[2, dataGridView.CurrentCell.RowIndex].Value.ToString();
                if (MessageBox.Show("Bạn Có Chắc Muốn Xóa Tài Khoản \"" + TaiKhoanDangDuocChon+"\"", "Xác Nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    Connection conn = new Connection();
                    SqlConnection _sqlConnection;
                    using (_sqlConnection = new SqlConnection(conn._sqlConnectionString))
                    {
                        using (SqlCommand _sqlCom = new SqlCommand("sp_NGUOIDUNG_XoaNguoiDung", _sqlConnection))
                        {
                            _sqlCom.CommandType = CommandType.StoredProcedure;
                            _sqlCom.Parameters.Add("@TenDNhap", SqlDbType.NVarChar).Value = TaiKhoanDangDuocChon;
                            _sqlConnection.Open();
                            _sqlCom.ExecuteNonQuery();
                            LoadBangNguoiDung();
                        }
                    }
                }                
            }
           // catch (Exception)
            //{

            //}
        }

        private void dataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex != -1)
            {
                TaiKhoanDangDuocChon = dataGridView[2, e.RowIndex].Value.ToString();
            }
        }
    }
}
