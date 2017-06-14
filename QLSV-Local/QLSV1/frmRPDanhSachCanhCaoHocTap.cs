using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.ReportSource;
using System.Data.SqlClient;

namespace QLSV1
{
    public partial class frmRPDanhSachCanhCaoHocTap : Form
    {
        public frmRPDanhSachCanhCaoHocTap()
        {
            InitializeComponent();
        }    
      
        private void crystalReportViewer_Load(object sender, EventArgs e)
        {
            /*
            ReportDocument rptDoc = new ReportDocument();
            string _fileReport ="RPCanhCaoSVHocTap.rpt";
            //string _fileReport = Application.StartupPath.Substring(0, Application.StartupPath.Substring(0, Application.StartupPath.LastIndexOf("\\")).LastIndexOf("\\")) + @"\\RPCanhCaoSVHocTap.rpt";
            
            rptDoc.Load(_fileReport);

            rptDoc.SetParameterValue("@Muc1",frmSettingCanhCaoHocTap.CanhCao1 );
            rptDoc.SetParameterValue("@Muc2",frmSettingCanhCaoHocTap.CanhCao2 );
            rptDoc.SetParameterValue("@Muc3",frmSettingCanhCaoHocTap.CanhCao3 );
            rptDoc.SetParameterValue("@Chon1",UCKetQuaXuLyHocTap._isChon1 );
            rptDoc.SetParameterValue("@Chon2",UCKetQuaXuLyHocTap._isChon2 );
            rptDoc.SetParameterValue("@Chon3", UCKetQuaXuLyHocTap._isChon3);

            crystalReportViewer.ReportSource = rptDoc;
            //crystalReportViewer.Refresh();


            CrystalDecisions.CrystalReports.Engine.TextObject txtNgayThang;
            
           
            txtNgayThang = rptDoc.ReportDefinition.ReportObjects["txtNgayThang"] as TextObject;
            txtNgayThang.Text = "TP.Hồ Chí Minh,ngày " + DateTime.Today.ToString("dd") + " tháng " + DateTime.Today.ToString("MM") + " năm " + DateTime.Today.ToString("yyyy");
                */

            Connection conn = new Connection();
            SqlConnection _sqlConnection;
            using (_sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_DIEM_XetCanhCaoHocTap", _sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.StoredProcedure;

                    _sqlCom.Parameters.Add("@Muc1", SqlDbType.NVarChar).Value = frmSettingCanhCaoHocTap.CanhCao1;
                    _sqlCom.Parameters.Add("@Muc2", SqlDbType.NVarChar).Value = frmSettingCanhCaoHocTap.CanhCao2;
                    _sqlCom.Parameters.Add("@Muc3", SqlDbType.NVarChar).Value = frmSettingCanhCaoHocTap.CanhCao3;
                    _sqlCom.Parameters.Add("@Chon1", SqlDbType.NVarChar).Value = UCKetQuaXuLyHocTap._isChon1;
                    _sqlCom.Parameters.Add("@Chon2", SqlDbType.NVarChar).Value = UCKetQuaXuLyHocTap._isChon2;
                    _sqlCom.Parameters.Add("@Chon3", SqlDbType.NVarChar).Value = UCKetQuaXuLyHocTap._isChon3;


                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);

                    RPCanhCaoSVHocTap rptDoc = new RPCanhCaoSVHocTap();
                    rptDoc.SetDataSource(_dt);
                    crystalReportViewer.ReportSource = rptDoc;

                    CrystalDecisions.CrystalReports.Engine.TextObject txtNgayThang;


                    txtNgayThang = rptDoc.ReportDefinition.ReportObjects["txtNgayThang"] as TextObject;
                    txtNgayThang.Text = "TP.Hồ Chí Minh,ngày " + DateTime.Today.ToString("dd") + " tháng " + DateTime.Today.ToString("MM") + " năm " + DateTime.Today.ToString("yyyy");
                }
            }
           
        }        
    }
}
