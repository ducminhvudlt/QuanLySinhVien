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
    public partial class UCTaoTaiKhoan : UserControl
    {
        private static string _maNguoiDung;        
        public UCTaoTaiKhoan()
        {
            InitializeComponent();

            txtMatKhau.KeyDown += new KeyEventHandler(Bam_Enter);
            txtMatKhauLai.KeyDown += new KeyEventHandler(Bam_Enter);
            txtTenDangNhap.KeyDown += new KeyEventHandler(Bam_Enter);
            txtTenNguoiDung.KeyDown += new KeyEventHandler(Bam_Enter);
            cboQuyenHan.KeyDown += new KeyEventHandler(Bam_Enter);
        }

        private void Bam_Enter(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                ThemTaiKhoan();
            }
        }
        private void txtTenNguoiDung_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtTenDangNhap_TextChanged(object sender, EventArgs e)
        {

        }

        private void SinhMaNGuoiDung()
        {
            int _maNguoiDungMoi;
            LayMaNguoiDung();
            _maNguoiDung=_maNguoiDung.Substring(2,4);
            _maNguoiDungMoi = int.Parse(_maNguoiDung) + 1;
            if (_maNguoiDungMoi > 9999) MessageBox.Show("Dữ Liệu Đã Đầy, Vui Lòng Xóa Bớt Dữ Liệu");
            else _maNguoiDung="ND"+_maNguoiDungMoi.ToString("0000");
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            ThemTaiKhoan();
        }

        private void ThemTaiKhoan()
        {
            if (txtMatKhauLai.Text != txtMatKhau.Text)
            {
                MessageBox.Show("Mật Khẩu Không Trùng Khớp");
            }
            else if (txtMatKhau.Text == "")
                MessageBox.Show("Phải Điền Mật Khẩu");
            else if (KiemTraTrungTenTaiKhoan(txtTenDangNhap.Text))
            {
                MessageBox.Show("Tên Tài Khoản Đăng Nhập Đã Tồn Tại");
            }
            else if (txtTenNguoiDung.Text == "")
            {
                MessageBox.Show("Mời Bạn Nhập Tên Người Dùng");
            }
            else if (txtTenDangNhap.Text == "")
            {
                MessageBox.Show("Mời Bạn Nhập Tên Đăng Nhập");
            }
            else if (cboQuyenHan.Text == "")
            {
                MessageBox.Show("Mời Bạn Nhập Quyền Người Dùng");
            }
            else
            {
                MessageBox.Show("Chúc Mừng Bạn Đã Tạo Tài Khoản \"" + txtTenDangNhap.Text + "\"Thành Công ");
                //ThemTaiKhoan(cboQuyenHan.Text, txtTenNguoiDung.Text, txtTenDangNhap.Text, MaHoa.MaHoaMD5(txtMatKhau.Text));
                ThemTaiKhoan(cboQuyenHan.Text, txtTenNguoiDung.Text, txtTenDangNhap.Text,(txtMatKhau.Text));
                ((Form)this.TopLevelControl).Close();
                //ThemTaiKhoan("ND0005", "Admin", "abc", "acb", "123321");
            }
        }

        #region Database
        private bool KiemTraTrungTenTaiKhoan(string _tenTaiKhoan)//true=ten tai khoan da ton tai
        {
            /*Connection conn = new Connection();
            SqlConnection _sqlConnection;
            using (_sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                string _select = "select TenDNhap from NguoiDung where TenDNhap like '" + _tenTaiKhoan + "'";
                using (SqlCommand _sqlCom = new SqlCommand(_select, _sqlConnection))
                {
                    {
                        SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                        DataSet _ds = new DataSet();
                        _sqlDa.Fill(_ds);
                        
                        if (RowCount != 0) return true;
                        else return false;
                    }
                }
            }*/

            Connection conn = new Connection();
            SqlConnection _sqlConnection;
            _sqlConnection = new SqlConnection(conn._sqlConnectionString);
            _sqlConnection.Open();
            SqlCommand _sqlCommand = new SqlCommand();
            _sqlCommand.Connection = _sqlConnection;
            _sqlCommand.CommandText = "select TenDNhap from NguoiDung where TenDNhap like '" + _tenTaiKhoan + "'";
            SqlDataReader _sqlDataReader = _sqlCommand.ExecuteReader();
            System.Data.DataTable _dataTable = new System.Data.DataTable();
            _dataTable.Load(_sqlDataReader);
            try{
                string a = _dataTable.Rows[0][0].ToString();
                return true;
            }
            catch(Exception)
            {
                return false;
            }
        }

        private void LayMaNguoiDung()
        {
            Connection conn = new Connection();
            SqlConnection _sqlConnection;
            _sqlConnection = new SqlConnection(conn._sqlConnectionString);
            _sqlConnection.Open();
            SqlCommand _sqlCommand = new SqlCommand();
            _sqlCommand.Connection = _sqlConnection;
            _sqlCommand.CommandText = "select top(1) MaND from NGUOIDUNG order by MaND desc";
            SqlDataReader _sqlDataReader = _sqlCommand.ExecuteReader();
            DataTable _dataTable = new DataTable();
            _dataTable.Load(_sqlDataReader);
            _maNguoiDung = _dataTable.Rows[0][0].ToString();
        }

        public void ThemTaiKhoan(string _quyenHan, string _tenNguoiDung, string _tenDangNhap, string _matKhau)
        {
            Connection conn = new Connection();
            SqlConnection _sqlConnection;
            SinhMaNGuoiDung();
            using (_sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_NGUOIDUNG_ThemNguoiDung", _sqlConnection))
                {
                    try
                    {
                        _sqlCom.CommandType = CommandType.StoredProcedure;
                        _sqlCom.Parameters.Add("@MaND", SqlDbType.NVarChar).Value = _maNguoiDung;
                        _sqlCom.Parameters.Add("@QuyenHan", SqlDbType.NVarChar).Value = _quyenHan;
                        _sqlCom.Parameters.Add("@TenND", SqlDbType.NVarChar).Value = _tenNguoiDung;
                        _sqlCom.Parameters.Add("@TenDNhap", SqlDbType.VarChar).Value = _tenDangNhap;
                        _sqlCom.Parameters.Add("@MatKhau", SqlDbType.VarChar).Value = _matKhau;
                        _sqlConnection.Open();
                        _sqlCom.ExecuteNonQuery();
                    }
                    catch (Exception)
                    {
                        MessageBox.Show("Nhập thông tin sai, xin vui lòng nhập lại");
                    }
                }
            }
        }
        #endregion

    }
}
