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
    public partial class UCThongTinGiangVien : UserControl
    {
        ConnectionGiangVien connGiangVien = new ConnectionGiangVien();
        DoDuLieuVaoComboBox connComboBox = new DoDuLieuVaoComboBox();

        public UCThongTinGiangVien()
        {
            InitializeComponent();
        }

        private void UCThongTinGiangVien_Load(object sender, EventArgs e)
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
            connGiangVien.LayDuLieuTuBangGiangVien(dgdNoiDung);
            connComboBox.LayDuLieuVaoComboBox(cboTenKhoas, "TenKhoa", "KHOA");
            connComboBox.LayDuLieuVaoComboBox(cboBoMons, "TenMonHoc", "MONHOC");
            connComboBox.LayDuLieuVaoComboBox(cboBoMon, "TenMonHoc", "MONHOC");
            connComboBox.LayDuLieuVaoComboBox(cboHocVi, "TenTonGiao", "TONGIAO");
            connComboBox.LayDuLieuVaoComboBox(cboLoaiGiangVien, "TenHocVi", "HOCVI");
            cboTenKhoas.Text = "";
            cboBoMons.Text = "";
            cboBoMon.Text = "";
            cboHocVi.Text = "";
            cboLoaiGiangVien.Text = "";
            Binding();
        }

        private void Binding()
        {
            txtMaGiangVien.DataBindings.Clear();
            txtMaGiangVien.DataBindings.Add("Text", dgdNoiDung.DataSource, "Mã Giảng Viên");
            txtTenGiangVien.DataBindings.Clear();
            txtTenGiangVien.DataBindings.Add("Text", dgdNoiDung.DataSource, "Tên Giảng Viên");
            cboGioiTinh.DataBindings.Clear();
            cboGioiTinh.DataBindings.Add("Text", dgdNoiDung.DataSource, "Giới Tính");
            //dtiNgaySinh.DataBindings.Clear();
            //dtiNgaySinh.DataBindings.Add("Text", dgdNoiDung.DataSource, "Ngày Sinh");
            txtDiaChi.DataBindings.Clear();
            txtDiaChi.DataBindings.Add("Text", dgdNoiDung.DataSource, "Địa Chỉ");
            txtDienThoai.DataBindings.Clear();
            txtDienThoai.DataBindings.Add("Text", dgdNoiDung.DataSource, "Điện Thoại");
            cboBoMon.DataBindings.Clear();
            cboBoMon.DataBindings.Add("Text", dgdNoiDung.DataSource, "Tên Môn Học");
            cboHocVi.DataBindings.Clear();
            cboHocVi.DataBindings.Add("Text", dgdNoiDung.DataSource, "Học Vị");
            cboLoaiGiangVien.DataBindings.Clear();
            cboLoaiGiangVien.DataBindings.Add("Text", dgdNoiDung.DataSource, "Loại Giảng Viên");        
        }

        private void txtTenGiangViens_TextChanged(object sender, EventArgs e)
        {
            if (txtTenGiangViens.Text == "")
            {
                connGiangVien.LayDuLieuTuBangGiangVien(dgdNoiDung);
            }
            else
            {
                connGiangVien.TimKiemGiangVienTheoTenGV(txtTenGiangViens.Text, dgdNoiDung);
            }
            Binding();
        }

        private void txtMaGiangViens_TextChanged(object sender, EventArgs e)
        {
            if (txtMaGiangViens.Text == "")
            {
                connGiangVien.LayDuLieuTuBangGiangVien(dgdNoiDung);
            }
            else
            {
                connGiangVien.TimKiemGiangVienTheoMaGV(txtMaGiangViens.Text, dgdNoiDung);
            }
            Binding();
        }

        private void cboTenKhoas_TextChanged(object sender, EventArgs e)
        {
            if (cboTenKhoas.Text == "")
            {
                connGiangVien.LayDuLieuTuBangGiangVien(dgdNoiDung);
                Binding();
            }
            else
            {
                connGiangVien.TimKiemGiangVienTheoTenKhoa(cboTenKhoas.Text, dgdNoiDung);
                Binding();
            }
        }

        private void cboBoMons_TextChanged(object sender, EventArgs e)
        {
            if (cboBoMons.Text == "")
            {
                connGiangVien.LayDuLieuTuBangGiangVien(dgdNoiDung);
                Binding();
            }
            else
            {
                connGiangVien.TimKiemGiangVienTheoTenMon(cboBoMons.Text, dgdNoiDung);
                Binding();
            }
        }

    }
}
