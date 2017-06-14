namespace QLSV1
{
    partial class UCHocPhi
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(UCHocPhi));
            this.lblXDanhSachKhoaVien = new DevComponents.DotNetBar.LabelX();
            this.grpTimKiem = new System.Windows.Forms.GroupBox();
            this.chkIsMaSoSinhVien = new System.Windows.Forms.CheckBox();
            this.cboMaSinhVien = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.cboHocKi = new System.Windows.Forms.ComboBox();
            this.cboNamHoc = new System.Windows.Forms.ComboBox();
            this.lblTenKhoas = new System.Windows.Forms.Label();
            this.lblMaKhoas = new System.Windows.Forms.Label();
            this.dataGridView = new System.Windows.Forms.DataGridView();
            this.btnInDanhSach = new DevComponents.DotNetBar.ButtonX();
            this.btnHocPhi = new DevComponents.DotNetBar.ButtonItem();
            this.buttonItem1 = new DevComponents.DotNetBar.ButtonItem();
            this.buttonItem2 = new DevComponents.DotNetBar.ButtonItem();
            this.grpTimKiem.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).BeginInit();
            this.SuspendLayout();
            // 
            // lblXDanhSachKhoaVien
            // 
            // 
            // 
            // 
            this.lblXDanhSachKhoaVien.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.lblXDanhSachKhoaVien.Dock = System.Windows.Forms.DockStyle.Top;
            this.lblXDanhSachKhoaVien.Font = new System.Drawing.Font("Times New Roman", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblXDanhSachKhoaVien.ForeColor = System.Drawing.Color.Blue;
            this.lblXDanhSachKhoaVien.Location = new System.Drawing.Point(0, 0);
            this.lblXDanhSachKhoaVien.Margin = new System.Windows.Forms.Padding(4);
            this.lblXDanhSachKhoaVien.Name = "lblXDanhSachKhoaVien";
            this.lblXDanhSachKhoaVien.Size = new System.Drawing.Size(1276, 69);
            this.lblXDanhSachKhoaVien.TabIndex = 26;
            this.lblXDanhSachKhoaVien.Text = "HỌC PHÍ";
            this.lblXDanhSachKhoaVien.TextAlignment = System.Drawing.StringAlignment.Center;
            // 
            // grpTimKiem
            // 
            this.grpTimKiem.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.grpTimKiem.Controls.Add(this.chkIsMaSoSinhVien);
            this.grpTimKiem.Controls.Add(this.cboMaSinhVien);
            this.grpTimKiem.Controls.Add(this.label3);
            this.grpTimKiem.Controls.Add(this.cboHocKi);
            this.grpTimKiem.Controls.Add(this.cboNamHoc);
            this.grpTimKiem.Controls.Add(this.lblTenKhoas);
            this.grpTimKiem.Controls.Add(this.lblMaKhoas);
            this.grpTimKiem.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grpTimKiem.Location = new System.Drawing.Point(0, 69);
            this.grpTimKiem.Margin = new System.Windows.Forms.Padding(4);
            this.grpTimKiem.Name = "grpTimKiem";
            this.grpTimKiem.Padding = new System.Windows.Forms.Padding(4);
            this.grpTimKiem.Size = new System.Drawing.Size(1276, 161);
            this.grpTimKiem.TabIndex = 27;
            this.grpTimKiem.TabStop = false;
            this.grpTimKiem.Text = "Tìm Kiếm";
            this.grpTimKiem.Enter += new System.EventHandler(this.grpTimKiem_Enter);
            // 
            // chkIsMaSoSinhVien
            // 
            this.chkIsMaSoSinhVien.AutoSize = true;
            this.chkIsMaSoSinhVien.Location = new System.Drawing.Point(159, 44);
            this.chkIsMaSoSinhVien.Name = "chkIsMaSoSinhVien";
            this.chkIsMaSoSinhVien.Size = new System.Drawing.Size(18, 17);
            this.chkIsMaSoSinhVien.TabIndex = 0;
            this.chkIsMaSoSinhVien.UseVisualStyleBackColor = true;
            this.chkIsMaSoSinhVien.CheckedChanged += new System.EventHandler(this.chkIsMaSoSinhVien_CheckedChanged);
            // 
            // cboMaSinhVien
            // 
            this.cboMaSinhVien.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.cboMaSinhVien.FormattingEnabled = true;
            this.cboMaSinhVien.Location = new System.Drawing.Point(342, 38);
            this.cboMaSinhVien.Name = "cboMaSinhVien";
            this.cboMaSinhVien.Size = new System.Drawing.Size(233, 28);
            this.cboMaSinhVien.TabIndex = 1;
            this.cboMaSinhVien.Visible = false;
            this.cboMaSinhVien.SelectedIndexChanged += new System.EventHandler(this.cboMaSinhVien_SelectedIndexChanged);
            this.cboMaSinhVien.SelectedValueChanged += new System.EventHandler(this.cboMaSinhVien_SelectedValueChanged);
            this.cboMaSinhVien.TextChanged += new System.EventHandler(this.cboMaSinhVien_TextChanged);
            // 
            // label3
            // 
            this.label3.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Times New Roman", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.Blue;
            this.label3.Location = new System.Drawing.Point(184, 42);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(151, 22);
            this.label3.TabIndex = 27;
            this.label3.Text = "Mã Số Sinh Viên:";
            // 
            // cboHocKi
            // 
            this.cboHocKi.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.cboHocKi.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboHocKi.FormattingEnabled = true;
            this.cboHocKi.Location = new System.Drawing.Point(859, 35);
            this.cboHocKi.Name = "cboHocKi";
            this.cboHocKi.Size = new System.Drawing.Size(233, 28);
            this.cboHocKi.TabIndex = 2;
            this.cboHocKi.SelectedIndexChanged += new System.EventHandler(this.cboHocKi_SelectedIndexChanged);
            // 
            // cboNamHoc
            // 
            this.cboNamHoc.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.cboNamHoc.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboNamHoc.FormattingEnabled = true;
            this.cboNamHoc.Location = new System.Drawing.Point(859, 98);
            this.cboNamHoc.Name = "cboNamHoc";
            this.cboNamHoc.Size = new System.Drawing.Size(233, 28);
            this.cboNamHoc.TabIndex = 3;
            this.cboNamHoc.SelectedIndexChanged += new System.EventHandler(this.cboNamHoc_SelectedIndexChanged);
            // 
            // lblTenKhoas
            // 
            this.lblTenKhoas.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.lblTenKhoas.AutoSize = true;
            this.lblTenKhoas.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTenKhoas.ForeColor = System.Drawing.Color.Blue;
            this.lblTenKhoas.Location = new System.Drawing.Point(755, 41);
            this.lblTenKhoas.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblTenKhoas.Name = "lblTenKhoas";
            this.lblTenKhoas.Size = new System.Drawing.Size(77, 22);
            this.lblTenKhoas.TabIndex = 0;
            this.lblTenKhoas.Text = "Học Kì :";
            // 
            // lblMaKhoas
            // 
            this.lblMaKhoas.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.lblMaKhoas.AutoSize = true;
            this.lblMaKhoas.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMaKhoas.ForeColor = System.Drawing.Color.Blue;
            this.lblMaKhoas.Location = new System.Drawing.Point(755, 104);
            this.lblMaKhoas.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblMaKhoas.Name = "lblMaKhoas";
            this.lblMaKhoas.Size = new System.Drawing.Size(97, 22);
            this.lblMaKhoas.TabIndex = 0;
            this.lblMaKhoas.Text = "Năm Học :";
            // 
            // dataGridView
            // 
            this.dataGridView.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView.Location = new System.Drawing.Point(252, 279);
            this.dataGridView.Name = "dataGridView";
            this.dataGridView.RowTemplate.Height = 24;
            this.dataGridView.Size = new System.Drawing.Size(773, 452);
            this.dataGridView.TabIndex = 28;
            // 
            // btnInDanhSach
            // 
            this.btnInDanhSach.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnInDanhSach.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnInDanhSach.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnInDanhSach.Location = new System.Drawing.Point(74, 375);
            this.btnInDanhSach.Name = "btnInDanhSach";
            this.btnInDanhSach.Shape = new DevComponents.DotNetBar.RoundRectangleShapeDescriptor(2);
            this.btnInDanhSach.Size = new System.Drawing.Size(103, 89);
            this.btnInDanhSach.Style = DevComponents.DotNetBar.eDotNetBarStyle.Office2010;
            this.btnInDanhSach.Symbol = "";
            this.btnInDanhSach.SymbolColor = System.Drawing.Color.Black;
            this.btnInDanhSach.SymbolSize = 20F;
            this.btnInDanhSach.TabIndex = 4;
            this.btnInDanhSach.Text = "In Danh Sách";
            this.btnInDanhSach.ThemeAware = true;
            this.btnInDanhSach.Click += new System.EventHandler(this.btnInDanhSach_Click);
            // 
            // btnHocPhi
            // 
            this.btnHocPhi.FixedSize = new System.Drawing.Size(90, 101);
            this.btnHocPhi.Image = ((System.Drawing.Image)(resources.GetObject("btnHocPhi.Image")));
            this.btnHocPhi.ImageFixedSize = new System.Drawing.Size(50, 50);
            this.btnHocPhi.ImageListSizeSelection = DevComponents.DotNetBar.eButtonImageListSelection.Large;
            this.btnHocPhi.ImagePosition = DevComponents.DotNetBar.eImagePosition.Top;
            this.btnHocPhi.Name = "btnHocPhi";
            this.btnHocPhi.NotificationMarkPosition = DevComponents.DotNetBar.eNotificationMarkPosition.BottomRight;
            this.btnHocPhi.SubItemsExpandWidth = 14;
            this.btnHocPhi.Text = "<div width=\"80\" align=\"center\">In <br/> Học Phí\r\n</div>";
            // 
            // buttonItem1
            // 
            this.buttonItem1.FixedSize = new System.Drawing.Size(90, 101);
            this.buttonItem1.Image = ((System.Drawing.Image)(resources.GetObject("buttonItem1.Image")));
            this.buttonItem1.ImageFixedSize = new System.Drawing.Size(50, 50);
            this.buttonItem1.ImageListSizeSelection = DevComponents.DotNetBar.eButtonImageListSelection.Large;
            this.buttonItem1.ImagePosition = DevComponents.DotNetBar.eImagePosition.Top;
            this.buttonItem1.Name = "buttonItem1";
            this.buttonItem1.NotificationMarkPosition = DevComponents.DotNetBar.eNotificationMarkPosition.BottomRight;
            this.buttonItem1.SubItemsExpandWidth = 14;
            this.buttonItem1.Text = "<div width=\"80\" align=\"center\">In <br/> Học Phí\r\n</div>";
            // 
            // buttonItem2
            // 
            this.buttonItem2.FixedSize = new System.Drawing.Size(90, 101);
            this.buttonItem2.Image = ((System.Drawing.Image)(resources.GetObject("buttonItem2.Image")));
            this.buttonItem2.ImageFixedSize = new System.Drawing.Size(50, 50);
            this.buttonItem2.ImageListSizeSelection = DevComponents.DotNetBar.eButtonImageListSelection.Large;
            this.buttonItem2.ImagePosition = DevComponents.DotNetBar.eImagePosition.Top;
            this.buttonItem2.Name = "buttonItem2";
            this.buttonItem2.NotificationMarkPosition = DevComponents.DotNetBar.eNotificationMarkPosition.BottomRight;
            this.buttonItem2.SubItemsExpandWidth = 14;
            this.buttonItem2.Text = "<div width=\"80\" align=\"center\">In <br/> Học Phí\r\n</div>";
            // 
            // UCHocPhi
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.btnInDanhSach);
            this.Controls.Add(this.dataGridView);
            this.Controls.Add(this.grpTimKiem);
            this.Controls.Add(this.lblXDanhSachKhoaVien);
            this.Name = "UCHocPhi";
            this.Size = new System.Drawing.Size(1276, 698);
            this.grpTimKiem.ResumeLayout(false);
            this.grpTimKiem.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DevComponents.DotNetBar.LabelX lblXDanhSachKhoaVien;
        private System.Windows.Forms.GroupBox grpTimKiem;
        private System.Windows.Forms.Label lblTenKhoas;
        private System.Windows.Forms.Label lblMaKhoas;
        private System.Windows.Forms.ComboBox cboHocKi;
        private System.Windows.Forms.ComboBox cboNamHoc;
        private System.Windows.Forms.DataGridView dataGridView;
        private System.Windows.Forms.ComboBox cboMaSinhVien;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.CheckBox chkIsMaSoSinhVien;
        private DevComponents.DotNetBar.ButtonItem btnHocPhi;
        private DevComponents.DotNetBar.ButtonItem buttonItem1;
        private DevComponents.DotNetBar.ButtonItem buttonItem2;
        private DevComponents.DotNetBar.ButtonX btnInDanhSach;
    }
}
