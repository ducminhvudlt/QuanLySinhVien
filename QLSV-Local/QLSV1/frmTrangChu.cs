using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DevComponents.DotNetBar;
using System.Threading;
using System.Collections;
using System.Diagnostics;

namespace QLSV1
{
    public partial class frmTrangChu : Form
    {
        public static int LoaiNguoiDung;
        public frmTrangChu()
        {         
            InitializeComponent();
            AnCacDauTrenGocPhai();
            this.Height = 768;
            this.Width = 1366;
            this.WindowState = FormWindowState.Maximized;
            //PhanQuyen(QuyenNguoiDung);
        }
        private bool AnCacDauTrenGocPhai()
        {
            ArrayList items = ribbonControl1.RibbonStrip.GetItems("", typeof(SystemCaptionItem));           
            foreach (SystemCaptionItem sci in items)
            {
                if ((!sci.IsSystemIcon))
                {
                    sci.Visible = false;
                    break;
                }
            }
            return false;
        }
        private void DangNhapChuongTrinh()
        {
            frmDangNhap frmDangNhap = new frmDangNhap();
            frmDangNhap.Show();
        }
            
        private void AddNewTab(string strTabName, UserControl ucContent)
        {
            //-----------If exist tabpage then exit---------------
            foreach (TabItem tabPage in tabControllTrangChu.Tabs)
                if (tabPage.Text == strTabName)
                {
                    tabControllTrangChu.SelectedTab = tabPage;
                    return;
                }
            //-------------------------Clear Tab Before---------------
            //if (tabControllTrangChu.Tabs.Count > 1)
              //  tabControllTrangChu.Tabs.RemoveAt(1);

            TabControlPanel newTabPanel = new DevComponents.DotNetBar.TabControlPanel();
            TabItem newTabPage = new TabItem(this.components);
            newTabPage.ImageIndex = 0;
            //newTabPage.MouseDown += new System.Windows.Forms.MouseEventHandler(tabItem_MouseDown);
            newTabPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            newTabPanel.Location = new System.Drawing.Point(0, 26);
            newTabPanel.Name = "panel" + strTabName;
            newTabPanel.Padding = new System.Windows.Forms.Padding(1);
            newTabPanel.Size = new System.Drawing.Size(1230, 384);
            newTabPanel.Style.BackColor1.Color = System.Drawing.Color.FromArgb(((int)(((byte)(142)))), ((int)(((byte)(179)))), ((int)(((byte)(231)))));
            newTabPanel.Style.BackColor2.Color = System.Drawing.Color.FromArgb(((int)(((byte)(223)))), ((int)(((byte)(237)))), ((int)(((byte)(254)))));
            newTabPanel.Style.Border = DevComponents.DotNetBar.eBorderType.SingleLine;
            newTabPanel.Style.BorderColor.Color = System.Drawing.Color.FromArgb(((int)(((byte)(59)))), ((int)(((byte)(97)))), ((int)(((byte)(156)))));
            newTabPanel.Style.BorderSide = ((DevComponents.DotNetBar.eBorderSide)(((DevComponents.DotNetBar.eBorderSide.Left | DevComponents.DotNetBar.eBorderSide.Right)
                        | DevComponents.DotNetBar.eBorderSide.Bottom)));
            newTabPanel.Style.GradientAngle = 90;
            newTabPanel.TabIndex = 2;
            newTabPanel.TabItem = newTabPage;
            //-------------New  tab page---------------------
            Random ran = new Random();
            newTabPage.Name = strTabName + ran.Next(100000) + ran.Next(22342);
            newTabPage.AttachedControl = newTabPanel;
            newTabPage.Text = strTabName;
            ucContent.Dock = DockStyle.Fill;
            newTabPanel.Controls.Add(ucContent);
            //------------add Tab page to Tab control-------------
            tabControllTrangChu.Controls.Add(newTabPanel);
            tabControllTrangChu.Tabs.Add(newTabPage);
            tabControllTrangChu.SelectedTab = newTabPage;
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            
        }

