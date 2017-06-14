using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace QLSV1
{
    class ConnectionThemSVVaoLop
    {
        Connection conn = new Connection();

        public void ThemLopSinhVienVaoLopTinChi(string _maSinhVien, string _tenHocKy, string _tenNamHoc, string _maLopTinChi, string _tenMonHoc)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_DIEM_ThemVaoLopTinChi", conn._sqlConnection))
                {
                    try
                    {
                        _sqlCom.CommandType = CommandType.StoredProcedure;

                        _sqlCom.Parameters.Add("@MaSINHVIEN", SqlDbType.NVarChar).Value = _maSinhVien;
                        _sqlCom.Parameters.Add("@TenHocKy", SqlDbType.NVarChar).Value = _tenHocKy;
                        _sqlCom.Parameters.Add("@TenNamHoc", SqlDbType.NVarChar).Value = _tenNamHoc;
                        _sqlCom.Parameters.Add("@MaLopTC", SqlDbType.NVarChar).Value = _maLopTinChi;
                        _sqlCom.Parameters.Add("@TenMonHoc", SqlDbType.NVarChar).Value = _tenMonHoc;
                        conn._sqlConnection.Open();
                        _sqlCom.ExecuteNonQuery();
                        MessageBox.Show("Thêm dữ liệu thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                    catch (Exception)
                    {
                        MessageBox.Show("Nhập thông tin sai, xin vui lòng nhập lại", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    finally
                    {
                        conn._sqlConnection.Close();
                    }
                }
            }
        }

        public void LayDuLieuSinhVienCacLopTinChi(DataGridView _gridView)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("SELECT * FROM vw_LOPTINCHI_SinhVienCacLopTinChi", conn._sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.Text;
                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);
                    _gridView.DataSource = _dt;
                }
            }
        }
    }
}
