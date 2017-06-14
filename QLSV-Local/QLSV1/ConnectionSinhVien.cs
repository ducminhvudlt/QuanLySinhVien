using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace QLSV1
{
    class ConnectionSinhVien
    {
        Connection conn = new Connection();

        public void LayDuLieuTuBangSinhVien(DataGridView _gridView)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("SELECT * FROM vw_SINHVIEN_ThongTinSinhVien", conn._sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.Text;
                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);
                    _gridView.DataSource = _dt;
                }
            }
        }

        public void TimKiemSinhVienTheoTen(string _tenHocSinh, DataGridView _gridView)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_SINHVIEN_LayThongTinSinhVienTheoHoTen", conn._sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.StoredProcedure;
                    _sqlCom.Parameters.Add("@HoTen", SqlDbType.NVarChar).Value = _tenHocSinh;
                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);
                    _gridView.DataSource = _dt;
                }
            }

        }

        public void TimKiemSinhVienTheoMaSV(string _maSinhVien, DataGridView _gridView)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_SINHVIEN_LayThongTinSinhVienTheoMaSV", conn._sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.StoredProcedure;
                    _sqlCom.Parameters.Add("@MaSV", SqlDbType.NVarChar).Value = _maSinhVien;
                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);
                    _gridView.DataSource = _dt;
                }
            }
        }

        public void TimKiemSinhVienTheoTenLop(string _tenLop, DataGridView _gridView)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_SINHVIEN_LayThongTinSinhVienTheoTenLop", conn._sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.StoredProcedure;
                    _sqlCom.Parameters.Add("@TenLop", SqlDbType.NVarChar).Value = _tenLop;
                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);
                    _gridView.DataSource = _dt;
                }
            }
        }

        public void TimKiemSinhVienTheoTenKhoa(string _tenKhoa, DataGridView _gridView)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_SINHVIEN_LayThongTinSinhVienTheoTenKhoa", conn._sqlConnection))
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

        public void XoaThongTinSinhVien(string _maSinhVien)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_SINHVIEN_XoaThongTinSinhVien", conn._sqlConnection))
                {
                    try
                    {
                        _sqlCom.CommandType = CommandType.StoredProcedure;
                        _sqlCom.Parameters.Add("@MaSV", SqlDbType.VarChar).Value = _maSinhVien;
                        conn._sqlConnection.Open();
                        _sqlCom.ExecuteNonQuery();
                        MessageBox.Show("Xóa dữ liệu thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                    catch
                    {
                        MessageBox.Show("Xóa dữ liệu thất bại !", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    finally
                    {
                        conn._sqlConnection.Close();
                    }
                }
            }
        }

        public void ThemThongTinSinhVien(string _maSinhVien, string _hoTen, string _gioiTinh, string _ngaySinh, string _noiSinh,
               string _danToc, string _tonGiao, string _hoTenCha, string _ngheCha, string _hoTenMe, string _ngheMe, string _dienThoai, string _tenLop)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_SINHVIEN_ThemThongTinSinhVien", conn._sqlConnection))
                {
                    try
                    {
                        _sqlCom.CommandType = CommandType.StoredProcedure;

                        _sqlCom.Parameters.Add("@MaSV", SqlDbType.NVarChar).Value = _maSinhVien;
                        _sqlCom.Parameters.Add("@HoTen", SqlDbType.NVarChar).Value = _hoTen;
                        _sqlCom.Parameters.Add("@GioiTinhNamNu", SqlDbType.NVarChar).Value = _gioiTinh;
                        _sqlCom.Parameters.Add("@NgaySinh", SqlDbType.DateTime).Value = _ngaySinh;
                        _sqlCom.Parameters.Add("@NoiSinh", SqlDbType.NVarChar).Value = _noiSinh;
                        _sqlCom.Parameters.Add("@TenDanToc", SqlDbType.NVarChar).Value = _danToc;
                        _sqlCom.Parameters.Add("@TenTonGiao", SqlDbType.NVarChar).Value = _tonGiao;
                        _sqlCom.Parameters.Add("@HoTenCha", SqlDbType.NVarChar).Value = _hoTenCha;
                        _sqlCom.Parameters.Add("@TenNgheCha", SqlDbType.NVarChar).Value = _ngheCha;
                        _sqlCom.Parameters.Add("@HoTenMe", SqlDbType.NVarChar).Value = _hoTenMe;
                        _sqlCom.Parameters.Add("@TenNgheMe", SqlDbType.NVarChar).Value = _ngheMe;
                        _sqlCom.Parameters.Add("@DienThoai", SqlDbType.NVarChar).Value = _dienThoai;
                        _sqlCom.Parameters.Add("@TenLop", SqlDbType.NVarChar).Value = _tenLop;
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

        public void ThemThongTinSinhVienAll(string _maSinhVien, string _hoTen, string _gioiTinh, string _ngaySinh, string _noiSinh,
               string _danToc, string _tonGiao, string _hoTenCha, string _ngheCha, string _hoTenMe, string _ngheMe, string _dienThoai, string _tenLop)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_SINHVIEN_ThemThongTinSinhVien", conn._sqlConnection))
                {
                    try
                    {
                        _sqlCom.CommandType = CommandType.StoredProcedure;

                        _sqlCom.Parameters.Add("@MaSV", SqlDbType.NVarChar).Value = _maSinhVien;
                        _sqlCom.Parameters.Add("@HoTen", SqlDbType.NVarChar).Value = _hoTen;
                        _sqlCom.Parameters.Add("@GioiTinhNamNu", SqlDbType.NVarChar).Value = _gioiTinh;
                        _sqlCom.Parameters.Add("@NgaySinh", SqlDbType.DateTime).Value = _ngaySinh;
                        _sqlCom.Parameters.Add("@NoiSinh", SqlDbType.NVarChar).Value = _noiSinh;
                        _sqlCom.Parameters.Add("@TenDanToc", SqlDbType.NVarChar).Value = _danToc;
                        _sqlCom.Parameters.Add("@TenTonGiao", SqlDbType.NVarChar).Value = _tonGiao;
                        _sqlCom.Parameters.Add("@HoTenCha", SqlDbType.NVarChar).Value = _hoTenCha;
                        _sqlCom.Parameters.Add("@TenNgheCha", SqlDbType.NVarChar).Value = _ngheCha;
                        _sqlCom.Parameters.Add("@HoTenMe", SqlDbType.NVarChar).Value = _hoTenMe;
                        _sqlCom.Parameters.Add("@TenNgheMe", SqlDbType.NVarChar).Value = _ngheMe;
                        _sqlCom.Parameters.Add("@DienThoai", SqlDbType.NVarChar).Value = _dienThoai;
                        _sqlCom.Parameters.Add("@TenLop", SqlDbType.NVarChar).Value = _tenLop;
                        conn._sqlConnection.Open();
                        _sqlCom.ExecuteNonQuery();
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

        public void SuaThongTinSinhVien(string _maSinhVienTruoc, string _maSinhVien, string _hoTen, string _gioiTinh, string _ngaySinh, string _noiSinh,
               string _danToc, string _tonGiao, string _hoTenCha, string _ngheCha, string _hoTenMe, string _ngheMe, string _dienThoai, string _tenLop)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_SINHVIEN_SuaThongTinSinhVien", conn._sqlConnection))
                {
                    try
                    {
                        _sqlCom.CommandType = CommandType.StoredProcedure;
                        _sqlCom.Parameters.Add("@MaSVTruoc", SqlDbType.VarChar).Value = _maSinhVienTruoc;
                        _sqlCom.Parameters.Add("@MaSV", SqlDbType.NVarChar).Value = _maSinhVien;
                        _sqlCom.Parameters.Add("@HoTen", SqlDbType.NVarChar).Value = _hoTen;
                        _sqlCom.Parameters.Add("@GioiTinhNamNu", SqlDbType.NVarChar).Value = _gioiTinh;
                        _sqlCom.Parameters.Add("@NgaySinh", SqlDbType.DateTime).Value = _ngaySinh;
                        _sqlCom.Parameters.Add("@NoiSinh", SqlDbType.NVarChar).Value = _noiSinh;
                        _sqlCom.Parameters.Add("@TenDanToc", SqlDbType.NVarChar).Value = _danToc;
                        _sqlCom.Parameters.Add("@TenTonGiao", SqlDbType.NVarChar).Value = _tonGiao;
                        _sqlCom.Parameters.Add("@HoTenCha", SqlDbType.NVarChar).Value = _hoTenCha;
                        _sqlCom.Parameters.Add("@TenNgheCha", SqlDbType.NVarChar).Value = _ngheCha;
                        _sqlCom.Parameters.Add("@HoTenMe", SqlDbType.NVarChar).Value = _hoTenMe;
                        _sqlCom.Parameters.Add("@TenNgheMe", SqlDbType.NVarChar).Value = _ngheMe;
                        _sqlCom.Parameters.Add("@DienThoai", SqlDbType.NVarChar).Value = _dienThoai;
                        _sqlCom.Parameters.Add("@TenLop", SqlDbType.NVarChar).Value = _tenLop;
                        conn._sqlConnection.Open();
                        _sqlCom.ExecuteNonQuery();
                        MessageBox.Show("Sửa dữ liệu thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                    catch (Exception)
                    {
                        MessageBox.Show("Sửa dữ liệu thất bại", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
