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
    public partial class frmRPDanhSachSinhVienDanToc : Form
    {
        public frmRPDanhSachSinhVienDanToc()
        {
            InitializeComponent();
        }

        private void crystalReportViewer_Load(object sender, EventArgs e)
        {
            /*
            ReportDocument rptDoc = new ReportDocument();
            string _fileReport ="RPSinhVienDanToc.rpt";
            //string _fileReport = Application.StartupPath.Substring(0, Application.StartupPath.Substring(0, Application.StartupPath.LastIndexOf("\\")).LastIndexOf("\\")) + @"\\RPSinhVienDanToc.rpt";            
            rptDoc.Load(_fileReport);

            crystalReportViewer.ReportSource = rptDoc;
            //crystalReportViewer.Refresh();*/
            Connection conn = new Connection();
            SqlConnection _sqlConnection;
            using (_sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_SINHVIEN_ThongKeSinhVienDanToc", _sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);

                    RPSinhVienDanToc rptDoc = new RPSinhVienDanToc();
                    rptDoc.SetDataSource(_dt);
                    crystalReportViewer.ReportSource = rptDoc;

                    CrystalDecisions.CrystalReports.Engine.TextObject txtNgayThang;


                    //txtGioiThieu = rptDoc.ReportDefinition.ReportObjects["txtGioiThieu"] as TextObject;
                    txtNgayThang = rptDoc.ReportDefinition.ReportObjects["txtNgayThang"] as TextObject;

                    txtNgayThang.Text = "TP.Hồ Chí Minh,ngày " + DateTime.Today.ToString("dd") + " tháng " + DateTime.Today.ToString("MM") + " năm " + DateTime.Today.ToString("yyyy");
                    //txtGioiThieu.Text = "HỌC KÌ " + (UCHocPhi.HocPhi_HocKi == "Học kỳ 1" ? "I " : UCHocPhi.HocPhi_HocKi == "Học kỳ 2" ? "II " : "III ") + "NĂM HỌC " + UCHocPhi.HocPhi_NamHoc;         
                }
            }
        }


    }
}
