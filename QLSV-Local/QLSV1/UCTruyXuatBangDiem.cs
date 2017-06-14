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
    public partial class UCTruyXuatBangDiem : UserControl
    {
        Connection conn = new Connection();
        

        public static string BangDiem_MaSoSinhVien;

        public UCTruyXuatBangDiem()
        {
            InitializeComponent();

            
            txtMaSoSinhVien.KeyDown += new KeyEventHandler(txtMaSoSinhVien_KeyDown);

            dataGridView.DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridView.RowHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridView.ColumnHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridView.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridView.RowHeadersWidthSizeMode = DataGridViewRowHeadersWidthSizeMode.AutoSizeToAllHeaders;

            dataGridView.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
            dataGridView.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;

            dataGridView.RowsDefaultCellStyle.BackColor = Color.Bisque;
            dataGridView.AlternatingRowsDefaultCellStyle.BackColor = Color.Beige;
            dataGridView.CellBorderStyle = DataGridViewCellBorderStyle.SingleHorizontal;

            dataGridView.DefaultCellStyle.SelectionBackColor = Color.Red;
            dataGridView.DefaultCellStyle.SelectionForeColor = Color.Yellow;

            dataGridView.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridView.AllowUserToResizeColumns = false;
            dataGridView.ReadOnly = true;
            dataGridView.AllowUserToAddRows = false;
            dataGridView.RowHeadersVisible = false;
            dataGridView.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;

            if (frmTrangChu.LoaiNguoiDung == 3)//sinh viên
            {
                txtMaSoSinhVien.Text = frmDangNhap.TenDangNhap.ToUpper();
                XuatRaBangDiem(txtMaSoSinhVien.Text);
                btnInDanhSach.Visible = true;
                buttonX1.Visible = false;
                txtMaSoSinhVien.Enabled = false;
            }
        }

        void txtMaSoSinhVien_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                XuatRaBangDiem(txtMaSoSinhVien.Text);
                
            }
        }

        private void txtMaSoSinhVien_Enter(object sender, EventArgs e)
        {
            XuatRaBangDiem(txtMaSoSinhVien.Text);
        }

        private void XuatRaBangDiem(string _maSoSinhVien)
        {
            SqlConnection _sqlConnection;
            using (_sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                string _select = @"select MaNamHoc as[Năm Học],MaHocKy as[Học Kì],KQ_HOC_KY_MON_HOC.MaMonHoc as[Mã Môn Học],TenMonHoc as[Tên Môn Học],SoTinChi as[Số Tín Chỉ],DTBMonHocKy as[Điểm Trung Bình],
                                    case
	                                    when DTBMonHocKy<4 then 'F'
	                                    when DTBMonHocKy<5.5 then 'D'
	                                    when DTBMonHocKy<7 then 'C'
	                                    when DTBMonHocKy<8.5 then 'B'
	                                    when DTBMonHocKy<=10 then 'A'
                                    end as [Điểm Chữ]
                                    from KQ_HOC_KY_MON_HOC
                                    left join MONHOC
                                    on KQ_HOC_KY_MON_HOC.MaMonHoc=MONHOC.MaMonHoc
                                    where MaSINHVIEN like'" + _maSoSinhVien + "'";
                using (SqlCommand _sqlCom = new SqlCommand(_select, _sqlConnection))
                {
                    {
                        SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                        DataSet _ds = new DataSet();
                        _sqlDa.Fill(_ds);                    
                        
                        dataGridView.DataSource = _ds.Tables[0];
                        if (dataGridView.RowCount == 0)
                        {
                            MessageBox.Show("Mã Số Sinh Viên Này Không Tồn Tại");

                            btnInDanhSach.Visible = false;
                        }
                        else
                        {
                            BangDiem_MaSoSinhVien = txtMaSoSinhVien.Text;
                            btnInDanhSach.Visible = true;                            
                        }
                    }
                }
            }
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            XuatRaBangDiem(txtMaSoSinhVien.Text);
            dataGridView.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
        }

        private void btnInReport_Click(object sender, EventArgs e)
        {
            RPTruyXuatBangDiem rpTruyXuatBangDiem = new RPTruyXuatBangDiem();
            rpTruyXuatBangDiem.ShowDialog();
        }

    
    }
}
