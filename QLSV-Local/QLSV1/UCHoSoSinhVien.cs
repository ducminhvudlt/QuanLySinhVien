using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.IO;
using Excel = Microsoft.Office.Interop.Excel;
using System.Data.OleDb;
using System.Text.RegularExpressions;

namespace QLSV1
{
    public partial class UCHoSoSinhVien : UserControl
    {
        ConnectionSinhVien connSinhVien = new ConnectionSinhVien();
        DoDuLieuVaoComboBox connComboBox = new DoDuLieuVaoComboBox();
        private string Excel03Con = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source={0};Extended Properties='Excel 8.0;HDR={1}'";
        private string Excel07Con = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties='Excel 8.0;HDR={1}'";
        bool boolThemDuLieu = false;
        bool boolSuaDuLieu = false;
        private static string _maSinhVien; 
        static string MaSVTruoc;
        bool flagThem = false;
        bool flagSua = false;
        bool flagXuat = false;
        bool boolChon = false;
        bool boolNhap = false;
        bool boolNhapAll = false;
        DataTable dt = new DataTable();

        public UCHoSoSinhVien()
        {            
            InitializeComponent();
            if (frmTrangChu.LoaiNguoiDung != 1)
            {
                grpPhimBam.Visible = false;
            }
        }

        private void UCHoSoSinhVien_Load(object sender, EventArgs e)
        {
            btnLuu.Enabled = false;

            dgdNoiDung.DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dgdNoiDung.RowHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dgdNoiDung.ColumnHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dgdNoiDung.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dgdNoiDung.RowHeadersWidthSizeMode = DataGridViewRowHeadersWidthSizeMode.AutoSizeToAllHeaders;

            dgdNoiDung.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
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
            connSinhVien.LayDuLieuTuBangSinhVien(dgdNoiDung);
            connComboBox.LayDuLieuVaoComboBox(cboTenKhoas, "TenKhoa", "KHOA");
            connComboBox.LayDuLieuVaoComboBox(cboTenLops, "TenLop", "LOP");
            connComboBox.LayDuLieuVaoComboBox(cboDanToc, "TenDanToc", "DANTOC");
            connComboBox.LayDuLieuVaoComboBox(cboTonGiao, "TenTonGiao", "TONGIAO");
            connComboBox.LayDuLieuVaoComboBox(cboNgheNghiepCha, "TenNghe", "NGHENGHIEP");
            connComboBox.LayDuLieuVaoComboBox(cboNgheNghiepMe, "TenNghe", "NGHENGHIEP");
            connComboBox.LayDuLieuVaoComboBox(cboTenLop, "TenLop", "LOP");
            cboTenKhoas.Text = "";
            cboTenLops.Text = "";
            cboDanToc.Text = "";
            cboTonGiao.Text = "";
            cboNgheNghiepCha.Text = "";
            cboNgheNghiepMe.Text = "";
            txtMaSinhVien.Enabled = false;
            Binding();
            //dgdNoiDung.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
        }