        private void btnTaoTaiKhoan_Click(object sender, EventArgs e)
        {
            //UCTaoTaiKhoan UC_taoTaiKhoan = new UCTaoTaiKhoan();
            //AddNewTab("Tạo Tài Khoản Mới", UC_taoTaiKhoan);
            frmTaoTaiKhoan frm_taoTaiKhoan = new frmTaoTaiKhoan();
            frm_taoTaiKhoan.ShowDialog();
        }

        public MouseEventHandler tabItem_MouseDown { get; set; }

        private void btnDoiMatKhau_Click(object sender, EventArgs e)
        {
            //UCDoiMatKhau UC_doiMatKhau = new UCDoiMatKhau();
            //AddNewTab("Đổi Mật Khẩu", UC_doiMatKhau);
            frmDoiMatKhau frm_doiMatKhau = new frmDoiMatKhau();
            frm_doiMatKhau.ShowDialog();
        }
        private void btnXetHocBong_Click(object sender, EventArgs e)
        {
            UCXetHocBong UC_xetHocBong = new UCXetHocBong();
            AddNewTab("Xét Học Bổng", UC_xetHocBong);
        }

        private void tabControllTrangChu_TabItemClose(object sender, TabStripActionEventArgs e)
        {
            TabItem selectedTab = tabControllTrangChu.SelectedTab;
            if (MessageBox.Show("Bạn Có Muốn Tắt Trang: \"" + selectedTab.Text + "\"?", "Xác Nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                tabControllTrangChu.Tabs.Remove(selectedTab);
        }

        public static void TatTabHienTai()
        {

        }

        private void btnThongTinNguoiDung_Click(object sender, EventArgs e)
        {
            UCThongTinNguoiDung UC_thongTinNguoiDung = new UCThongTinNguoiDung();
            AddNewTab("Quản Lý Tài Khoản Đăng Nhập", UC_thongTinNguoiDung);
        }

        private void btnHoSoSinhVien_Click(object sender, EventArgs e)
        {
            UCHoSoSinhVien UC_hoSoSinhVien = new UCHoSoSinhVien();
            AddNewTab("Hồ Sơ Sinh Viên", UC_hoSoSinhVien);
        }

        private void btnThongTinGiangVien_Click(object sender, EventArgs e)
        {
            UCThongTinGiangVien UC_thongTinGiangVien = new UCThongTinGiangVien();
            AddNewTab("Thông Tin Giảng Viên", UC_thongTinGiangVien);
        }

        private void btnDanhSachMonHoc_Click(object sender, EventArgs e)
        {
            UCDanhSachMonHoc UC_danhSachMonHoc = new UCDanhSachMonHoc();
            AddNewTab("Danh Sách Môn Học", UC_danhSachMonHoc);
        }

        private void btnDanhSachLopHoc_Click(object sender, EventArgs e)
        {
            UCDanhSachLopHoc UC_danhSachLopHoc = new UCDanhSachLopHoc();
            AddNewTab("Danh Sách Lớp Học", UC_danhSachLopHoc);
        }

        private void btnDanhSachKhoaVien_Click(object sender, EventArgs e)
        {
            UCDanhSachKhoaVien UC_danhSachKhoaVien = new UCDanhSachKhoaVien();
            AddNewTab("Danh Sách Khoa Viện", UC_danhSachKhoaVien);
        }

        private void btnDangXuat_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn Có Muốn Đăng Xuất ?", "Xác Nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                this.Close();
                frmDangNhap frmDangNhap = new frmDangNhap();
                frmDangNhap.Show();
            }
        }

