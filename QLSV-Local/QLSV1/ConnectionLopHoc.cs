using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace QLSV1
{
    class ConnectionLopHoc
    {
        Connection conn = new Connection();

        public void LayDuLieuTuBangLopHoc(DataGridView _gridView)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("SELECT * FROM vw_LOPHOC_ThongTinLopHoc", conn._sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.Text;
                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);
                    _gridView.DataSource = _dt;
                }
            }
        }

        public void TimKiemLopHocTheoTenKhoa(string _tenKhoa, DataGridView _gridView)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_LOPHOC_LayThongTinLopHocTheoTenKhoa", conn._sqlConnection))
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
