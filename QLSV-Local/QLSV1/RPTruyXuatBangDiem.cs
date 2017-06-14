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
    public partial class RPTruyXuatBangDiem : Form
    {
        public RPTruyXuatBangDiem()
        {
            InitializeComponent();
        }    
      
        private void crystalReportViewer_Load(object sender, EventArgs e)
        {
            /*
            ReportDocument rptDoc = new ReportDocument();
            string _fileReport ="RPDiemSinhVien.rpt"; 
            //string _fileReport = Application.StartupPath.Substring(0, Application.StartupPath.Substring(0, Application.StartupPath.LastIndexOf("\\")).LastIndexOf("\\")) + @"\\RPDiemSinhVien.rpt";
            //string _fileReport = @"C:\Users\httt\Desktop\Project Database\QLSINHVIEN_22_5_ver1\QLSV1\RPDiemSinhVien.rpt";
            rptDoc.Load(_fileReport);
            rptDoc.SetParameterValue("@MaSinhVien", UCTruyXuatBangDiem.BangDiem_MaSoSinhVien.ToString());
            crystalReportViewer.ReportSource = rptDoc;
            //crystalReportViewer.Refresh();


            CrystalDecisions.CrystalReports.Engine.TextObject txtHoTen;
            CrystalDecisions.CrystalReports.Engine.TextObject txtLop;
            CrystalDecisions.CrystalReports.Engine.TextObject txtNgaySinh;
            CrystalDecisions.CrystalReports.Engine.TextObject txtMaSoSinhVien;
            CrystalDecisions.CrystalReports.Engine.TextObject txtNgayThang;
            
            txtHoTen = rptDoc.ReportDefinition.ReportObjects["txtHoTen"] as TextObject;
            txtLop = rptDoc.ReportDefinition.ReportObjects["txtLop"] as TextObject;
            txtMaSoSinhVien = rptDoc.ReportDefinition.ReportObjects["txtMaSoSinhVien"] as TextObject;
            txtNgaySinh = rptDoc.ReportDefinition.ReportObjects["txtNgaySinh"] as TextObject;
            txtNgayThang = rptDoc.ReportDefinition.ReportObjects["txtNgayThang"] as TextObject;
            txtNgayThang.Text = "TP.Hồ Chí Minh,ngày " + DateTime.Today.ToString("dd") + " tháng " + DateTime.Today.ToString("MM") + " năm " + DateTime.Today.ToString("yyyy");


            try
            {
                Connection conn = new Connection();
                SqlConnection _sqlConnection;
                _sqlConnection = new SqlConnection(conn._sqlConnectionString);
                _sqlConnection.Open();
                SqlCommand _sqlCommand = new SqlCommand();
                _sqlCommand.Connection = _sqlConnection;
                _sqlCommand.CommandText = @"select HoTen,NgaySinh,MaLop from SINHVIEN where MaSINHVIEN like '" + UCTruyXuatBangDiem.BangDiem_MaSoSinhVien + "'";
                SqlDataReader _sqlDataReader = _sqlCommand.ExecuteReader();
                System.Data.DataTable _dataTable = new System.Data.DataTable();
                _dataTable.Load(_sqlDataReader);
                if (_dataTable != null)
                {
                    txtHoTen.Text = _dataTable.Rows[0][0].ToString().ToUpper();
                    txtNgaySinh.Text = _dataTable.Rows[0][1].ToString();
                    txtLop.Text = _dataTable.Rows[0][2].ToString();
                    txtMaSoSinhVien.Text = UCTruyXuatBangDiem.BangDiem_MaSoSinhVien.ToString().ToUpper();                   
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Mã Sinh Viên Này Không Tồn Tại");
            }
              */

            Connection conn = new Connection();
            SqlConnection _sqlConnection;
            using (_sqlConnection = new SqlConnection(conn._sqlConnectionString))
            {
                using (SqlCommand _sqlCom = new SqlCommand("sp_DIEM_XemDiemSinhVien", _sqlConnection))
                {
                    _sqlCom.CommandType = CommandType.StoredProcedure;
                    _sqlCom.Parameters.Add("@MaSinhVien", SqlDbType.NVarChar).Value = UCTruyXuatBangDiem.BangDiem_MaSoSinhVien.ToString();

                    SqlDataAdapter _sqlDa = new SqlDataAdapter(_sqlCom);
                    DataTable _dt = new DataTable();
                    _sqlDa.Fill(_dt);

                    RPDiemSinhVien rptDoc = new RPDiemSinhVien();
                    rptDoc.SetDataSource(_dt);
                    crystalReportViewer.ReportSource = rptDoc;

                    CrystalDecisions.CrystalReports.Engine.TextObject txtHoTen;
                    CrystalDecisions.CrystalReports.Engine.TextObject txtLop;
                    CrystalDecisions.CrystalReports.Engine.TextObject txtNgaySinh;
                    CrystalDecisions.CrystalReports.Engine.TextObject txtMaSoSinhVien;
                    CrystalDecisions.CrystalReports.Engine.TextObject txtNgayThang;

                    txtHoTen = rptDoc.ReportDefinition.ReportObjects["txtHoTen"] as TextObject;
                    txtLop = rptDoc.ReportDefinition.ReportObjects["txtLop"] as TextObject;
                    txtMaSoSinhVien = rptDoc.ReportDefinition.ReportObjects["txtMaSoSinhVien"] as TextObject;
                    txtNgaySinh = rptDoc.ReportDefinition.ReportObjects["txtNgaySinh"] as TextObject;
                    txtNgayThang = rptDoc.ReportDefinition.ReportObjects["txtNgayThang"] as TextObject;
                    txtNgayThang.Text = "TP.Hồ Chí Minh,ngày " + DateTime.Today.ToString("dd") + " tháng " + DateTime.Today.ToString("MM") + " năm " + DateTime.Today.ToString("yyyy");

                    try
                    {
                        Connection connn = new Connection();
                        SqlConnection _sqlConnectionn;
                        _sqlConnectionn = new SqlConnection(connn._sqlConnectionString);
                        _sqlConnectionn.Open();
                        SqlCommand _sqlCommand = new SqlCommand();
                        _sqlCommand.Connection = _sqlConnectionn;
                        _sqlCommand.CommandText = @"select HoTen,NgaySinh,MaLop from SINHVIEN where MaSINHVIEN like '" + UCTruyXuatBangDiem.BangDiem_MaSoSinhVien + "'";
                        SqlDataReader _sqlDataReader = _sqlCommand.ExecuteReader();
                        System.Data.DataTable _dataTable = new System.Data.DataTable();
                        _dataTable.Load(_sqlDataReader);
                        if (_dataTable != null)
                        {
                            txtHoTen.Text = _dataTable.Rows[0][0].ToString().ToUpper();
                            txtNgaySinh.Text = _dataTable.Rows[0][1].ToString();
                            txtLop.Text = _dataTable.Rows[0][2].ToString();
                            txtMaSoSinhVien.Text = UCTruyXuatBangDiem.BangDiem_MaSoSinhVien.ToString().ToUpper();
                        }
                    }
                    catch (Exception)
                    {
                        MessageBox.Show("Mã Sinh Viên Này Không Tồn Tại");
                    }
                }
            }
        
        }
      
    }
}
