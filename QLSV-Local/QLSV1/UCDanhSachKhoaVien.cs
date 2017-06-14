using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace QLSV1
{
    public partial class UCDanhSachKhoaVien : UserControl
    {
        ConnectionKhoa connKhoa = new ConnectionKhoa();

        public UCDanhSachKhoaVien()
        {
            InitializeComponent();
        }

        private void UCDanhSachKhoaVien_Load(object sender, EventArgs e)
        {
            dgdNoiDung.DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dgdNoiDung.RowHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dgdNoiDung.ColumnHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dgdNoiDung.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dgdNoiDung.RowHeadersWidthSizeMode = DataGridViewRowHeadersWidthSizeMode.AutoSizeToAllHeaders;

            dgdNoiDung.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgdNoiDung.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;

            dgdNoiDung.RowsDefaultCellStyle.BackColor = Color.Bisque;
            dgdNoiDung.AlternatingRowsDefaultCellStyle.BackColor = Color.Beige;
            dgdNoiDung.CellBorderStyle = DataGridViewCellBorderStyle.SingleHorizontal;

            dgdNoiDung.DefaultCellStyle.SelectionBackColor = Color.Red;
            dgdNoiDung.DefaultCellStyle.SelectionForeColor = Color.Yellow;

            dgdNoiDung.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgdNoiDung.AllowUserToResizeColumns = false;
            dgdNoiDung.ReadOnly = true;
            dgdNoiDung.AllowUserToAddRows = false;
            dgdNoiDung.RowHeadersVisible = false;
            connKhoa.LayDuLieuTuBangKhoa(dgdNoiDung);
            Binding();
        }

        private void Binding()
        {
            txtMaKhoa.DataBindings.Clear();
            txtMaKhoa.DataBindings.Add("Text", dgdNoiDung.DataSource, "Mã Khoa");
            txtTenKhoa.DataBindings.Clear();
            txtTenKhoa.DataBindings.Add("Text", dgdNoiDung.DataSource, "Tên Khoa");
            txtSoDienThoai.DataBindings.Clear();
            txtSoDienThoai.DataBindings.Add("Text", dgdNoiDung.DataSource, "Số Điện Thoại");
        }

        private void txtMaKhoas_TextChanged(object sender, EventArgs e)
        {
            if (txtMaKhoas.Text == "")
            {
                connKhoa.LayDuLieuTuBangKhoa(dgdNoiDung);
            }
            else
            {
                connKhoa.TimKiemKhoaTheoMaKhoa(txtMaKhoas.Text, dgdNoiDung);
            }
            Binding();
        }

        private void txtTenKhoas_TextChanged(object sender, EventArgs e)
        {
            if (txtTenKhoas.Text == "")
            {
                connKhoa.LayDuLieuTuBangKhoa(dgdNoiDung);
            }
            else
            {
                connKhoa.TimKiemKhoaTheoTenKhoa(txtTenKhoas.Text, dgdNoiDung);
            }
            Binding();
        }
    }
}