        private void Binding()
        {
            txtMaSinhVien.DataBindings.Clear();
            txtMaSinhVien.DataBindings.Add("Text", dgdNoiDung.DataSource, "Mã Sinh Viên");
            txtTenSinhVien.DataBindings.Clear();
            txtTenSinhVien.DataBindings.Add("Text", dgdNoiDung.DataSource, "Họ Tên");
            cboGioiTinh.DataBindings.Clear();
            cboGioiTinh.DataBindings.Add("Text", dgdNoiDung.DataSource, "Giới Tính");
            dtiNgaySinh.DataBindings.Clear();
            dtiNgaySinh.DataBindings.Add("Text", dgdNoiDung.DataSource, "Ngày Sinh");
            txtNoiSinh.DataBindings.Clear();
            txtNoiSinh.DataBindings.Add("Text", dgdNoiDung.DataSource, "Nơi Sinh");
            cboDanToc.DataBindings.Clear();
            cboDanToc.DataBindings.Add("Text", dgdNoiDung.DataSource, "Dân Tộc");
            cboTonGiao.DataBindings.Clear();
            cboTonGiao.DataBindings.Add("Text", dgdNoiDung.DataSource, "Tôn Giáo");
            txtTenCha.DataBindings.Clear();
            txtTenCha.DataBindings.Add("Text", dgdNoiDung.DataSource, "Họ Tên Cha");
            txtTenMe.DataBindings.Clear();
            cboNgheNghiepCha.DataBindings.Add("Text", dgdNoiDung.DataSource, "Nghề Nghiệp Cha");
            cboNgheNghiepMe.DataBindings.Clear();
            txtTenMe.DataBindings.Add("Text", dgdNoiDung.DataSource, "Họ Tên Mẹ");
            cboNgheNghiepCha.DataBindings.Clear();
            cboNgheNghiepMe.DataBindings.Add("Text", dgdNoiDung.DataSource, "Nghề Nghiệp Mẹ");
            txtDienThoai.DataBindings.Clear();
            txtDienThoai.DataBindings.Add("Text", dgdNoiDung.DataSource, "Điện Thoại");
            cboTenLop.DataBindings.Clear();
            cboTenLop.DataBindings.Add("Text", dgdNoiDung.DataSource, "Tên Lớp");
        }

        private void txtMaSinhViens_TextChanged(object sender, EventArgs e)
        {
            if (txtMaSinhViens.Text == "")
            {
                connSinhVien.LayDuLieuTuBangSinhVien(dgdNoiDung);
            }
            else
            {
                connSinhVien.TimKiemSinhVienTheoMaSV(txtMaSinhViens.Text, dgdNoiDung);
            }
            Binding();
        }

