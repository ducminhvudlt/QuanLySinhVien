using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.IO;
using Excel = Microsoft.Office.Interop.Excel;
using System.Data.OleDb;
using System.Text.RegularExpressions;

namespace QLSV1
{
    public partial class frmThemSVVaoLop : Form
    {
        ConnectionThemSVVaoLop connThemSVVaoLop = new ConnectionThemSVVaoLop();
        DoDuLieuVaoComboBox connComboBox = new DoDuLieuVaoComboBox();
        private string Excel03Con = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source={0};Extended Properties='Excel 8.0;HDR={1}'";
        private string Excel07Con = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties='Excel 8.0;HDR={1}'";
        static string MaLopTC = "";
        static string Nam = "";
        static string MonHoc = "";
        static string HocKy = "";
        bool boolNhap = false;
        bool boolNhapAll = false;
        DataTable dt = new DataTable();

        public frmThemSVVaoLop()
        {
            InitializeComponent();
        }

        private void frmThemSVVaoLop_Load(object sender, EventArgs e)
        {
            dgdNoiDung.DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dgdNoiDung.RowHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dgdNoiDung.ColumnHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dgdNoiDung.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dgdNoiDung.RowHeadersWidthSizeMode = DataGridViewRowHeadersWidthSizeMode.AutoSizeToAllHeaders;

            //dgdNoiDung.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            //dgdNoiDung.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;

            dgdNoiDung.RowsDefaultCellStyle.BackColor = Color.Bisque;
            dgdNoiDung.AlternatingRowsDefaultCellStyle.BackColor = Color.Beige;
            dgdNoiDung.CellBorderStyle = DataGridViewCellBorderStyle.SingleHorizontal;

            dgdNoiDung.DefaultCellStyle.SelectionBackColor = Color.Red;
            dgdNoiDung.DefaultCellStyle.SelectionForeColor = Color.Yellow;

            dgdNoiDung.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            //dgdNoiDung.AllowUserToResizeColumns = false;
            dgdNoiDung.ReadOnly = true;
            dgdNoiDung.AllowUserToAddRows = false;
            dgdNoiDung.RowHeadersVisible = false;
            connThemSVVaoLop.LayDuLieuSinhVienCacLopTinChi(dgdNoiDung);

            connComboBox.LayDuLieuVaoComboBox(cboMaLopTinChi, "MaLopTC", "LOPTINCHI");
            cboMaLopTinChi.Text = "";
            cboNamHoc.Text = "";
            cboTenMonHoc.Text = "";
            cboHocKy.Text = "";
            cboMaSinhVien.Text = "";
            cboNamHoc.Enabled = false;
            cboTenMonHoc.Enabled = false;
            cboHocKy.Enabled = false;
            cboMaSinhVien.Enabled = false;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            if (boolNhapAll == true)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    cboMaLopTinChi.Text = dt.Rows[i][0].ToString();
                    cboNamHoc.Text = dt.Rows[i][2].ToString();
                    cboHocKy.Text = dt.Rows[i][4].ToString();
                    cboTenMonHoc.Text = dt.Rows[i][1].ToString();
                    cboMaSinhVien.Text = dt.Rows[i][3].ToString();
                    connThemSVVaoLop.ThemLopSinhVienVaoLopTinChi(cboMaSinhVien.Text, cboHocKy.Text, cboNamHoc.Text, cboMaLopTinChi.Text, cboTenMonHoc.Text);
                    connThemSVVaoLop.LayDuLieuSinhVienCacLopTinChi(dgdNoiDung);
                }
            }
            else
            {
                connThemSVVaoLop.ThemLopSinhVienVaoLopTinChi(cboMaSinhVien.Text, cboHocKy.Text, cboNamHoc.Text, cboMaLopTinChi.Text, cboTenMonHoc.Text);
                connComboBox.LayDuLieuVaoComboBoxCoDieuKien(cboMaSinhVien, "MaSINHVIEN", "SINHVIEN", "SINHVIEN.MaSINHVIEN NOT IN (SELECT DIEM.MaSINHVIEN FROM DIEM,MONHOC,NAMHOC,HOCKY WHERE DIEM.MaMonHoc=MONHOC.MaMonHoc AND DIEM.MaHocKy=HOCKY.MaHocKy AND DIEM.MaNamHoc=NAMHOC.MaNamHoc AND MaLopTC='" + MaLopTC + "' AND TenNamHoc='" + Nam + "' AND TenMonHoc=N'" + MonHoc + "' AND TenHocKy=N'" + HocKy + "')");
                connThemSVVaoLop.LayDuLieuSinhVienCacLopTinChi(dgdNoiDung);
            }
        }

        private void cboMaLopTinChi_SelectedValueChanged(object sender, EventArgs e)
        {
            MaLopTC = cboMaLopTinChi.Text;
            cboNamHoc.Enabled = true;
            connComboBox.LayDuLieuVaoComboBoxCoDieuKien(cboNamHoc, "TenNamHoc", "NAMHOC,PHANCONG", "NAMHOC.MaNamHoc=PHANCONG.MaNamHoc AND MaLopTC='" + MaLopTC + "'");
            cboHocKy.Enabled = false;
            cboTenMonHoc.Enabled = false;
            cboMaSinhVien.Enabled = false;
            cboNamHoc.Text = "";
            cboHocKy.Text = "";
            cboTenMonHoc.Text = "";
            cboMaSinhVien.Text = "";
        }

        private void cboNamHoc_SelectedValueChanged(object sender, EventArgs e)
        {
            Nam = cboNamHoc.Text;
            cboHocKy.Enabled = true;
            connComboBox.LayDuLieuVaoComboBoxCoDieuKien(cboTenMonHoc, "TenMonHoc", "MONHOC,PHANCONG,NAMHOC", "MONHOC.MaMonHoc=PHANCONG.MaMonHoc AND NAMHOC.MaNamHoc=PHANCONG.MaNamHoc AND MaLopTC='" + MaLopTC + "' AND NAMHOC.TenNamHoc='" + Nam + "'");
            connComboBox.LayDuLieuVaoComboBox(cboHocKy, "TenHocKy", "HOCKY");
            cboTenMonHoc.Enabled = false;
            cboMaSinhVien.Enabled = false;
            cboHocKy.Text = "";
            cboTenMonHoc.Text = "";
            cboMaSinhVien.Text = "";
        }

        private void cboHocKy_SelectedValueChanged(object sender, EventArgs e)
        {     
            HocKy = cboHocKy.Text;
            cboTenMonHoc.Enabled = true; 
            cboMaSinhVien.Enabled = false;
            cboTenMonHoc.Text = "";
            cboMaSinhVien.Text = "";
        }

        private void cboTenMonHoc_SelectedValueChanged(object sender, EventArgs e)
        {
            MonHoc = cboTenMonHoc.Text;
            cboMaSinhVien.Enabled = true;
            connComboBox.LayDuLieuVaoComboBoxCoDieuKien(cboMaSinhVien, "MaSINHVIEN", "SINHVIEN", "SINHVIEN.MaSINHVIEN NOT IN (SELECT DIEM.MaSINHVIEN FROM DIEM,MONHOC,NAMHOC,HOCKY WHERE DIEM.MaMonHoc=MONHOC.MaMonHoc AND DIEM.MaHocKy=HOCKY.MaHocKy AND DIEM.MaNamHoc=NAMHOC.MaNamHoc AND MaLopTC='" + MaLopTC + "' AND TenNamHoc='" + Nam + "' AND TenMonHoc=N'" + MonHoc + "' AND TenHocKy=N'" + HocKy + "')");
            cboMaSinhVien.Text = "";
        }

        private void btnNhap_Click(object sender, EventArgs e)
        {
            boolNhap = !boolNhap;
            if (boolNhap == true)
            {
                if (openFileDialog1.ShowDialog() == DialogResult.OK)
                {
                    boolNhapAll = true;
                    btnThem.Enabled = false;
                    btnXuat.Enabled = false;
                    btnNhap.Text = "Quay Lại";
                }
                else
                {
                    boolNhapAll = false;
                    boolNhap = false;
                }
            }
            else
            {
                boolNhapAll = false;
                btnThem.Enabled = true;
                btnXuat.Enabled = true;
                connThemSVVaoLop.LayDuLieuSinhVienCacLopTinChi(dgdNoiDung);
                btnNhap.Text = "Nhập";
            }
        }

        private void openFileDialog1_FileOk(object sender, CancelEventArgs e)
        {
            string filePath = openFileDialog1.FileName;
            string extension = Path.GetExtension(filePath);
            //string header = rbHeaderYes.Checked ? "YES" : "NO";
            string conStr, sheetName;
            conStr = string.Empty;
            switch (extension)
            {
                case ".xls": //Excel 97-03
                    conStr = string.Format(Excel03Con, filePath, "YES");
                    break;
                case ".xlsx": //Excel 07
                    conStr = string.Format(Excel07Con, filePath, "YES");
                    break;
            }
            //Get the name of the First Sheet.
            using (OleDbConnection con = new OleDbConnection(conStr))
            {
                using (OleDbCommand cmd = new OleDbCommand())
                {
                    cmd.Connection = con;
                    con.Open();
                    DataTable dtExcel = con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                    sheetName = dtExcel.Rows[0]["TABLE_NAME"].ToString();
                    con.Close();
                }
            }

            using (OleDbConnection cn = new OleDbConnection(conStr))
            {
                using (OleDbCommand cmd = new OleDbCommand())
                {
                    using (OleDbDataAdapter oda = new OleDbDataAdapter())
                    {
                        //DataTable dt = new DataTable();
                        cmd.CommandText = "SELECT * From [" + sheetName + "]";
                        cmd.Connection = cn;
                        cn.Open();
                        oda.SelectCommand = cmd;
                        oda.Fill(dt);
                        cn.Close();

                        dgdNoiDung.DataSource = dt;
                    }
                }
            }
        }

        private void btnXuat_Click(object sender, EventArgs e)
        {
            ThaoTac.Export2Excel(dgdNoiDung);
        }      
    }
}
