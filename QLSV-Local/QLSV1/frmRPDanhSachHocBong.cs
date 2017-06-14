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
    public partial class frmDanhSachSVXuatSac : Form
    {
        public frmDanhSachSVXuatSac()
        {
            InitializeComponent();
        }

        private void crystalReportViewer_Load(object sender, EventArgs e)
        {
            /*
             ReportDocument rptDoc = new ReportDocument();
            string _fileReport;
            if(UCXetHocBong.isSoLuong==true)
                _fileReport ="RPDanhSachHocBong.rpt";
                 //_fileReport = Application.StartupPath.Substring(0, Application.StartupPath.Substring(0, Application.StartupPath.LastIndexOf("\\")).LastIndexOf("\\")) + @"\\RPDanhSachHocBong.rpt";
            else
                _fileReport = System.IO.Path.GetDirectoryName(System.Windows.Forms.Application.ExecutablePath).ToString() + @"RPDanhSachHocBongPhanTram.rpt";
                 //_fileReport = Application.StartupPath.Substring(0, Application.StartupPath.Substring(0, Application.StartupPath.LastIndexOf("\\")).LastIndexOf("\\")) + @"\\RPDanhSachHocBongPhanTram.rpt";
            //string _fileReport = @"C:\Users\httt\Desktop\Project Database\QLSINHVIEN_22_5_ver1\QLSV1\RPDiemSinhVien.rpt";
            rptDoc.Load(_fileReport);

            rptDoc.SetParameterValue("@TenNamHoc",UCXetHocBong.NamHoc );
            rptDoc.SetParameterValue("@TenHocKy", UCXetHocBong.Hocki);
            rptDoc.SetParameterValue("@Top", UCXetHocBong.SoLuong);

            crystalReportViewer.ReportSource = rptDoc;
            //crystalReportViewer.Refresh();

            CrystalDecisions.CrystalReports.Engine.TextObject txtGioiThieu;

            CrystalDecisions.CrystalReports.Engine.TextObject txtNgayThang;

            
            txtGioiThieu = rptDoc.ReportDefinition.ReportObjects["txtGioiThieu"] as TextObject;
            txtNgayThang = rptDoc.ReportDefinition.ReportObjects["txtNgayThang"] as TextObject;

            txtNgayThang.Text = "TP.Hồ Chí Minh,ngày " + DateTime.Today.ToString("dd") + " tháng " + DateTime.Today.ToString("MM") + " năm " + DateTime.Today.ToString("yyyy");
            txtGioiThieu.Text = "DANH SÁCH SINH VIÊN ĐƯỢC NHẬN HỌC BỔNG HỌC KỲ " + (UCXetHocBong.Hocki == "Học kỳ 1" ? "I " : UCXetHocBong.Hocki == "Học kỳ 2" ? "II " : "III ") + "NĂM HỌC " + UCXetHocBong.NamHoc;         
        */

            if (UCXetHocBong.isSoLuong == true)
            {
                XuatKetQuaHocBong();
            }
            else
            {
                XuatKetQuaHocBongPhanTram();
            }  
        }

        private void XuatKetQuaHocBongPhanTram()
        {
            Connection conn = new Connection();
            SqlConnection _sqlConnection;
            using (_sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_KQHKTH_LenDSHocBong_PhanTram", _sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.StoredProcedure;

                    _sqlCom.Parameters.Add("@TenNamHoc", SqlDbType.NVarChar).Value = UCXetHocBong.NamHoc;
                    _sqlCom.Parameters.Add("@TenHocKy", SqlDbType.NVarChar).Value = UCXetHocBong.Hocki;
                    _sqlCom.Parameters.Add("@Top", SqlDbType.NVarChar).Value = UCXetHocBong.SoLuong;

                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);
                    RPDanhSachHocBongPhanTram rptDoc = new RPDanhSachHocBongPhanTram();
                    rptDoc.SetDataSource(_dt);
                    crystalReportViewer.ReportSource = rptDoc;

                    CrystalDecisions.CrystalReports.Engine.TextObject txtGioiThieu;

                    CrystalDecisions.CrystalReports.Engine.TextObject txtNgayThang;


                    txtGioiThieu = rptDoc.ReportDefinition.ReportObjects["txtGioiThieu"] as TextObject;
                    txtNgayThang = rptDoc.ReportDefinition.ReportObjects["txtNgayThang"] as TextObject;

                    txtNgayThang.Text = "TP.Hồ Chí Minh,ngày " + DateTime.Today.ToString("dd") + " tháng " + DateTime.Today.ToString("MM") + " năm " + DateTime.Today.ToString("yyyy");
                    txtGioiThieu.Text = "DANH SÁCH SINH VIÊN ĐƯỢC NHẬN HỌC BỔNG HỌC KỲ " + (UCXetHocBong.Hocki == "Học kỳ 1" ? "I " : UCXetHocBong.Hocki == "Học kỳ 2" ? "II " : "III ") + "NĂM HỌC " + UCXetHocBong.NamHoc;  
                }
            }
        }

        private void XuatKetQuaHocBong()
        {
            Connection conn = new Connection();
            SqlConnection _sqlConnection;
            using (_sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_KQHKTH_LenDSHocBong", _sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.StoredProcedure;

                    _sqlCom.Parameters.Add("@TenNamHoc", SqlDbType.NVarChar).Value = UCXetHocBong.NamHoc;
                    _sqlCom.Parameters.Add("@TenHocKy", SqlDbType.NVarChar).Value = UCXetHocBong.Hocki;
                    _sqlCom.Parameters.Add("@Top", SqlDbType.NVarChar).Value = UCXetHocBong.SoLuong;

                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);
                    RPDanhSachHocBong rptDoc = new RPDanhSachHocBong();
                        rptDoc.SetDataSource(_dt);
                        crystalReportViewer.ReportSource = rptDoc;

                        CrystalDecisions.CrystalReports.Engine.TextObject txtGioiThieu;

                        CrystalDecisions.CrystalReports.Engine.TextObject txtNgayThang;


                        txtGioiThieu = rptDoc.ReportDefinition.ReportObjects["txtGioiThieu"] as TextObject;
                        txtNgayThang = rptDoc.ReportDefinition.ReportObjects["txtNgayThang"] as TextObject;

                        txtNgayThang.Text = "TP.Hồ Chí Minh,ngày " + DateTime.Today.ToString("dd") + " tháng " + DateTime.Today.ToString("MM") + " năm " + DateTime.Today.ToString("yyyy");
                        txtGioiThieu.Text = "DANH SÁCH SINH VIÊN ĐƯỢC NHẬN HỌC BỔNG HỌC KỲ " + (UCXetHocBong.Hocki == "Học kỳ 1" ? "I " : UCXetHocBong.Hocki == "Học kỳ 2" ? "II " : "III ") + "NĂM HỌC " + UCXetHocBong.NamHoc;  
                    
                }
            }
        }
        
    }
}
