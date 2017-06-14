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
    public partial class UCDanhSachLopHoc : UserControl
    {
        ConnectionLopHoc connLopHoc = new ConnectionLopHoc();
        DoDuLieuVaoComboBox connComboBox = new DoDuLieuVaoComboBox();

        public UCDanhSachLopHoc()
        {
            InitializeComponent();
        }

        private void UCDanhSachLopHoc_Load(object sender, EventArgs e)
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
            connLopHoc.LayDuLieuTuBangLopHoc(dgdNoiDung);
            connComboBox.LayDuLieuVaoComboBox(cboKhoas, "TenKhoa", "KHOA");
            cboKhoas.Text = "";
            Binding();
        }

        private void Binding()
        {
            txtMaLop.DataBindings.Clear();
            txtMaLop.DataBindings.Add("Text", dgdNoiDung.DataSource, "Mã Lớp");
            txtTenLop.DataBindings.Clear();
            txtTenLop.DataBindings.Add("Text", dgdNoiDung.DataSource, "Tên Lớp");
            txtTenKhoa.DataBindings.Clear();
            txtTenKhoa.DataBindings.Add("Text", dgdNoiDung.DataSource, "Tên Khoa");
            txtSiSo.DataBindings.Clear();
            txtSiSo.DataBindings.Add("Text", dgdNoiDung.DataSource, "Sĩ Số");
        }

        private void cboKhoas_TextChanged(object sender, EventArgs e)
        {
            if (cboKhoas.Text == "")
            {
                connLopHoc.LayDuLieuTuBangLopHoc(dgdNoiDung);
                Binding();
            }
            else
            {
                connLopHoc.TimKiemLopHocTheoTenKhoa(cboKhoas.Text, dgdNoiDung);
                Binding();
            }
        }
    }
}
