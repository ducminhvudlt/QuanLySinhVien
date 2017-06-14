using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace QLSV1
{
    class ConnectionGiangVien
    {
        Connection conn = new Connection();

        public void LayDuLieuTuBangGiangVien(DataGridView _gridView)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("SELECT * FROM vw_GIANGVIEN_ThongTinGiangVien", conn._sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.Text;
                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);
                    _gridView.DataSource = _dt;
                }
            }
        }

        public void TimKiemGiangVienTheoTenGV(string _tenGiangVien, DataGridView _gridView)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_GIANGVIEN_LayThongTinGiangVienTheoHoTen", conn._sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.StoredProcedure;
                    _sqlCom.Parameters.Add("@HoTen", SqlDbType.NVarChar).Value = _tenGiangVien;
                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);
                    _gridView.DataSource = _dt;
                }
            }
        }

        public void TimKiemGiangVienTheoMaGV(string _maGiangVien, DataGridView _gridView)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_GIANGVIEN_LayThongTinGiangVienTheoMaGV", conn._sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.StoredProcedure;
                    _sqlCom.Parameters.Add("@MaGV", SqlDbType.NVarChar).Value = _maGiangVien;
                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);
                    _gridView.DataSource = _dt;
                }
            }
        }

        public void TimKiemGiangVienTheoTenMon(string _tenMon, DataGridView _gridView)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_GIANGVIEN_LayThongTinGiangVienTheoTenMon", conn._sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.StoredProcedure;
                    _sqlCom.Parameters.Add("@TenMon", SqlDbType.NVarChar).Value = _tenMon;
                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);
                    _gridView.DataSource = _dt;
                }
            }
        }

        public void TimKiemGiangVienTheoTenKhoa(string _tenKhoa, DataGridView _gridView)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_GIANGVIEN_LayThongTinGiangVienTheoTenKhoa", conn._sqlConnection))
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
    }
}
