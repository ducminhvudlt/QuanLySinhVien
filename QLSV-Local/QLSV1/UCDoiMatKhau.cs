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
    public partial class UCDoiMatKhau : UserControl
    {
        private string _matKhauHienTai;
        public UCDoiMatKhau()
        {
            InitializeComponent();
            
            txtMatKhauCu.KeyDown+=new KeyEventHandler(UCDoiMatKhau_KeyDown);
            txtMatKhauMoi.KeyDown += new KeyEventHandler(UCDoiMatKhau_KeyDown);
            txtNhapLaiMK.KeyDown += new KeyEventHandler(UCDoiMatKhau_KeyDown);
        }

        void UCDoiMatKhau_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                ThayDoiMatKhau();
            }
        }

       
        private void btnLuu_Click(object sender, EventArgs e)
        {
            ThayDoiMatKhau();            
        }
        private void ThayDoiMatKhau()
        {
            Connection conn = new Connection();
            SqlConnection _sqlConnection;
            _sqlConnection = new SqlConnection(conn._sqlConnectionString);
            _sqlConnection.Open();
            SqlCommand _sqlCommand = new SqlCommand();
            _sqlCommand.Connection = _sqlConnection;
            _sqlCommand.CommandText = "select MatKhau from NGUOIDUNG where TenDNhap like '"+frmDangNhap.TenDangNhap.ToString()+"'";
            SqlDataReader _sqlDataReader = _sqlCommand.ExecuteReader();
            DataTable _dataTable = new DataTable();
            _dataTable.Load(_sqlDataReader);
            _matKhauHienTai = _dataTable.Rows[0][0].ToString();

            if (_matKhauHienTai == txtMatKhauCu.Text)
            {
                if (txtMatKhauMoi.Text == "") MessageBox.Show("Bạn phải nhập mật khẩu mới !!");
                else if (txtMatKhauMoi.Text == txtNhapLaiMK.Text)
                {
                    _sqlCommand.CommandText = "update NGUOIDUNG set MatKhau='" + txtMatKhauMoi.Text + "' where TenDNhap like '" + frmDangNhap.TenDangNhap.ToString() + "'";
                    _sqlCommand.ExecuteReader();
                    MessageBox.Show("Tài Khoản \"" + frmDangNhap.TenDangNhap + "\" đã được thay đổi mật khẩu thành công");
                    ((Form)this.TopLevelControl).Close();
                }
                else MessageBox.Show("Hai Mật Khẩu Không Trùng Nhau");
            }
            else
            {
                MessageBox.Show("Mật Khẩu Cũ Không Đúng !!");
            }
        }
    }
}
