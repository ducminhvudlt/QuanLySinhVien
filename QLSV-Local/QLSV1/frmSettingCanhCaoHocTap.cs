using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace QLSV1
{
    public partial class frmSettingCanhCaoHocTap : Form
    {
        public static decimal CanhCao1=4;
        public static decimal CanhCao2 = 8;
        public static decimal CanhCao3 = 12;
        public frmSettingCanhCaoHocTap()
        {
            InitializeComponent();

            LayDuLieu();

            CanhCao1=updMucMot.Value;
            CanhCao2=updMucHai.Value;
            CanhCao3=updMucBa.Value;
        }

        private void frmSettingCanhCaoHocTap_Load(object sender, EventArgs e)
        {

        }

        private bool KiemTra()
        {
            if ((updMucMot.Value < updMucHai.Value) && (updMucHai.Value < updMucBa.Value)) return true;
            else return false;
        }

        private void updMucMot_ValueChanged(object sender, EventArgs e)
        {
            if (updMucMot.Value >= updMucHai.Value)
            {
                MessageBox.Show("Số tín chỉ nợ của mức cảnh cáo 1 phải bé hơn mức cảnh cáo 2");
                updMucMot.Value = CanhCao1;
            }
        }

        private void updMucHai_ValueChanged(object sender, EventArgs e)
        {
            if (updMucHai.Value >= updMucBa.Value)
            {
                MessageBox.Show("Số tín chỉ nợ của mức cảnh cáo 2 phải bé hơn mức cảnh cáo 3");
                updMucHai.Value = CanhCao2;
            }
        }

        private void btnLuuLai_Click(object sender, EventArgs e)
        {
            if (updMucHai.Value < updMucBa.Value && updMucMot.Value < updMucHai.Value)
            {
                CanhCao1 = updMucMot.Value;
                CanhCao2 = updMucHai.Value;
                CanhCao3 = updMucBa.Value;
                LuuDuLieu();
                MessageBox.Show("Bạn Đã Lưu Dữ Liệu Thành Công");
                this.Close();
            }
            else
            {
                MessageBox.Show("Dữ Liệu Không Thỏa Mãn");
            }
            
        }

        private void LayDuLieu()
        {
            Connection conn = new Connection();
            SqlConnection _sqlConnection;
            _sqlConnection = new SqlConnection(conn._sqlConnectionString);
            _sqlConnection.Open();
            SqlCommand _sqlCommand = new SqlCommand();
            _sqlCommand.Connection = _sqlConnection;
            _sqlCommand.CommandText = @"select * from vw_MDCCHT_XemThongTin";
            SqlDataReader _sqlDataReader = _sqlCommand.ExecuteReader();
            System.Data.DataTable _dataTable = new System.Data.DataTable();
            _dataTable.Load(_sqlDataReader);
            if (_dataTable != null)
            {
                updMucMot.Value = decimal.Parse(_dataTable.Rows[0][1].ToString().ToUpper());
                updMucHai.Value = decimal.Parse(_dataTable.Rows[1][1].ToString().ToUpper());
                updMucBa.Value = decimal.Parse(_dataTable.Rows[2][1].ToString().ToUpper());
            }
        }
        private void LuuDuLieu()
        {

            Connection conn = new Connection();
            SqlConnection _sqlConnection;
            using (_sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_MDCCHT_SuaMucCanhCao", _sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.StoredProcedure;
                    _sqlCom.Parameters.Add("@Muc1", SqlDbType.NVarChar).Value = updMucMot.Value;
                    _sqlCom.Parameters.Add("@Muc2", SqlDbType.NVarChar).Value = updMucHai.Value;
                    _sqlCom.Parameters.Add("@Muc3", SqlDbType.NVarChar).Value = updMucBa.Value;
                    _sqlConnection.Open();
                    _sqlCom.ExecuteNonQuery();
                    LayDuLieu();
                }
            }
        }
    }
}