        private void txtTenSinhViens_TextChanged(object sender, EventArgs e)
        {
            if (txtTenSinhViens.Text == "")
            {
                connSinhVien.LayDuLieuTuBangSinhVien(dgdNoiDung);
            }
            else
            {
                connSinhVien.TimKiemSinhVienTheoTen(txtTenSinhViens.Text, dgdNoiDung);
            }
            Binding();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            if (boolNhapAll == true)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    txtMaSinhVien.Text = dt.Rows[i][0].ToString();
                    txtTenSinhVien.Text = dt.Rows[i][1].ToString();
                    cboGioiTinh.Text = dt.Rows[i][2].ToString();
                    dtiNgaySinh.Text = dt.Rows[i][3].ToString();
                    txtNoiSinh.Text = dt.Rows[i][4].ToString();
                    cboDanToc.Text = dt.Rows[i][5].ToString();
                    cboTonGiao.Text = dt.Rows[i][6].ToString();
                    txtTenCha.Text = dt.Rows[i][7].ToString();
                    cboNgheNghiepCha.Text = dt.Rows[i][8].ToString();
                    txtTenMe.Text = dt.Rows[i][9].ToString();
                    cboNgheNghiepMe.Text = dt.Rows[i][10].ToString();
                    txtDienThoai.Text = dt.Rows[i][11].ToString();
                    cboTenLop.Text = dt.Rows[i][12].ToString();
                    connSinhVien.ThemThongTinSinhVienAll(txtMaSinhVien.Text, txtTenSinhVien.Text, cboGioiTinh.Text, dtiNgaySinh.Text, txtNoiSinh.Text, cboDanToc.Text, cboTonGiao.Text, txtTenCha.Text, cboNgheNghiepCha.Text, txtTenMe.Text, cboNgheNghiepMe.Text, txtDienThoai.Text, cboTenLop.Text);
                }
            }
            else
            {
                flagThem = !flagThem;
                if (flagThem == true)
                {
                    boolThemDuLieu = true;
                    btnSua.Enabled = false;
                    btnXoa.Enabled = false;
                    btnLuu.Enabled = true;
                    btnNhap.Enabled = false;
                    btnXuat.Enabled = false;
                    btnThem.Text = "Quay lại";

                    btnLuu.BackColor = Color.FromArgb(255, 128, 255);
                    btnSua.BackColor = Color.LightGray;
                    btnXoa.BackColor = Color.LightGray;
                    btnNhap.BackColor = Color.LightGray;
                    btnXuat.BackColor = Color.LightGray;
                    SinhMaSinhVien();
                    txtMaSinhVien.Text = _maSinhVien;
                    txtTenSinhVien.Text = "";
                    cboGioiTinh.Text = "";
                    dtiNgaySinh.Text = "";
                    txtNoiSinh.Text = "";
                    cboDanToc.Text = "";
                    cboTonGiao.Text = "";
                    txtTenCha.Text = "";
                    txtTenMe.Text = "";
                    cboNgheNghiepCha.Text = "";
                    cboNgheNghiepMe.Text = "";
                    txtDienThoai.Text = "";
                    cboTenLop.Text = "";
                    txtTenSinhVien.Focus();
                }
                else
                {
                    errorProvider1.Clear();
                    btnThem.Text = "Thêm";
                    boolThemDuLieu = false;
                    btnSua.Enabled = true;
                    btnXoa.Enabled = true;
                    btnLuu.Enabled = false;
                    btnNhap.Enabled = true;
                    btnXuat.Enabled = true;
                    btnSua.BackColor = Color.Yellow;
                    btnXoa.BackColor = Color.Red;
                    btnNhap.BackColor = Color.FromArgb(128, 128, 255);
                    btnXuat.BackColor = Color.FromArgb(255, 192, 192);
                    btnLuu.BackColor = Color.LightGray;
                }
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            if (boolChon == false)
            {
                MessageBox.Show("Bạn phải chọn sinh viên muốn sửa !", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                flagSua = !flagSua;
                if (flagSua == true)
                {
                    txtMaSinhVien.Focus();
                    MaSVTruoc = txtMaSinhVien.Text;
                    btnSua.Text = "Quay Lại";
                    boolSuaDuLieu = true;
                    btnThem.Enabled = false;
                    btnXoa.Enabled = false;
                    btnLuu.Enabled = true;
                    btnNhap.Enabled = false;
                    btnXuat.Enabled = false;
                    btnLuu.BackColor = Color.FromArgb(255, 128, 255);
                    btnThem.BackColor = Color.LightGray;
                    btnXoa.BackColor = Color.LightGray;
                    btnNhap.BackColor = Color.LightGray;
                    btnXuat.BackColor = Color.LightGray;
                }
                else
                {
                    btnSua.Text = "Sửa";
                    boolSuaDuLieu = false;
                    btnThem.Enabled = true;
                    btnXoa.Enabled = true;
                    btnLuu.Enabled = false;
                    btnNhap.Enabled = true;
                    btnXuat.Enabled = true;
                    btnLuu.BackColor = Color.LightGray;
                    btnThem.BackColor = Color.FromArgb(192, 255, 255);
                    btnXoa.BackColor = Color.Red;
                    btnNhap.BackColor = Color.FromArgb(128, 128, 255);
                    btnXuat.BackColor = Color.FromArgb(255, 192, 192);
                }
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (boolChon == false)
            {
                MessageBox.Show("Bạn phải chọn sinh viên muốn xóa !","Thông Báo",MessageBoxButtons.OK,MessageBoxIcon.Information);
            }
            else if(MessageBox.Show("Bạn có chắc chắn muốn xóa sinh viên: "+txtTenSinhVien.Text+" ?","Thông Báo",MessageBoxButtons.YesNo,MessageBoxIcon.Warning)==DialogResult.Yes)
            {
                connSinhVien.XoaThongTinSinhVien(txtMaSinhVien.Text);
                connSinhVien.LayDuLieuTuBangSinhVien(dgdNoiDung);
                Binding();
            }
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            if (boolThemDuLieu == true)
            {
                if (txtMaSinhVien.Text == "")
                {
                    errorProvider1.Clear();
                    errorProvider1.SetError(txtMaSinhVien, "Mã sinh viên không được để trống!");
                    txtMaSinhVien.Focus();
                }
                else if (txtTenSinhVien.Text == "")
                {
                    errorProvider1.Clear();
                    errorProvider1.SetError(txtTenSinhVien, "Tên sinh viên không được để trống!");
                    txtTenSinhVien.Focus();
                }
                else if (cboGioiTinh.Text == "")
                {
                    errorProvider1.Clear();
                    errorProvider1.SetError(cboGioiTinh, "Giới không được để trống!");
                    cboGioiTinh.Focus();
                }
                else if (dtiNgaySinh.Text == "")
                {
                    errorProvider1.Clear();
                    errorProvider1.SetError(dtiNgaySinh, "Ngày sinh không được để trống!");
                    dtiNgaySinh.Focus();
                }
                else if (txtNoiSinh.Text == "")
                {
                    errorProvider1.Clear();
                    errorProvider1.SetError(txtNoiSinh, "Tên sinh viên không được để trống!");
                    txtNoiSinh.Focus();
                }
                else if (cboDanToc.Text == "")
                {
                    errorProvider1.Clear();
                    errorProvider1.SetError(cboDanToc, "Dân Tộc không được để trống!");
                    cboDanToc.Focus();
                }
                else if (cboTonGiao.Text == "")
                {
                    errorProvider1.Clear();
                    errorProvider1.SetError(cboTonGiao, "Tôn giáo không được để trống!");
                    cboTonGiao.Focus();
                }
                else if (txtTenCha.Text == "")
                {
                    errorProvider1.Clear();
                    errorProvider1.SetError(txtTenCha, "Tên cha không được để trống!");
                    txtTenCha.Focus();
                }
                else if (txtTenMe.Text == "")
                {
                    errorProvider1.Clear();
                    errorProvider1.SetError(txtTenMe, "Tên mẹ không được để trống!");
                    txtTenMe.Focus();
                }
                else if (cboNgheNghiepCha.Text == "")
                {
                    errorProvider1.Clear();
                    errorProvider1.SetError(cboNgheNghiepCha, "Nghề nghiệp mẹ không được để trống!");
                    cboNgheNghiepCha.Focus();
                }
                else if (cboNgheNghiepMe.Text == "")
                {
                    errorProvider1.Clear();
                    errorProvider1.SetError(cboNgheNghiepMe, "Tên mẹ không được để trống!");
                    cboNgheNghiepMe.Focus();
                }
                else if (txtDienThoai.Text == "")
                {
                    errorProvider1.Clear();
                    errorProvider1.SetError(txtDienThoai, "Điện Thoại không được để trống!");
                    txtDienThoai.Focus();
                }
                else if (cboTenLop.Text == "")
                {
                    errorProvider1.Clear();
                    errorProvider1.SetError(cboTenLop, "Tên lớp không được để trống!");
                    cboTenLop.Focus();
                }
                else
                {
                    connSinhVien.ThemThongTinSinhVien(txtMaSinhVien.Text, txtTenSinhVien.Text, cboGioiTinh.Text, dtiNgaySinh.Text, txtNoiSinh.Text, cboDanToc.Text, cboTonGiao.Text, txtTenCha.Text, cboNgheNghiepCha.Text, txtTenMe.Text, cboNgheNghiepMe.Text, txtDienThoai.Text, cboTenLop.Text);
                    connSinhVien.LayDuLieuTuBangSinhVien(dgdNoiDung);
                    errorProvider1.Clear();
                    Binding();
                    btnThem.Text = "Thêm";
                    flagThem = false;
                    boolThemDuLieu = false;
                    btnSua.Enabled = true;
                    btnXoa.Enabled = true;
                    btnLuu.Enabled = false;
                    btnNhap.Enabled = true;
                    btnXuat.Enabled = true;
                    btnSua.BackColor = Color.Yellow;
                    btnXoa.BackColor = Color.Red;
                    btnNhap.BackColor = Color.FromArgb(128, 128, 255);
                    btnXuat.BackColor = Color.FromArgb(255, 192, 192);
                    btnLuu.BackColor = Color.LightGray;
                }
            }

            if (boolSuaDuLieu == true)
            {       
                connSinhVien.SuaThongTinSinhVien(MaSVTruoc, txtMaSinhVien.Text, txtTenSinhVien.Text, cboGioiTinh.Text, dtiNgaySinh.Text, txtNoiSinh.Text, cboDanToc.Text, cboTonGiao.Text, txtTenCha.Text, cboNgheNghiepCha.Text, txtTenMe.Text, cboNgheNghiepMe.Text, txtDienThoai.Text, cboTenLop.Text);
                connSinhVien.LayDuLieuTuBangSinhVien(dgdNoiDung);
                Binding();
                btnSua.Text = "Sửa";
                flagSua = false;
                boolSuaDuLieu = false;
                btnThem.Enabled = true;
                btnXoa.Enabled = true;
                btnLuu.Enabled = false;
                btnNhap.Enabled = true;
                btnXuat.Enabled = true;
                btnThem.BackColor = Color.FromArgb(192, 255, 255);
                btnLuu.BackColor = Color.LightGray;
                btnXoa.BackColor = Color.Red;
                btnNhap.BackColor = Color.FromArgb(128, 128, 255);
                btnXuat.BackColor = Color.FromArgb(255, 192, 192);
            }

            if (boolNhap == true)
            {
                connSinhVien.LayDuLieuTuBangSinhVien(dgdNoiDung);
                btnLuu.Text = "Lưu";
                btnLuu.Enabled = false;
                btnSua.Enabled = true;
                btnXoa.Enabled = true;
                btnNhap.Enabled = true;
                btnXoa.BackColor = Color.Red;
                btnNhap.BackColor = Color.FromArgb(128, 128, 255);
                btnSua.BackColor = Color.Yellow;
                btnLuu.BackColor = Color.LightGray;
                boolNhap = false;
            }
        }

        private void dgdNoiDung_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            boolChon = true;
        }

        private void btnNhap_Click(object sender, EventArgs e)
        {
            boolNhap = !boolNhap;
            if (boolNhap == true)
            {
                if (openFileDialog1.ShowDialog() == DialogResult.OK)
                {
                    boolNhapAll = true;
                    btnLuu.Enabled = true;
                    btnSua.Enabled = false;
                    btnXoa.Enabled = false;
                    btnNhap.Enabled = false;
                    btnXoa.BackColor = Color.LightGray;
                    btnNhap.BackColor = Color.LightGray;
                    btnSua.BackColor = Color.LightGray;
                    btnLuu.BackColor = Color.FromArgb(255, 128, 255);
                    btnLuu.Text = "Quay Lại";
                }
                else
                {
                    boolNhap = false;
                }
            }
            else
            {
                connSinhVien.LayDuLieuTuBangSinhVien(dgdNoiDung);
                btnLuu.Enabled = false;
                Binding();
            }
        }

        private void openFileDialog1_FileOk(object sender, CancelEventArgs e)
        {
            string filePath = openFileDialog1.FileName;
            string extension = Path.GetExtension(filePath);
            string header = rbHeaderYes.Checked ? "YES" : "NO";
            string conStr, sheetName;
            conStr = string.Empty;
            switch (extension)
            {
                case ".xls": //Excel 97-03
                    conStr = string.Format(Excel03Con, filePath, header);
                    break;
                case ".xlsx": //Excel 07
                    conStr = string.Format(Excel07Con, filePath, header);
                    break;
            }
            //Get the name of the First Sheet.
            using (OleDbConnection con = new OleDbConnection(conStr))
            {
                using (OleDbCommand cmd = new OleDbCommand())
                {
                    cmd.Connection = con;
                    con.Open();
                    DataTable dtExcel = con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                    sheetName = dtExcel.Rows[0]["TABLE_NAME"].ToString();
                    con.Close();
                }
            }

            using (OleDbConnection cn = new OleDbConnection(conStr))
            {
                using (OleDbCommand cmd = new OleDbCommand())
                {
                    using (OleDbDataAdapter oda = new OleDbDataAdapter())
                    {
                        //DataTable dt = new DataTable();
                        cmd.CommandText = "SELECT * From [" + sheetName + "]";
                        cmd.Connection = cn;
                        cn.Open();
                        oda.SelectCommand = cmd;
                        oda.Fill(dt);
                        cn.Close();

                        dgdNoiDung.DataSource = dt;
                        Binding();
                    }
                }
            }
        }

        private void btnXuat_Click(object sender, EventArgs e)
        {
            flagXuat = !flagXuat;
            if (flagXuat == true)
            {
                ThaoTac.Export2Excel(dgdNoiDung);
                btnLuu.Enabled = false;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                btnNhap.Enabled = false;
                btnThem.BackColor = Color.LightGray;
                btnXoa.BackColor = Color.LightGray;
                btnNhap.BackColor = Color.LightGray;
                btnSua.BackColor = Color.LightGray;
                btnLuu.BackColor = Color.LightGray;
                btnXuat.Text = "Quay Lại";
            }
            else
            {
                connSinhVien.LayDuLieuTuBangSinhVien(dgdNoiDung);
                btnLuu.Enabled = false;
                btnSua.Enabled = true;
                btnXoa.Enabled = true;
                btnNhap.Enabled = true;
                btnThem.BackColor = Color.FromArgb(192, 255, 255);
                btnXoa.BackColor = Color.Red;
                btnNhap.BackColor = Color.FromArgb(128, 128, 255);
                btnSua.BackColor = Color.Yellow;
                btnLuu.BackColor = Color.LightGray;
                btnXuat.Text = "Xuất";
            }
        }

        private void cboTenKhoas_TextChanged(object sender, EventArgs e)
        {
            if (cboTenKhoas.Text == "")
            {
                connSinhVien.LayDuLieuTuBangSinhVien(dgdNoiDung);
                Binding();
            }
            else
            {
                connSinhVien.TimKiemSinhVienTheoTenKhoa(cboTenKhoas.Text, dgdNoiDung);
                Binding();
            }
        }

        private void cboTenLops_TextChanged(object sender, EventArgs e)
        {
            if (cboTenLops.Text == "")
            {
                connSinhVien.LayDuLieuTuBangSinhVien(dgdNoiDung);
                Binding();
            }
            else
            {
                connSinhVien.TimKiemSinhVienTheoTenLop(cboTenLops.Text, dgdNoiDung);
                Binding();
            }
        }

        private void dgdNoiDung_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            boolChon = true;
        }

        private void LayMaSinhVien()
        {
            Connection conn = new Connection();
            SqlConnection _sqlConnection;
            _sqlConnection = new SqlConnection(conn._sqlConnectionString);
            _sqlConnection.Open();
            SqlCommand _sqlCommand = new SqlCommand();
            _sqlCommand.Connection = _sqlConnection;
            _sqlCommand.CommandText = "select top(1) MaSINHVIEN from SINHVIEN order by MaSINHVIEN desc";
            SqlDataReader _sqlDataReader = _sqlCommand.ExecuteReader();
            DataTable _dataTable = new DataTable();
            _dataTable.Load(_sqlDataReader);
            _maSinhVien = _dataTable.Rows[0][0].ToString();
        }

        private void SinhMaSinhVien()
        {
            int _maSinhVienMoi;
            LayMaSinhVien();
            _maSinhVien = _maSinhVien.Substring(2,4);
            _maSinhVienMoi = int.Parse(_maSinhVien) + 1;
            if (_maSinhVienMoi > 9999) MessageBox.Show("Dữ Liệu Đã Đầy, Vui Lòng Xóa Bớt Dữ Liệu");
            else _maSinhVien = "SV" + _maSinhVienMoi.ToString("0000");
        }
    }
}
