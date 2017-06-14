using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace QLSV1
{
    class ConnectionKhoa
    {
        Connection conn = new Connection();

        public void LayDuLieuTuBangKhoa(DataGridView _gridView)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("SELECT * FROM dbo.vw_KHOA_ThongTinKhoa", conn._sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.Text;
                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);
                    _gridView.DataSource = _dt;
                }
            }
        }

        public void TimKiemKhoaTheoMaKhoa(string _maKhoa, DataGridView _gridView)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_KHOA_LayThongTinKhoaTheoMaKhoa", conn._sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.StoredProcedure;
                    _sqlCom.Parameters.Add("@MaKhoa", SqlDbType.NVarChar).Value = _maKhoa;
                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);
                    _gridView.DataSource = _dt;
                }
            }
        }

        public void TimKiemKhoaTheoTenKhoa(string _tenKhoa, DataGridView _gridView)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_KHOA_LayThongTinKhoaTheoTenKhoa", conn._sqlConnection))
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
