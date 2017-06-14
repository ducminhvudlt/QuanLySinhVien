using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DevComponents.DotNetBar;

namespace QLSV1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        private void addNewTab(string strTabName, UserControl ucContent)
        {
            //-----------If exist tabpage then exit---------------
            foreach (TabItem tabPage in tabControl1.Tabs)
                if (tabPage.Text == strTabName)
                {
                    tabControl1.SelectedTab = tabPage;
                    return;
                }
            //-------------------------Clear Tab Before---------------
            //if (tabControl1.Tabs.Count > 1)
              //  tabControl1.Tabs.RemoveAt(1);

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
            tabControl1.Controls.Add(newTabPanel);
            tabControl1.Tabs.Add(newTabPage);
            tabControl1.SelectedTab = newTabPage;
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            
        }

        private void buttonItem14_Click(object sender, EventArgs e)
        {
            UCTaoTaiKhoan UC_taoTaiKhoan = new UCTaoTaiKhoan();
            addNewTab("Tạo Tài Khoản Mới", UC_taoTaiKhoan);
        }

        public MouseEventHandler tabItem_MouseDown { get; set; }

        private void buttonItem19_Click(object sender, EventArgs e)
        {
            UCDoiMatKhau UC_doiMatKhau = new UCDoiMatKhau();
            addNewTab("Đổi Mật Khẩu", UC_doiMatKhau);
        }

        private void buttonItem21_Click(object sender, EventArgs e)
        {
           
        }

        private void buttonItem20_Click(object sender, EventArgs e)
        {

        }

        private void buttonItem1_Click(object sender, EventArgs e)
        {
       
        }

        private void buttonItem3_Click(object sender, EventArgs e)
        {

        }

        private void ribbonTabItem2_Click(object sender, EventArgs e)
        {

        }

        private void buttonItem20_Click_1(object sender, EventArgs e)
        {

        }

        private void tabControlPanel1_Click(object sender, EventArgs e)
        {

        }

        private void buttonItem13_Click(object sender, EventArgs e)
        {
            UCXetHocBong UC_xetHocBong = new UCXetHocBong();
            addNewTab("Xét Học Bổng", UC_xetHocBong);
        }

        private void tabControl1_Click(object sender, EventArgs e)
        {

        }

        private void tabControl1_TabItemClose(object sender, TabStripActionEventArgs e)
        {
            TabItem selectedTab = tabControl1.SelectedTab;
            if(MessageBox.Show("Bạn Có Muốn Tắt Trang: \"" +selectedTab.Text+"\"?","Xác Nhận",MessageBoxButtons.YesNo,MessageBoxIcon.Question)==DialogResult.Yes)
            tabControl1.Tabs.Remove(selectedTab);
        }
    }
}
