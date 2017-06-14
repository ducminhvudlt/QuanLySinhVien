/*
 

USE QLSINHVIEN
GO

CREATE PROC sp_Diem_XemDiem
@maLopTC varchar(10),@NamHoc varchar(30),@HocKi varchar(4)
as
begin
(select a.*,b.[Điểm Cuối Kì] from (select Diem.MaSINHVIEN as[Mã Sinh Viên],HoTen as[Họ Tên],MaLop as [Lớp],Diem as[Điểm Giữa Kì] from DIEM left join SINHVIEN on DIEM.MaSINHVIEN=SINHVIEN.MaSINHVIEN left join NAMHOC on DIEM.MaNamHoc=NAMHOC.MaNamHoc where MaLopTC=@maLopTC and MaHocKy=@HocKi and TenNamHoc=@NamHoc and MaLoai='LD0001') a left join
(select HoTen as[Họ Tên],Diem.MaSINHVIEN as[Mã Sinh Viên],MaLop as [Lớp],Diem as[Điểm Cuối Kì] from DIEM left join SINHVIEN on DIEM.MaSINHVIEN=SINHVIEN.MaSINHVIEN left join NAMHOC on DIEM.MaNamHoc=NAMHOC.MaNamHoc where MaLopTC=@maLopTC and MaHocKy=@HocKi and TenNamHoc=@NamHoc and MaLoai='LD0002') b
on a.[Mã Sinh Viên]=b.[Mã Sinh Viên])
end
 */
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
    public partial class UCQuanLyDiem : UserControl
    {
        private float DiemHienTai;
        DoDuLieuVaoComboBox connComboBox = new DoDuLieuVaoComboBox();
        Connection conn = new Connection();
        private static bool isSelect;
        public UCQuanLyDiem()
        {
            InitializeComponent();

            connComboBox.LayDuLieuVaoComboBox(cboMaLopTinChi, "MaLopTC", "LOPTINCHI");
            connComboBox.LayDuLieuVaoComboBox(cboNamHoc, "TenNamHoc", "NamHOc");
            connComboBox.LayDuLieuVaoComboBox(cboHocKi, "TenHocKy", "HOcKY");

            cboHocKi.Text = "Học kỳ 1";
            cboNamHoc.Text = "2009 - 2010";
            cboMaLopTinChi.Text = "LTC0001";

            ThietKeDataGridView();
            LoadBangDiem();
            Binding();
        }

        Control cnt;
        void dataGridView_EditingControlShowing(object sender, DataGridViewEditingControlShowingEventArgs e)
        {
            e.Control.TextChanged += new EventHandler(tb_TextChanged);
            cnt = e.Control;
            cnt.TextChanged += tb_TextChanged;
        }

        private bool KiemTraCoPhaiLaSoKhong()//true=ko phai la so
        {
            try
            {
                float _test = float.Parse(cnt.Text);
                if (_test > 10 || _test < 0) return true;
                return false; ;
            }
            catch (Exception)
            {
                return true;
            }
        }
        void tb_TextChanged(object sender, EventArgs e)
        {
            if (cnt.Text != string.Empty)
            {
                if (KiemTraCoPhaiLaSoKhong())
                {
                    MessageBox.Show("Không Đúng Định Dạng");
                    dataGridView[dataGridView.CurrentCell.ColumnIndex, dataGridView.CurrentCell.RowIndex].Value = null;
                }
            }
        }
        private void LoadBangDiem()
        {
            Connection conn = new Connection();
            SqlConnection _sqlConnection;
            using (_sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_Diem_XemDiem", _sqlConnection))
                {
                    try
                    {
                        _sqlCom.CommandType = CommandType.StoredProcedure;
                        _sqlCom.Parameters.Add("@maLopTC", SqlDbType.NVarChar).Value = cboMaLopTinChi.Text;
                        _sqlCom.Parameters.Add("@NamHoc", SqlDbType.NVarChar).Value = cboNamHoc.Text;
                        _sqlCom.Parameters.Add("@HocKi", SqlDbType.NVarChar).Value = cboHocKi.Text;
                        SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                        DataTable _dt = new DataTable();
                        _sqlDa.Fill(_dt);
                        dataGridView.DataSource = _dt;
                    }
                    catch (Exception)
                    {
                        MessageBox.Show("Nhập thông tin sai, xin vui lòng nhập lại");
                    }
                }
            }
        }

        private void ThietKeDataGridView()
        {
            dataGridView.DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridView.RowHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridView.ColumnHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dataGridView.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridView.RowHeadersWidthSizeMode = DataGridViewRowHeadersWidthSizeMode.AutoSizeToAllHeaders;

            dataGridView.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
            dataGridView.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;

            dataGridView.RowsDefaultCellStyle.BackColor = Color.Bisque;
            dataGridView.AlternatingRowsDefaultCellStyle.BackColor = Color.Beige;
            //dataGridView.CellBorderStyle = DataGridViewCellBorderStyle.SingleHorizontal;

            dataGridView.DefaultCellStyle.SelectionBackColor = Color.Red;
            dataGridView.DefaultCellStyle.SelectionForeColor = Color.Yellow;

            dataGridView.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridView.AllowUserToResizeColumns = false;

            dataGridView.ReadOnly = false;

            dataGridView.Columns[0].ReadOnly = true;
            dataGridView.Columns[1].ReadOnly = true;
            dataGridView.Columns[2].ReadOnly = true;
            dataGridView.Columns[3].ReadOnly = true;
            dataGridView.Columns[4].ReadOnly = true;

            dataGridView.AllowUserToAddRows = false;
            dataGridView.AllowUserToDeleteRows = false;
            dataGridView.RowHeadersVisible = false;
            dataGridView.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
        }

        private void cboMaLopTinChi_SelectedIndexChanged(object sender, EventArgs e)
        {
            isSelect = false;
            LoadBangDiem();
            Binding();
        }

        private void cboNamHoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            isSelect = false;
            LoadBangDiem();
            Binding();
        }

        private void cboHocKi_SelectedIndexChanged(object sender, EventArgs e)
        {
            isSelect = false;
            LoadBangDiem();
            Binding();
        }

        private void Binding()
        {
            txtMaSinhVien.DataBindings.Clear();
            txtMaSinhVien.DataBindings.Add("Text", dataGridView.DataSource, "Mã Sinh Viên");
            txtTenSinhVien.DataBindings.Clear();
            txtTenSinhVien.DataBindings.Add("Text", dataGridView.DataSource, "Họ Tên");
            txtTenLopPhanCong.DataBindings.Clear();
            txtTenLopPhanCong.DataBindings.Add("Text", dataGridView.DataSource, "Lớp");
            txtDiemGiuaKi.DataBindings.Clear();
            txtDiemGiuaKi.DataBindings.Add("Text", dataGridView.DataSource, "Điểm Giữa Kì");
            txtDiemCuoiKi.DataBindings.Clear();
            txtDiemCuoiKi.DataBindings.Add("Text", dataGridView.DataSource, "Điểm Cuối Kì");
        }

        private void dataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            Binding();
        }

        private void cboMaLopTinChi_TextChanged(object sender, EventArgs e)
        {
            isSelect = false;
            LoadBangDiem();
        }

        private void datagridview_SelectionChanged(object sender, EventArgs e)
        {
            dataGridView.ClearSelection();
        }

        private void dataGridView_CellEnter(object sender, DataGridViewCellEventArgs e)
        {
            if (isSelect)
            {
                dataGridView[e.ColumnIndex, e.RowIndex].Style.SelectionBackColor = Color.Blue;
            }
        }

        private void dataGridView_CellLeave(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                dataGridView[e.ColumnIndex, e.RowIndex].Style.SelectionBackColor = Color.Empty;
            }
            catch (Exception)
            {
                MessageBox.Show("Không đúng định dạng điểm");
            }
        }

        private void dataGridView_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex != -1)
            {
                isSelect = true;
                dataGridView[e.ColumnIndex, e.RowIndex].Style.SelectionBackColor = Color.Blue;
                if (e.ColumnIndex == 3 || e.ColumnIndex == 4)
                {
                    try
                    {
                        if (dataGridView[e.ColumnIndex, e.RowIndex].Value.ToString() != "") DiemHienTai = float.Parse(dataGridView[e.ColumnIndex, e.RowIndex].Value.ToString());
                        else DiemHienTai = 0;
                    }
                    catch (Exception)
                    {
                        MessageBox.Show("Điểm phải là số");
                    }
                }
            }
        }

        private void btnNhapDiem_Click(object sender, EventArgs e)
        {
            isSelect = false;
            if (btnNhapDiem.Text == "Nhập Điểm")
            {
                btnNhapDiem.Text = "Quay Lại";
                dataGridView.Columns[3].ReadOnly = false;
                dataGridView.Columns[4].ReadOnly = false;
                btnLuu.Enabled = true;
            }
            else
            {
                btnNhapDiem.Text = "Nhập Điểm";
                dataGridView.Columns[3].ReadOnly = true;
                dataGridView.Columns[4].ReadOnly = true;
                btnLuu.Enabled = false;
                LoadBangDiem();
            }
        }

        private void dataGridView_CellValueChanged(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 3)
            {
                txtDiemGiuaKi.Text = dataGridView[e.ColumnIndex, e.RowIndex].Value.ToString();
            }
            else
                txtDiemCuoiKi.Text = dataGridView[e.ColumnIndex, e.RowIndex].Value.ToString();
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            isSelect = false;
            LuuBangDiem();
            dataGridView.Columns[3].ReadOnly = true;
            dataGridView.Columns[4].ReadOnly = true;
        }

        private void LuuBangDiem()
        {
            btnLuu.Enabled = false;
            btnNhapDiem.Text = "Nhập Điểm";
            for (int i = 0; i < dataGridView.RowCount; i++)
            {
                for(int j=1;j<=2;j++)
                {
                Connection conn = new Connection();
                SqlConnection _sqlConnection;
                using (_sqlConnection = new SqlConnection(conn._sqlConnectionString))
                {
                    using (SqlCommand _sqlCom = new SqlCommand("sp_DIEM_ThemVaoDiemMotSinhVien", _sqlConnection))
                    {
                        try
                        {
                            _sqlCom.CommandType = CommandType.StoredProcedure;
                            _sqlCom.Parameters.Add("@TenHocKy", SqlDbType.NVarChar).Value = cboHocKi.Text;
                            _sqlCom.Parameters.Add("@TenNamHoc", SqlDbType.NVarChar).Value = cboNamHoc.Text;
                            _sqlCom.Parameters.Add("@MaLopTC", SqlDbType.NVarChar).Value = cboMaLopTinChi.Text;
                            _sqlConnection.Open();

                            _sqlCom.Parameters.Add("@MaSINHVIEN", SqlDbType.NVarChar).Value = dataGridView[0, i].Value.ToString();

                            if (j == 1)
                            {
                                _sqlCom.Parameters.Add("@TenLoaiDiem", SqlDbType.NVarChar).Value = "Kiểm Tra Giữa Kỳ";
                                try
                                {
                                    _sqlCom.Parameters.Add("@Diem", SqlDbType.NVarChar).Value = float.Parse(dataGridView[3, i].Value.ToString());
                                    _sqlCom.ExecuteNonQuery();
                                }
                                catch (Exception)
                                {                                    
                                }
                            }
                            else
                            {
                                _sqlCom.Parameters.Add("@TenLoaiDiem", SqlDbType.NVarChar).Value = "Kiểm Tra Cuối Kỳ";
                                try
                                {
                                    _sqlCom.Parameters.Add("@Diem", SqlDbType.NVarChar).Value = float.Parse(dataGridView[4, i].Value.ToString());
                                    _sqlCom.ExecuteNonQuery();
                                }
                                catch (Exception)
                                {                                    
                                }
                            }
                            


                            Binding();

                        }
                        catch (Exception)
                        {                            
                            MessageBox.Show("Nhập thông tin sai, xin vui lòng nhập lại");
                        }
                    }
                    }

                }
            }

        }

        private void dataGridView_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                if (dataGridView[e.ColumnIndex, e.RowIndex].Value.ToString() == "")
                {
                    MessageBox.Show("Điểm phải phải từ 0 đến 10");
                    dataGridView[e.ColumnIndex, e.RowIndex].Value = DiemHienTai.ToString();
                    //dataGridView[e.ColumnIndex, e.RowIndex].Value = null;
                }
                else
                {
                    float _diem = float.Parse(dataGridView[e.ColumnIndex, e.RowIndex].Value.ToString());
                    if (_diem > 10 || _diem < 0)
                    {
                        //dataGridView[e.ColumnIndex, e.RowIndex].Value = DiemHienTai.ToString();
                        dataGridView[e.ColumnIndex, e.RowIndex].Value = null;
                        MessageBox.Show("Điểm phải phải từ 0 đến 10");
                    }
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Điểm phải phải từ 0 đến 10");
                dataGridView[e.ColumnIndex, e.RowIndex].Value = null;
            }
        }

        private void grpTimKiem_Enter(object sender, EventArgs e)
        {

        }

        private void UCQuanLyDiem_Load(object sender, EventArgs e)
        {
            RefreshTrang();
        }

        private void dataGridView_DataError(object sender, DataGridViewDataErrorEventArgs e)
        {
            //MessageBox.Show(this, e.Exception.Message, "Lỗi Định Dạng");
            e.ThrowException = false;
            e.Cancel = false;
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            RefreshTrang();
        }
        private void RefreshTrang()
        {
            connComboBox.LayDuLieuVaoComboBox(cboMaLopTinChi, "MaLopTC", "LOPTINCHI");
            connComboBox.LayDuLieuVaoComboBox(cboNamHoc, "TenNamHoc", "NamHOc");
            connComboBox.LayDuLieuVaoComboBox(cboHocKi, "TenHocKy", "HOcKY");
            LoadBangDiem();
            Binding();
        }
    }
}

    