        private void btnThoatChuongTrinh_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn Có Muốn Thoát Chương Trình ?", "Xác Nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                /*List<int> processesbeforegen = UCGiayChungNhanSV.getRunningProcesses();
                List<int> processesaftergen = UCGiayChungNhanSV.getRunningProcesses();
                UCGiayChungNhanSV.killProcesses(processesbeforegen, processesaftergen);*/
                Application.Exit();
            }
        }

        private void btnTruyXuatBangDiem_Click(object sender, EventArgs e)
        {
            UCTruyXuatBangDiem UC_truyXuat = new UCTruyXuatBangDiem();
            AddNewTab("Truy Xuất Bảng Điểm", UC_truyXuat);
        }

        private void btnChungNhanSinhVien_Click(object sender, EventArgs e)
        {
            UCGiayChungNhanSV UC_giayChungNhanSV = new UCGiayChungNhanSV();
            AddNewTab("In Giấy Chứng Nhận Sinh Viên", UC_giayChungNhanSV);
        }

        private void btnQuanLyDiem_Click(object sender, EventArgs e)
        {
            UCQuanLyDiem UC_quanLyDiem = new UCQuanLyDiem();
            AddNewTab("Quản Lý Điểm", UC_quanLyDiem);
        }

        private void ribTabDanhMuc_Click(object sender, EventArgs e)
        {

        }

        private void btnHocPhi_Click(object sender, EventArgs e)
        {
            UCHocPhi UC_hocPhi = new UCHocPhi();
            AddNewTab("Học Phí", UC_hocPhi);
        }

        private void tabControllTrangChu_Click(object sender, EventArgs e)
        {

        }

        private void btnDanTocThieuSo_Click(object sender, EventArgs e)
        {
            frmRPDanhSachSinhVienDanToc frmReport = new frmRPDanhSachSinhVienDanToc();
            frmReport.ShowDialog();
        }

        private void btnDanhSachLopTinChi_Click(object sender, EventArgs e)
        {
            UCLopTinChi UC_lopTinChi = new UCLopTinChi();
            AddNewTab("Lớp Tín Chỉ", UC_lopTinChi);
        }

        private void btnTonGiao_Click(object sender, EventArgs e)
        {
            UCThongKeTonGiao UC_thongKeTonGiao = new UCThongKeTonGiao();
            AddNewTab("Thống kê Sinh Viên Theo Tôn Giáo", UC_thongKeTonGiao);
        }

        private void btnCanhCaoHocTap_Click(object sender, EventArgs e)
        {
            UCKetQuaXuLyHocTap UC_canhCaoHocTap = new UCKetQuaXuLyHocTap(); 
            AddNewTab("Xử Lý Cảnh Cáo Học Tập", UC_canhCaoHocTap);
        }

        private void btnThongTin_Click(object sender, EventArgs e)
        {
            UCThongTinChuongTrinh UC_thongTin = new UCThongTinChuongTrinh();
            AddNewTab("Thông Tin Chương Trình", UC_thongTin);
        }

        private void btnHuongDan_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("Baocao.docx");
        }

        private void buttonItem2_Click(object sender, EventArgs e)
        {
            UCSinhVienXuatSac UC_sinhVienXuatSac = new UCSinhVienXuatSac();
            AddNewTab("Danh Sách Sinh Viên Xuất Sắc", UC_sinhVienXuatSac);
        }

        public void PhanQuyen(int _loaiNguoiDung)
        {
            if (_loaiNguoiDung != 1)//admin
            {
                rbb01_TaoTaiKhoan.Visible = false;
                rbb03_QuanLyTaiKhoan.Visible = false;
                rbb11_ChungNhanSV.Visible = false;
                rbb13_DanToc.Visible = false;
                rbb14_TonGiao.Visible = false;
                rbb15_HocBong.Visible = false;
                rbb17_QuanLyDiem.Visible = false;

                if (_loaiNguoiDung == 2)//Giảng viên
                {

                }
                else //sinh viên
                {
                    rbb05_ThongTinGiangVien.Visible = false;
                    rbb16_CanhCao.Visible = false;
                    rbb04_HoSoSinhVien.Visible = false;
                }
            }
        }        
    }
}
