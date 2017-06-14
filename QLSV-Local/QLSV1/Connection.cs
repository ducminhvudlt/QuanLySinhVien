using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace QLSV1
{ 
    class Connection
    {
        public string _sqlConnectionString = @"Data Source=.;Initial Catalog=QLSINHVIEN;Integrated Security=True";
        public SqlConnection _sqlConnection;

        public void LayDuLieuTuBangKhac(string _tenBang, DataGridView _gridView)
        {
            using (_sqlConnection = new SqlConnection(_sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("SELECT * FROM " + _tenBang, _sqlConnection))
                {
                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);
                    _gridView.DataSource = _dt;
                }
            }
        }
    }
}
