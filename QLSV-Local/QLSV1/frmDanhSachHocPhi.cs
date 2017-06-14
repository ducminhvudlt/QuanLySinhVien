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
    public partial class RPDanhSachHocPhi : Form
    {
        public RPDanhSachHocPhi()
        {
            InitializeComponent();
        }

        private void crystalReportViewer_Load(object sender, EventArgs e)
        {
            /*
            ReportDocument rptDoc = new ReportDocument();
            string _fileReport = Application.StartupPath.Substring(0, Application.StartupPath.Substring(0, Application.StartupPath.LastIndexOf("\\")).LastIndexOf("\\")) + @"\\RPHocPhi.rpt";
            //string _fileReport = @"C:\Users\httt\Desktop\Project Database\QLSINHVIEN_22_5_ver1\QLSV1\RPDiemSinhVien.rpt";
            rptDoc.Load(_fileReport);

            rptDoc.SetParameterValue("@TenNamHoc",UCHocPhi.HocPhi_NamHoc );
            rptDoc.SetParameterValue("@TenHocKy", UCHocPhi.HocPhi_HocKi);

            crystalReportViewer.ReportSource = rptDoc;
            //crystalReportViewer.Refresh();

            CrystalDecisions.CrystalReports.Engine.TextObject txtGioiThieu;

            CrystalDecisions.CrystalReports.Engine.TextObject txtNgayThang;

            
            txtGioiThieu = rptDoc.ReportDefinition.ReportObjects["txtGioiThieu"] as TextObject;
            txtNgayThang = rptDoc.ReportDefinition.ReportObjects["txtNgayThang"] as TextObject;

            txtNgayThang.Text = "Hà Nội,ngày " + DateTime.Today.ToString("dd") + " tháng " + DateTime.Today.ToString("MM") + " năm " + DateTime.Today.ToString("yyyy");
            txtGioiThieu.Text = "HỌC KÌ " + (UCHocPhi.HocPhi_HocKi == "Học kỳ 1" ? "I " : UCHocPhi.HocPhi_HocKi == "Học kỳ 2" ? "II " : "III ") + "NĂM HỌC " + UCHocPhi.HocPhi_NamHoc;         
        
             }*/
            Connection conn = new Connection();
            SqlConnection _sqlConnection;
            using (_sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_DIEM_XemHocPhi", _sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.StoredProcedure;
                    _sqlCom.Parameters.Add("@TenNamHoc", SqlDbType.NVarChar).Value = UCHocPhi.HocPhi_NamHoc;
                    _sqlCom.Parameters.Add("@TenHocKy", SqlDbType.NVarChar).Value = UCHocPhi.HocPhi_HocKi;
                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);

                    RPHocPhi rptDoc = new RPHocPhi();
                    rptDoc.SetDataSource(_dt);
                    crystalReportViewer.ReportSource = rptDoc;

                    CrystalDecisions.CrystalReports.Engine.TextObject txtGioiThieu;

                    CrystalDecisions.CrystalReports.Engine.TextObject txtNgayThang;


                    txtGioiThieu = rptDoc.ReportDefinition.ReportObjects["txtGioiThieu"] as TextObject;
                    txtNgayThang = rptDoc.ReportDefinition.ReportObjects["txtNgayThang"] as TextObject;

                    txtNgayThang.Text = "TP.Hồ Chí Minh,ngày " + DateTime.Today.ToString("dd") + " tháng " + DateTime.Today.ToString("MM") + " năm " + DateTime.Today.ToString("yyyy");
                    txtGioiThieu.Text = "HỌC KÌ " + (UCHocPhi.HocPhi_HocKi == "Học kỳ 1" ? "I " : UCHocPhi.HocPhi_HocKi == "Học kỳ 2" ? "II " : "III ") + "NĂM HỌC " + UCHocPhi.HocPhi_NamHoc;         
        
                }
            }

        }
        
    }
}
