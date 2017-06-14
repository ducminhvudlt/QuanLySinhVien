using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace QLSV1
{
    class DoDuLieuVaoComboBox
    {
        Connection conn = new Connection();

        public void LayDuLieuVaoComboBox(ComboBox _comboBox, String _tenCot, String _tenBang)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("SELECT " + _tenCot + " FROM " + _tenBang, conn._sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.Text;
                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);
                    _comboBox.DataSource = _dt;
                    _comboBox.DisplayMember = _tenCot;
                    _comboBox.ValueMember = _tenCot;
                }
            }
        }

        public void LayDuLieuVaoComboBoxCoDieuKien(ComboBox _comboBox, String _tenCot, String _tenBang,String _dK)
        {
            using (conn._sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                try
                {
                    using (SqlCommand _sqlCom = new SqlCommand("SELECT DISTINCT " + _tenCot + " FROM " + _tenBang + " WHERE " + _dK, conn._sqlConnection))
                    {
                        _sqlCom.CommandType = CommandType.Text;
                        SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                        DataTable _dt = new DataTable();
                        _sqlDa.Fill(_dt);
                        _comboBox.DataSource = _dt;
                        _comboBox.DisplayMember = _tenCot;
                        _comboBox.ValueMember = _tenCot;
                    }
                }
                catch(Exception ex)
                {
                    MessageBox.Show(ex.ToString(),"LỖI");
                }
            }
        }
    }
}
