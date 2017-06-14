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
    public partial class UCLopTinChi : UserControl
    {
        ConnectionLopTinChi connLopTinChi = new ConnectionLopTinChi();
        DoDuLieuVaoComboBox connComboBox = new DoDuLieuVaoComboBox();

        bool boolThemDuLieu = false;
        bool boolSuaDuLieu = false;
        static string MaLopTinChiTruoc;
        static string TenNamHocTruoc;
        static string TenNamHoc;
        private static string _maLopTinChi;    
        bool flagThem = false;
        bool flagSua = false;
        bool boolChon = false;

        public UCLopTinChi()
        {
            InitializeComponent();

            if (frmTrangChu.LoaiNguoiDung !=1)
            {
                grpPhimBam.Visible = false;
            }
        }

        private void UCLopTinChi_Load(object sender, EventArgs e)
        {
            btnLuu.Enabled = false;

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
            connLopTinChi.LayDuLieuTuBangLopTinChi(dgdNoiDung);
            connComboBox.LayDuLieuVaoComboBox(cboKhoas, "TenKhoa", "KHOA");
            connComboBox.LayDuLieuVaoComboBox(cboNamHocs, "TenNamHoc", "NAMHOC");
            connComboBox.LayDuLieuVaoComboBox(cboGiangVien, "TenGIANGVIEN", "GIANGVIEN");
            connComboBox.LayDuLieuVaoComboBox(cboNamHoc, "TenNamHoc", "NAMHOC");
            connComboBox.LayDuLieuVaoComboBox(cboTenMon, "TenMonHoc", "MONHOC");
            txtMaLopTinChi.Enabled = false;
            cboKhoas.Text = "";
            cboNamHocs.Text = "";
            Binding();
        }

        private void Binding()
        {
            txtMaLopTinChi.DataBindings.Clear();
            txtMaLopTinChi.DataBindings.Add("Text", dgdNoiDung.DataSource, "Mã Lớp Tín Chỉ");
            cboTenMon.DataBindings.Clear();
            cboTenMon.DataBindings.Add("Text", dgdNoiDung.DataSource, "Tên Môn Học");
            cboNamHoc.DataBindings.Clear();
            cboNamHoc.DataBindings.Add("Text", dgdNoiDung.DataSource, "Tên Năm Học");
            txtSiSo.DataBindings.Clear();
            txtSiSo.DataBindings.Add("Text", dgdNoiDung.DataSource, "Sĩ Số");
            cboGiangVien.DataBindings.Clear();
            cboGiangVien.DataBindings.Add("Text", dgdNoiDung.DataSource, "Tên Giảng Viên");
        }

        private void cboNamHocs_TextChanged(object sender, EventArgs e)
        {
            if (cboNamHocs.Text == "")
            {
                connLopTinChi.LayDuLieuTuBangLopTinChi(dgdNoiDung);
                Binding();
            }
            else
            {
                connLopTinChi.TimKiemLopTinChiTheoTenNamHoc(cboNamHocs.Text, dgdNoiDung);
                Binding();
            }
        }

        private void cboKhoas_TextChanged(object sender, EventArgs e)
        {
            if (cboKhoas.Text == "")
            {
                connLopTinChi.LayDuLieuTuBangLopTinChi(dgdNoiDung);
                Binding();
            }
            else
            {
                connLopTinChi.TimKiemLopTinChiTheoTenKhoa(cboKhoas.Text, dgdNoiDung);
                Binding();
            }
        }

        private void txtMaGiaoViens_TextChanged(object sender, EventArgs e)
        {
            if (txtMaGiaoViens.Text == "")
            {
                connLopTinChi.LayDuLieuTuBangLopTinChi(dgdNoiDung);
                Binding();
            }
            else
            {
                connLopTinChi.TimKiemLopTinChiTheoMaGiaoVIen(txtMaGiaoViens.Text, dgdNoiDung);
                Binding();
            }
        }

        private void txtTenGiaoViens_TextChanged(object sender, EventArgs e)
        {
            if (txtTenGiaoViens.Text == "")
            {
                connLopTinChi.LayDuLieuTuBangLopTinChi(dgdNoiDung);
                Binding();
            }
            else
            {
                connLopTinChi.TimKiemLopTinChiTheoTenGiaoVien(txtTenGiaoViens.Text, dgdNoiDung);
                Binding();
            }
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            flagThem = !flagThem;
            if (flagThem == true)
            {
                boolThemDuLieu = true;
                btnThemSV.Enabled = false;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                btnLuu.Enabled = true;
                btnThem.Text = "Quay lại";

                cboTenMon.Enabled = false;
                txtSiSo.Enabled = false;
                cboGiangVien.Enabled = false;

                btnLuu.BackColor = Color.FromArgb(255, 128, 255);
                btnSua.BackColor = Color.LightGray;
                btnXoa.BackColor = Color.LightGray;
                cboTenMon.Text = "";
                cboNamHoc.Text = "";
                txtSiSo.Text = "";
                cboGiangVien.Text = "";
                cboTenMon.Focus();
            }
            else
            {
                btnThem.Text = "Thêm";
                btnThemSV.Enabled = true;
                boolThemDuLieu = false;
                btnSua.Enabled = true;
                btnXoa.Enabled = true;
                btnLuu.Enabled = false;

                cboTenMon.Enabled = true;
                txtSiSo.Enabled = true;
                cboGiangVien.Enabled = true;

                btnSua.BackColor = Color.Yellow;
                btnXoa.BackColor = Color.Red;
                btnLuu.BackColor = Color.LightGray;
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (boolChon == false)
            {
                MessageBox.Show("Bạn phải chọn lớp tín chỉ muốn xóa !", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else if (MessageBox.Show("Bạn có chắc chắn muốn xóa lớp tín chỉ: " + txtMaLopTinChi.Text + " ?\nViệc này có thể dẫn đến xóa điểm các sinh viên thuộc lớp này", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
            {
                connLopTinChi.XoaLopTinChi(txtMaLopTinChi.Text,cboNamHoc.Text);
                connLopTinChi.LayDuLieuTuBangLopTinChi(dgdNoiDung);
                Binding();
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            if (boolChon == false)
            {
                MessageBox.Show("Bạn phải chọn lớp tín chỉ muốn sửa !", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                flagSua = !flagSua;
                if (flagSua == true)
                {
                    txtMaLopTinChi.Focus();
                    MaLopTinChiTruoc = txtMaLopTinChi.Text;
                    TenNamHocTruoc = cboNamHoc.Text;
                    btnSua.Text = "Quay Lại";
                    boolSuaDuLieu = true;
                    btnThemSV.Enabled = false;
                    btnThem.Enabled = false;
                    btnXoa.Enabled = false;
                    btnLuu.Enabled = true;
                    btnLuu.BackColor = Color.FromArgb(255, 128, 255);
                    btnThem.BackColor = Color.LightGray;
                    btnXoa.BackColor = Color.LightGray;
                }
                else
                {
                    errorProvider1.Clear();
                    btnSua.Text = "Sửa";
                    boolSuaDuLieu = false;
                    btnThemSV.Enabled = true;
                    btnThem.Enabled = true;
                    btnXoa.Enabled = true;
                    btnLuu.Enabled = false;
                    btnLuu.BackColor = Color.LightGray;
                    btnThem.BackColor = Color.FromArgb(192, 255, 255);
                    btnXoa.BackColor = Color.Red;
                }
            }
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            if (boolThemDuLieu == true)
            {
                if (txtMaLopTinChi.Text == "")
                {
                    errorProvider1.Clear();
                    errorProvider1.SetError(txtMaLopTinChi, "Mã lớp tín chỉ không được để trống!");
                    txtMaLopTinChi.Focus();
                }
                else if (cboTenMon.Text == "")
                {
                    errorProvider1.Clear();
                    errorProvider1.SetError(cboTenMon, "Tên môn không được để trống!");
                    cboTenMon.Focus();
                }
                else if (cboNamHoc.Text == "")
                {
                    errorProvider1.Clear();
                    errorProvider1.SetError(cboNamHoc, "Năm học không được để trống!");
                    cboNamHoc.Focus();
                }
                else if (txtSiSo.Text == "")
                {
                    errorProvider1.Clear();
                    errorProvider1.SetError(txtSiSo, "Sĩ số không được để trống!");
                    txtSiSo.Focus();
                }
                else if (cboGiangVien.Text == "")
                {
                    errorProvider1.Clear();
                    errorProvider1.SetError(cboGiangVien, "Giảng Viên không được để trống!");
                    cboGiangVien.Focus();
                }
                else
                {
                    connLopTinChi.ThemLopTinChi(cboNamHoc.Text, cboGiangVien.Text, cboTenMon.Text, txtMaLopTinChi.Text, txtSiSo.Text);
                    connLopTinChi.LayDuLieuTuBangLopTinChi(dgdNoiDung);
                    errorProvider1.Clear();
                    Binding();
                    btnThem.Text = "Thêm";
                    flagThem = false;
                    boolThemDuLieu = false;
                    btnThemSV.Enabled = true;
                    btnSua.Enabled = true;
                    btnXoa.Enabled = true;
                    btnLuu.Enabled = false;
                    btnSua.BackColor = Color.Yellow;
                    btnXoa.BackColor = Color.Red;
                    btnLuu.BackColor = Color.LightGray;
                }
            }

            if (boolSuaDuLieu == true)
            {
                connLopTinChi.SuaThongTinLopTinChi(MaLopTinChiTruoc, txtMaLopTinChi.Text,TenNamHocTruoc, cboNamHoc.Text, cboTenMon.Text, cboGiangVien.Text, txtSiSo.Text);
                connLopTinChi.LayDuLieuTuBangLopTinChi(dgdNoiDung);
                Binding();
                btnSua.Text = "Sửa";
                btnThemSV.Enabled = true;
                boolSuaDuLieu = false;
                btnThem.Enabled = true;
                btnXoa.Enabled = true;
                btnLuu.Enabled = false;
                flagSua = false;
                btnThem.BackColor = Color.FromArgb(192, 255, 255);
                btnLuu.BackColor = Color.LightGray;
                btnXoa.BackColor = Color.Red;
            }
        }

        private void dgdNoiDung_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            boolChon = true;
        }

        private void btnThemSV_Click(object sender, EventArgs e)
        {
            frmThemSVVaoLop frmThemSV = new frmThemSVVaoLop();
            frmThemSV.Show();
        }

        private void LayMaLopTinChi()
        {
            Connection conn = new Connection();
            SqlConnection _sqlConnection;
            _sqlConnection = new SqlConnection(conn._sqlConnectionString);
            _sqlConnection.Open();
            SqlCommand _sqlCommand = new SqlCommand();
            _sqlCommand.Connection = _sqlConnection;
            _sqlCommand.CommandText = "select top(1) LOPTINCHI.MaLopTC from LOPTINCHI,PHANCONG,NAMHOC Where LOPTINCHI.MaLopTC=PHANCONG.MaLopTC and PHANCONG.MaNamHoc=NamHoc.MaNamHoc AND NAMHOC.TenNamHoc='"+TenNamHoc+"' order by PHANCONG.MaNamHoc desc,MaLopTC desc";
            SqlDataReader _sqlDataReader = _sqlCommand.ExecuteReader();
            DataTable _dataTable = new DataTable();
            _dataTable.Load(_sqlDataReader);
            if (_dataTable.Rows.Count != 0)
            {
                _maLopTinChi = _dataTable.Rows[0][0].ToString();
            }
            else
            {
                _maLopTinChi = "LTC0000";
            }
        }

        private void SinhMaLopTinChi()
        {
            int _maLopTinChiMoi;
            LayMaLopTinChi();
            _maLopTinChi = _maLopTinChi.Substring(3, 4);
            _maLopTinChiMoi = int.Parse(_maLopTinChi) + 1;
            if (_maLopTinChiMoi > 9999) MessageBox.Show("Dữ Liệu Đã Đầy, Vui Lòng Xóa Bớt Dữ Liệu");
            else _maLopTinChi = "LTC" + _maLopTinChiMoi.ToString("0000");
        }

        private void cboNamHoc_SelectedValueChanged(object sender, EventArgs e)
        {
            if (flagThem == true)
            {
                TenNamHoc = cboNamHoc.SelectedValue.ToString();
                SinhMaLopTinChi();
                txtMaLopTinChi.Text = _maLopTinChi;
                cboTenMon.Enabled = true;
                txtSiSo.Enabled = true;
                cboGiangVien.Enabled = true;
            }
        }
    }
}
