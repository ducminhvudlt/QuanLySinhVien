using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace QLSV1
{
    class ConnectionLopTinChi
    {
        Connection conn = new Connection();

        public void LayDuLieuTuBangLopTinChi(DataGridView _gridView)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("SELECT * FROM vw_LOPTINCHI_ThongTinLopTinChi", conn._sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.Text;
                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);
                    _gridView.DataSource = _dt;
                }
            }
        }

        public void TimKiemLopTinChiTheoMaGiaoVIen(string _maGiaoVien, DataGridView _gridView)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_LOPTINCHI_LayThongTinTheoMaGV", conn._sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.StoredProcedure;
                    _sqlCom.Parameters.Add("@MaGV", SqlDbType.NVarChar).Value = _maGiaoVien;
                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);
                    _gridView.DataSource = _dt;
                }
            }
        }

        public void TimKiemLopTinChiTheoTenGiaoVien(string _tenGiaoVien, DataGridView _gridView)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_LOPTINCHI_LayThongTinTheoTenGV", conn._sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.StoredProcedure;
                    _sqlCom.Parameters.Add("@TenGV", SqlDbType.NVarChar).Value = _tenGiaoVien;
                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);
                    _gridView.DataSource = _dt;
                }
            }

        }

        public void TimKiemLopTinChiTheoTenNamHoc(string _tenNamHoc, DataGridView _gridView)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_LOPTINCHI_LayThongTinTheoTenNH", conn._sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.StoredProcedure;
                    _sqlCom.Parameters.Add("@TenNH", SqlDbType.NVarChar).Value = _tenNamHoc;
                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);
                    _gridView.DataSource = _dt;
                }
            }

        }

        public void TimKiemLopTinChiTheoTenKhoa(string _tenKhoa, DataGridView _gridView)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_LOPTINCHI_LayThongTinTheoKhoa", conn._sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.StoredProcedure;
                    _sqlCom.Parameters.Add("@TenKhoa", SqlDbType.NVarChar).Value = _tenKhoa;
                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);
                    _gridView.DataSource = _dt;
                }
            }
        }

        public void XoaLopTinChi(string _maLopTinChi, string _tenNamHoc)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_PHANCONG_XoaLopTinChi", conn._sqlConnection))
                {
                    try
                    {
                        _sqlCom.CommandType = CommandType.StoredProcedure;
                        _sqlCom.Parameters.Add("@MaLopTC", SqlDbType.NVarChar).Value = _maLopTinChi;
                        _sqlCom.Parameters.Add("@TenNH", SqlDbType.NVarChar).Value = _tenNamHoc;
                        conn._sqlConnection.Open();
                        _sqlCom.ExecuteNonQuery();
                        MessageBox.Show("Xóa dữ liệu thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                    catch (Exception e)
                    {
                        MessageBox.Show("Xóa dữ liệu thất bại !"+e, "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    finally
                    {
                        conn._sqlConnection.Close();
                    }
                }
            }
        }

        public void ThemLopTinChi(string _tenNamHoc, string _tenGiaoVien, string _tenMonHoc, string _maLopTinChi, string _siSo)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_PHANCONG_ThemVaoBang", conn._sqlConnection))
                {
                    try
                    {
                        _sqlCom.CommandType = CommandType.StoredProcedure;

                        _sqlCom.Parameters.Add("@TenNH", SqlDbType.NVarChar).Value = _tenNamHoc;
                        _sqlCom.Parameters.Add("@TenGV", SqlDbType.NVarChar).Value = _tenGiaoVien;
                        _sqlCom.Parameters.Add("@TenMonHoc", SqlDbType.NVarChar).Value = _tenMonHoc;
                        _sqlCom.Parameters.Add("@MaLopTC", SqlDbType.NVarChar).Value = _maLopTinChi;
                        _sqlCom.Parameters.Add("@SiSo", SqlDbType.NVarChar).Value = _siSo;
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

        public void SuaThongTinLopTinChi(string _maLopTinChiTruoc, string _maLopTinChiSau, string _tenNamHocTruoc, string _tenNamHocSau, string _tenMonHoc, string _tenGiaoVien, string _siSo)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_PHANCONG_SuaThongTin", conn._sqlConnection))
                {
                    try
                    {
                        _sqlCom.CommandType = CommandType.StoredProcedure;
                        _sqlCom.Parameters.Add("@MaLopTCTruoc", SqlDbType.VarChar).Value = _maLopTinChiTruoc;
                        _sqlCom.Parameters.Add("@MaLopTCSau", SqlDbType.NVarChar).Value = _maLopTinChiSau;
                        _sqlCom.Parameters.Add("@TenNamHocTruoc", SqlDbType.NVarChar).Value = _tenNamHocTruoc;
                        _sqlCom.Parameters.Add("@TenNamHocSau", SqlDbType.NVarChar).Value = _tenNamHocSau;
                        _sqlCom.Parameters.Add("@TenMonHoc", SqlDbType.NVarChar).Value = _tenMonHoc;
                        _sqlCom.Parameters.Add("@TenGV", SqlDbType.NVarChar).Value = _tenGiaoVien;
                        _sqlCom.Parameters.Add("@SiSo", SqlDbType.NVarChar).Value = _siSo;
                        conn._sqlConnection.Open();
                        _sqlCom.ExecuteNonQuery();
                        MessageBox.Show("Sửa dữ liệu thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                    catch (Exception e)
                    {
                        MessageBox.Show("Sửa dữ liệu thất bại"+e, "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    finally
                    {
                        conn._sqlConnection.Close();
                    }
                }
            }
        }
    }
}
