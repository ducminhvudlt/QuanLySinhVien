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
    public partial class frmRPDanhSachSinhVienTonGiao : Form
    {
        public frmRPDanhSachSinhVienTonGiao()
        {
            InitializeComponent();
        }
        private void crystalReportViewer_Load(object sender, EventArgs e)
        {
            /*
             ReportDocument rptDoc = new ReportDocument();
             string _fileReport ="RPSinhVienTonGiao.rpt"; 
            //string _fileReport = Application.StartupPath.Substring(0, Application.StartupPath.Substring(0, Application.StartupPath.LastIndexOf("\\")).LastIndexOf("\\")) + @"\\RPSinhVienTonGiao.rpt";
            //string _fileReport = @"C:\Users\httt\Desktop\Project Database\QLSINHVIEN_22_5_ver1\QLSV1\RPDiemSinhVien.rpt";
            rptDoc.Load(_fileReport);

            rptDoc.SetParameterValue("@TenTonGiao",UCThongKeTonGiao.UCTonGiao_Ten);

            crystalReportViewer.ReportSource = rptDoc;
            //crystalReportViewer.Refresh();

            CrystalDecisions.CrystalReports.Engine.TextObject txtGioiThieu;

            CrystalDecisions.CrystalReports.Engine.TextObject txtNgayThang;

            
            txtGioiThieu = rptDoc.ReportDefinition.ReportObjects["txtGioiThieu"] as TextObject;
            txtNgayThang = rptDoc.ReportDefinition.ReportObjects["txtNgayThang"] as TextObject;

            txtNgayThang.Text = "TP.Hồ Chí Minh,ngày " + DateTime.Today.ToString("dd") + " tháng " + DateTime.Today.ToString("MM") + " năm " + DateTime.Today.ToString("yyyy");
            //txtGioiThieu.Text = "HỌC KÌ " + (UCHocPhi.HocPhi_HocKi == "Học kỳ 1" ? "I " : UCHocPhi.HocPhi_HocKi == "Học kỳ 2" ? "II " : "III ") + "NĂM HỌC " + UCHocPhi.HocPhi_NamHoc;  
            txtGioiThieu.Text="DANH SÁCH SINH VIÊN THEO ĐẠO ";
            if (UCThongKeTonGiao.UCTonGiao_Ten == "Thiên Chúa") txtGioiThieu.Text += "THIÊN CHÚA";
            else if (UCThongKeTonGiao.UCTonGiao_Ten == "Phật") txtGioiThieu.Text += "PHẬT";
            else if (UCThongKeTonGiao.UCTonGiao_Ten == "Tin Lành") txtGioiThieu.Text += "TIN LÀNH";
            else txtGioiThieu.Text = "DANH SÁCH SINH VIÊN KHÔNG THEO ĐẠO";
             
              */

            Connection conn = new Connection();
            SqlConnection _sqlConnection;
            using (_sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_SINHVIEN_ThongKeTonGiao", _sqlConnection))
                {
                    try
                    {
                        _sqlCom.CommandType = CommandType.StoredProcedure;
                        _sqlCom.Parameters.Add("@TenTonGiao", SqlDbType.NVarChar).Value = UCThongKeTonGiao.UCTonGiao_Ten;
                        SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                        DataTable _dt = new DataTable();
                        _sqlDa.Fill(_dt);

                        RPSinhVienTonGiao rptDoc = new RPSinhVienTonGiao();
                        rptDoc.SetDataSource(_dt);
                        crystalReportViewer.ReportSource = rptDoc;

                        CrystalDecisions.CrystalReports.Engine.TextObject txtGioiThieu;

                        CrystalDecisions.CrystalReports.Engine.TextObject txtNgayThang;


                        txtGioiThieu = rptDoc.ReportDefinition.ReportObjects["txtGioiThieu"] as TextObject;
                        txtNgayThang = rptDoc.ReportDefinition.ReportObjects["txtNgayThang"] as TextObject;

                        txtNgayThang.Text = "TP.Hồ Chí Minh,ngày " + DateTime.Today.ToString("dd") + " tháng " + DateTime.Today.ToString("MM") + " năm " + DateTime.Today.ToString("yyyy");
                        //txtGioiThieu.Text = "HỌC KÌ " + (UCHocPhi.HocPhi_HocKi == "Học kỳ 1" ? "I " : UCHocPhi.HocPhi_HocKi == "Học kỳ 2" ? "II " : "III ") + "NĂM HỌC " + UCHocPhi.HocPhi_NamHoc;  
                        txtGioiThieu.Text = "DANH SÁCH SINH VIÊN THEO ĐẠO ";
                        if (UCThongKeTonGiao.UCTonGiao_Ten == "Thiên Chúa") txtGioiThieu.Text += "THIÊN CHÚA";
                        else if (UCThongKeTonGiao.UCTonGiao_Ten == "Phật") txtGioiThieu.Text += "PHẬT";
                        else if (UCThongKeTonGiao.UCTonGiao_Ten == "Tin Lành") txtGioiThieu.Text += "TIN LÀNH";
                        else if (UCThongKeTonGiao.UCTonGiao_Ten == "Khác") txtGioiThieu.Text = "DANH SÁCH SINH VIÊN THEO ĐẠO KHÁC";
                        else txtGioiThieu.Text = "DANH SÁCH SINH VIÊN KHÔNG THEO ĐẠO";
                    }
                    catch (Exception)
                    {
                        MessageBox.Show("Nhập thông tin sai, xin vui lòng nhập lại");
                    }
                }
            }
        }
    }

}
