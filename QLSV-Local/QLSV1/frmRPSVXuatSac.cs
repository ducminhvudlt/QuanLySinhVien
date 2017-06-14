using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using CrystalDecisions.CrystalReports.Engine;
using System.Data.SqlClient;

namespace QLSV1
{
    public partial class frmRPSVXuatSac : Form
    {
        public frmRPSVXuatSac()
        {
            InitializeComponent();
        }

        private void crystalReportViewer_Load(object sender, EventArgs e)
        {
            /*
             ReportDocument rptDoc = new ReportDocument();
             string _fileReport = "RPDanhSachSVXuatSac.rpt"; 
            //_fileReport = Application.StartupPath.Substring(0, Application.StartupPath.Substring(0, Application.StartupPath.LastIndexOf("\\")).LastIndexOf("\\")) + @"\\RPDanhSachSVXuatSac.rpt";
             
                   
            //string _fileReport = @"C:\Users\httt\Desktop\Project Database\QLSINHVIEN_22_5_ver1\QLSV1\RPDiemSinhVien.rpt";
            rptDoc.Load(_fileReport);

            rptDoc.SetParameterValue("@TenNamHoc",UCSinhVienXuatSac.NamHoc );          

            crystalReportViewer.ReportSource = rptDoc;
            //crystalReportViewer.Refresh();

            CrystalDecisions.CrystalReports.Engine.TextObject txtNgayThang;
            CrystalDecisions.CrystalReports.Engine.TextObject txtGioiThieu;
            
            txtNgayThang = rptDoc.ReportDefinition.ReportObjects["txtNgayThang"] as TextObject;
            txtGioiThieu = rptDoc.ReportDefinition.ReportObjects["txtGioiThieu"] as TextObject;

            txtNgayThang.Text = "TP.Hồ Chí Minh,ngày " + DateTime.Today.ToString("dd") + " tháng " + DateTime.Today.ToString("MM") + " năm " + DateTime.Today.ToString("yyyy");
            txtGioiThieu.Text = "DANH SÁCH SINH VIÊN XUẤT SẮC NHẤT NĂM HỌC  " + UCSinhVienXuatSac.NamHoc;   
             * */

            Connection conn = new Connection();
            SqlConnection _sqlConnection;
            using (_sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_DIEM_SVXSTheoLop", _sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.StoredProcedure;
                    _sqlCom.Parameters.Add("@TenNamHoc", SqlDbType.NVarChar).Value = UCSinhVienXuatSac.NamHoc;

                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);

                    RPDanhSachSVXuatSac rptDoc = new RPDanhSachSVXuatSac();
                    rptDoc.SetDataSource(_dt);
                    crystalReportViewer.ReportSource = rptDoc;

                    CrystalDecisions.CrystalReports.Engine.TextObject txtNgayThang;
                    CrystalDecisions.CrystalReports.Engine.TextObject txtGioiThieu;

                    txtNgayThang = rptDoc.ReportDefinition.ReportObjects["txtNgayThang"] as TextObject;
                    txtGioiThieu = rptDoc.ReportDefinition.ReportObjects["txtGioiThieu"] as TextObject;

                    txtNgayThang.Text = "TP.Hồ Chí Minh,ngày " + DateTime.Today.ToString("dd") + " tháng " + DateTime.Today.ToString("MM") + " năm " + DateTime.Today.ToString("yyyy");
                    txtGioiThieu.Text = "DANH SÁCH SINH VIÊN XUẤT SẮC NHẤT NĂM HỌC  " + UCSinhVienXuatSac.NamHoc;   
                }
            }
        
        }
        
    }
}

