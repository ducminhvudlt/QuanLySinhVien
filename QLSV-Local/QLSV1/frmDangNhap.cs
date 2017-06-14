using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Configuration;

namespace QLSV1
{
    public partial class frmDangNhap : Form
    {
        public static int QuyenNguoiDung;
        public frmDangNhap()
        {
            InitializeComponent();
        }
        private CommonConnect cc = new CommonConnect();
        private SqlConnection con;
        private DataTable dt = new DataTable("User");
        private SqlDataAdapter da = new SqlDataAdapter();        
        public static string TenDangNhap;

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            SqlCommand command = new SqlCommand();
            command.Connection = con;
            command.CommandType = CommandType.Text;
            command.CommandText = @"Select * From NGUOIDUNG
                                            Where (TenDNhap=@TenDNhap)
                                            And (MatKhau=@MatKhau)";
            command.Parameters.Add("@TenDNhap", SqlDbType.VarChar, 30).Value = txtTenDangNhap.Text;
            //command.Parameters.Add("@MatKhau", SqlDbType.VarChar, 30).Value = MaHoa.MaHoaMD5(txtMatKhau.Text);
            command.Parameters.Add("@MatKhau", SqlDbType.VarChar, 30).Value = (txtMatKhau.Text);
            da.SelectCommand = command;
            da.Fill(dt);
            
            if (dt.Rows.Count > 0)
            {
                frmTrangChu frmTrangChu = new frmTrangChu();
                TenDangNhap = txtTenDangNhap.Text;
                if (dt.Rows[0][1].ToString() == "LND001")
                    QuyenNguoiDung = 1;//admin
                else if(dt.Rows[0][1].ToString() == "LND002")
                    QuyenNguoiDung = 2;//Giảng Viên
                else QuyenNguoiDung = 3;//Sinh Viên
                frmTrangChu.LoaiNguoiDung = QuyenNguoiDung;
                frmTrangChu.PhanQuyen(frmTrangChu.LoaiNguoiDung);
                frmTrangChu.Show();
                this.Hide();
            }
            else
            {
                if (MessageBox.Show("Đăng nhập thất bại, bạn có muốn đăng nhập lại không ?", "ĐĂNG NHẬP", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    txtTenDangNhap.Focus();
                }
                else
                {
                    Close();
                    Application.Exit();
                }
            }
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có chắc chắn muốn thoát không ?", "Thoát", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                Close();
                Application.Exit();
            }
        }

        class CommonConnect
        {
            private SqlConnection conn;
            public SqlConnection Connected()
            {
                string connect = SystemInformation.UserDomainName.ToString();
                string source = "Data Source=.;Initial Catalog=QLSINHVIEN;Integrated Security=True";
                conn = new SqlConnection(source);
                conn.Open();
                return conn;
            }
        }

        private void frmDangNhap_Load(object sender, EventArgs e)
        {
            txtMatKhau.PasswordChar = '.';
            txtMatKhau.MaxLength = 44;
            this.AcceptButton = btnDangNhap;
            con = cc.Connected();
            if (con.State == ConnectionState.Open)
                cbbTenServer.Items.Add(SystemInformation.UserDomainName.ToString() + "\\SQLServer");
            cbbTenServer.Text = cbbTenServer.Items[0].ToString();
        }
    }
}
