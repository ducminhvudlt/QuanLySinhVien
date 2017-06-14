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
    public partial class UCDanhSachMonHoc : UserControl
    {
        ConnectionMonHoc connGiangVien = new ConnectionMonHoc();
        DoDuLieuVaoComboBox connComboBox = new DoDuLieuVaoComboBox();

        public UCDanhSachMonHoc()
        {
            InitializeComponent();
        }

        private void UCDanhSachMonHoc_Load(object sender, EventArgs e)
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
            connGiangVien.LayDuLieuTuBangBoMon(dgdNoiDung);
            connComboBox.LayDuLieuVaoComboBox(cboMaMons, "MaMonHoc", "MONHOC");
            connComboBox.LayDuLieuVaoComboBox(cboTenMons, "TenMonHoc", "MONHOC");
            connComboBox.LayDuLieuVaoComboBox(cboTenLops, "TenLop", "LOP");
            connComboBox.LayDuLieuVaoComboBox(cboTenKhoas, "TenKhoa", "KHOA");
            connComboBox.LayDuLieuVaoComboBox(cboMaTinChi, "MaTinChi", "TINCHI");
            cboMaMons.Text = "";
            cboTenMons.Text = "";
            cboTenLops.Text = "";
            cboTenKhoas.Text = "";
            cboMaTinChi.Text = "";
            Binding();
        }

        private void Binding()
        {
            txtMaMonHoc.DataBindings.Clear();
            txtMaMonHoc.DataBindings.Add("Text", dgdNoiDung.DataSource, "Mã Môn Học");
            txtTenMonHoc.DataBindings.Clear();
            txtTenMonHoc.DataBindings.Add("Text", dgdNoiDung.DataSource, "Tên Môn Học");
            txtSoTiet.DataBindings.Clear();
            txtSoTiet.DataBindings.Add("Text", dgdNoiDung.DataSource, "Số Tiết");
            txtTenKhoa.DataBindings.Clear();
            txtTenKhoa.DataBindings.Add("Text", dgdNoiDung.DataSource, "Tên Khoa");
            cboMaTinChi.DataBindings.Clear();
            cboMaTinChi.DataBindings.Add("Text", dgdNoiDung.DataSource, "Loại Tín Chỉ");
            txtSoTinChi.DataBindings.Clear();
            txtSoTinChi.DataBindings.Add("Text", dgdNoiDung.DataSource, "Số Tín Chỉ");
        }

        private void txtMaSinhViens_TextChanged(object sender, EventArgs e)
        {
            if (txtMaSinhViens.Text == "")
            {
                connGiangVien.LayDuLieuTuBangBoMon(dgdNoiDung);
            }
            else
            {
                connGiangVien.TimKiemMonHocTheoMaSinhVien(txtMaSinhViens.Text, dgdNoiDung);
            }
            Binding();
        }

        private void txtTenSinhViens_TextChanged(object sender, EventArgs e)
        {
            if (txtTenSinhViens.Text == "")
            {
                connGiangVien.LayDuLieuTuBangBoMon(dgdNoiDung);
            }
            else
            {
                connGiangVien.TimKiemMonHocTheoTenSinhVien(txtTenSinhViens.Text, dgdNoiDung);
            }
            Binding();
        }

        private void cboMaMons_TextChanged(object sender, EventArgs e)
        {
            if (cboMaMons.Text == "")
            {
                connGiangVien.LayDuLieuTuBangBoMon(dgdNoiDung);
                Binding();
            }
            else
            {
                connGiangVien.TimKiemMonHocTheoMaMon(cboMaMons.Text, dgdNoiDung);
                Binding();
            }
        }

        private void cboTenMons_TextChanged(object sender, EventArgs e)
        {
            if (cboTenMons.Text == "")
            {
                connGiangVien.LayDuLieuTuBangBoMon(dgdNoiDung);
                Binding();
            }
            else
            {
                connGiangVien.TimKiemMonHocTheoTenMon(cboTenMons.Text, dgdNoiDung);
                Binding();
            }
        }

        private void cboTenLop_TextChanged(object sender, EventArgs e)
        {
            if (cboTenLops.Text == "")
            {
                connGiangVien.LayDuLieuTuBangBoMon(dgdNoiDung);
                Binding();
            }
            else
            {
                connGiangVien.TimKiemMonHocTheoTenLop(cboTenLops.Text, dgdNoiDung);
                Binding();
            }
        }

        private void cboTenKhoas_TextChanged(object sender, EventArgs e)
        {
            if (cboTenKhoas.Text == "")
            {
                connGiangVien.LayDuLieuTuBangBoMon(dgdNoiDung);
                Binding();
            }
            else
            {
                connGiangVien.TimKiemMonHocTheoTenKhoa(cboTenKhoas.Text, dgdNoiDung);
                Binding();
            }
        }
    }
}
