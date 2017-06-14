namespace QLSV1
{
    partial class frmThemSVVaoLop
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

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmThemSVVaoLop));
            this.grpLopTinChi = new System.Windows.Forms.GroupBox();
            this.cboMaLopTinChi = new System.Windows.Forms.ComboBox();
            this.lblMaLopTinChi = new System.Windows.Forms.Label();
            this.grpNhap = new System.Windows.Forms.GroupBox();
            this.cboTenMonHoc = new System.Windows.Forms.ComboBox();
            this.lblMaSinhVien = new System.Windows.Forms.Label();
            this.lblTenMonHoc = new System.Windows.Forms.Label();
            this.cboMaSinhVien = new System.Windows.Forms.ComboBox();
            this.cboNamHoc = new System.Windows.Forms.ComboBox();
            this.lblNamHoc = new System.Windows.Forms.Label();
            this.cboHocKy = new System.Windows.Forms.ComboBox();
            this.lblHocKy = new System.Windows.Forms.Label();
            this.grbbutton = new System.Windows.Forms.GroupBox();
            this.btnThem = new System.Windows.Forms.Button();
            this.grpNoiDung = new System.Windows.Forms.GroupBox();
            this.dgdNoiDung = new System.Windows.Forms.DataGridView();
            this.btnNhap = new System.Windows.Forms.Button();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.btnXuat = new System.Windows.Forms.Button();
            this.grpLopTinChi.SuspendLayout();
            this.grpNhap.SuspendLayout();
            this.grbbutton.SuspendLayout();
            this.grpNoiDung.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgdNoiDung)).BeginInit();
            this.SuspendLayout();
            // 
            // grpLopTinChi
            // 
            this.grpLopTinChi.Controls.Add(this.cboMaLopTinChi);
            this.grpLopTinChi.Controls.Add(this.lblMaLopTinChi);
            this.grpLopTinChi.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grpLopTinChi.Location = new System.Drawing.Point(15, 24);
            this.grpLopTinChi.Name = "grpLopTinChi";
            this.grpLopTinChi.Size = new System.Drawing.Size(845, 89);
            this.grpLopTinChi.TabIndex = 0;
            this.grpLopTinChi.TabStop = false;
            this.grpLopTinChi.Text = "Chọn Lớp";
            // 
            // cboMaLopTinChi
            // 
            this.cboMaLopTinChi.FormattingEnabled = true;
            this.cboMaLopTinChi.Location = new System.Drawing.Point(179, 32);
            this.cboMaLopTinChi.Name = "cboMaLopTinChi";
            this.cboMaLopTinChi.Size = new System.Drawing.Size(187, 25);
            this.cboMaLopTinChi.TabIndex = 0;
            this.cboMaLopTinChi.SelectedValueChanged += new System.EventHandler(this.cboMaLopTinChi_SelectedValueChanged);
            // 
            // lblMaLopTinChi
            // 
            this.lblMaLopTinChi.AutoSize = true;
            this.lblMaLopTinChi.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMaLopTinChi.Location = new System.Drawing.Point(49, 32);
            this.lblMaLopTinChi.Name = "lblMaLopTinChi";
            this.lblMaLopTinChi.Size = new System.Drawing.Size(98, 19);
            this.lblMaLopTinChi.TabIndex = 0;
            this.lblMaLopTinChi.Text = "Lớp Tín Chỉ :";
            // 
            // grpNhap
            // 
            this.grpNhap.Controls.Add(this.cboTenMonHoc);
            this.grpNhap.Controls.Add(this.lblMaSinhVien);
            this.grpNhap.Controls.Add(this.lblTenMonHoc);
            this.grpNhap.Controls.Add(this.cboMaSinhVien);
            this.grpNhap.Controls.Add(this.cboNamHoc);
            this.grpNhap.Controls.Add(this.lblNamHoc);
            this.grpNhap.Controls.Add(this.cboHocKy);
            this.grpNhap.Controls.Add(this.lblHocKy);
            this.grpNhap.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grpNhap.Location = new System.Drawing.Point(15, 144);
            this.grpNhap.Name = "grpNhap";
            this.grpNhap.Size = new System.Drawing.Size(845, 157);
            this.grpNhap.TabIndex = 1;
            this.grpNhap.TabStop = false;
            this.grpNhap.Text = "Nhập Sinh Viên";
            // 
            // cboTenMonHoc
            // 
            this.cboTenMonHoc.FormattingEnabled = true;
            this.cboTenMonHoc.Location = new System.Drawing.Point(609, 40);
            this.cboTenMonHoc.Name = "cboTenMonHoc";
            this.cboTenMonHoc.Size = new System.Drawing.Size(187, 25);
            this.cboTenMonHoc.TabIndex = 3;
            this.cboTenMonHoc.SelectedValueChanged += new System.EventHandler(this.cboTenMonHoc_SelectedValueChanged);
            // 
            // lblMaSinhVien
            // 
            this.lblMaSinhVien.AutoSize = true;
            this.lblMaSinhVien.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMaSinhVien.Location = new System.Drawing.Point(480, 92);
            this.lblMaSinhVien.Name = "lblMaSinhVien";
            this.lblMaSinhVien.Size = new System.Drawing.Size(109, 19);
            this.lblMaSinhVien.TabIndex = 0;
            this.lblMaSinhVien.Text = "Mã Sinh Viên :";
            // 
            // lblTenMonHoc
            // 
            this.lblTenMonHoc.AutoSize = true;
            this.lblTenMonHoc.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTenMonHoc.Location = new System.Drawing.Point(480, 42);
            this.lblTenMonHoc.Name = "lblTenMonHoc";
            this.lblTenMonHoc.Size = new System.Drawing.Size(102, 19);
            this.lblTenMonHoc.TabIndex = 0;
            this.lblTenMonHoc.Text = "Tên Môn Học";
            // 
            // cboMaSinhVien
            // 
            this.cboMaSinhVien.FormattingEnabled = true;
            this.cboMaSinhVien.Location = new System.Drawing.Point(609, 92);
            this.cboMaSinhVien.Name = "cboMaSinhVien";
            this.cboMaSinhVien.Size = new System.Drawing.Size(187, 25);
            this.cboMaSinhVien.TabIndex = 4;
            // 
            // cboNamHoc
            // 
            this.cboNamHoc.FormattingEnabled = true;
            this.cboNamHoc.Location = new System.Drawing.Point(178, 40);
            this.cboNamHoc.Name = "cboNamHoc";
            this.cboNamHoc.Size = new System.Drawing.Size(187, 25);
            this.cboNamHoc.TabIndex = 1;
            this.cboNamHoc.SelectedValueChanged += new System.EventHandler(this.cboNamHoc_SelectedValueChanged);
            // 
            // lblNamHoc
            // 
            this.lblNamHoc.AutoSize = true;
            this.lblNamHoc.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNamHoc.Location = new System.Drawing.Point(49, 42);
            this.lblNamHoc.Name = "lblNamHoc";
            this.lblNamHoc.Size = new System.Drawing.Size(81, 19);
            this.lblNamHoc.TabIndex = 0;
            this.lblNamHoc.Text = "Năm Học :";
            // 
            // cboHocKy
            // 
            this.cboHocKy.FormattingEnabled = true;
            this.cboHocKy.Location = new System.Drawing.Point(178, 92);
            this.cboHocKy.Name = "cboHocKy";
            this.cboHocKy.Size = new System.Drawing.Size(187, 25);
            this.cboHocKy.TabIndex = 2;
            this.cboHocKy.SelectedValueChanged += new System.EventHandler(this.cboHocKy_SelectedValueChanged);
            // 
            // lblHocKy
            // 
            this.lblHocKy.AutoSize = true;
            this.lblHocKy.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblHocKy.Location = new System.Drawing.Point(49, 92);
            this.lblHocKy.Name = "lblHocKy";
            this.lblHocKy.Size = new System.Drawing.Size(69, 19);
            this.lblHocKy.TabIndex = 0;
            this.lblHocKy.Text = "Học Kỳ :";
            // 
            // grbbutton
            // 
            this.grbbutton.Controls.Add(this.btnXuat);
            this.grbbutton.Controls.Add(this.btnNhap);
            this.grbbutton.Controls.Add(this.btnThem);
            this.grbbutton.Location = new System.Drawing.Point(15, 565);
            this.grbbutton.Name = "grbbutton";
            this.grbbutton.Size = new System.Drawing.Size(845, 75);
            this.grbbutton.TabIndex = 2;
            this.grbbutton.TabStop = false;
            // 
            // btnThem
            // 
            this.btnThem.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThem.Location = new System.Drawing.Point(386, 22);
            this.btnThem.Name = "btnThem";
            this.btnThem.Size = new System.Drawing.Size(75, 32);
            this.btnThem.TabIndex = 5;
            this.btnThem.Text = "Thêm";
            this.btnThem.UseVisualStyleBackColor = true;
            this.btnThem.Click += new System.EventHandler(this.btnThem_Click);
            // 
            // grpNoiDung
            // 
            this.grpNoiDung.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.grpNoiDung.Controls.Add(this.dgdNoiDung);
            this.grpNoiDung.Location = new System.Drawing.Point(15, 307);
            this.grpNoiDung.Name = "grpNoiDung";
            this.grpNoiDung.Size = new System.Drawing.Size(845, 252);
            this.grpNoiDung.TabIndex = 3;
            this.grpNoiDung.TabStop = false;
            // 
            // dgdNoiDung
            // 
            this.dgdNoiDung.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgdNoiDung.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgdNoiDung.Location = new System.Drawing.Point(6, 14);
            this.dgdNoiDung.Name = "dgdNoiDung";
            this.dgdNoiDung.Size = new System.Drawing.Size(833, 232);
            this.dgdNoiDung.TabIndex = 4;
            // 
            // btnNhap
            // 
            this.btnNhap.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnNhap.Location = new System.Drawing.Point(273, 22);
            this.btnNhap.Name = "btnNhap";
            this.btnNhap.Size = new System.Drawing.Size(75, 32);
            this.btnNhap.TabIndex = 5;
            this.btnNhap.Text = "Nhập";
            this.btnNhap.UseVisualStyleBackColor = true;
            this.btnNhap.Click += new System.EventHandler(this.btnNhap_Click);
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.Filter = "Excel files(*.xls)|*.xls|Excel files(*.xlsx)|*xlsx|All files (*.*)|*.*";
            this.openFileDialog1.FilterIndex = 2;
            this.openFileDialog1.Title = "Bạn hãy chọn một file excel";
            this.openFileDialog1.FileOk += new System.ComponentModel.CancelEventHandler(this.openFileDialog1_FileOk);
            // 
            // btnXuat
            // 
            this.btnXuat.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnXuat.Location = new System.Drawing.Point(496, 21);
            this.btnXuat.Name = "btnXuat";
            this.btnXuat.Size = new System.Drawing.Size(75, 32);
            this.btnXuat.TabIndex = 5;
            this.btnXuat.Text = "Xuất";
            this.btnXuat.UseVisualStyleBackColor = true;
            this.btnXuat.Click += new System.EventHandler(this.btnXuat_Click);
            // 
            // frmThemSVVaoLop
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(874, 663);
            this.Controls.Add(this.grpNoiDung);
            this.Controls.Add(this.grbbutton);
            this.Controls.Add(this.grpNhap);
            this.Controls.Add(this.grpLopTinChi);
            this.Font = new System.Drawing.Font("Times New Roman", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmThemSVVaoLop";
            this.Text = "Thêm Sinh Viên";
            this.Load += new System.EventHandler(this.frmThemSVVaoLop_Load);
            this.grpLopTinChi.ResumeLayout(false);
            this.grpLopTinChi.PerformLayout();
            this.grpNhap.ResumeLayout(false);
            this.grpNhap.PerformLayout();
            this.grbbutton.ResumeLayout(false);
            this.grpNoiDung.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgdNoiDung)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox grpLopTinChi;
        private System.Windows.Forms.Label lblMaLopTinChi;
        private System.Windows.Forms.ComboBox cboMaLopTinChi;
        private System.Windows.Forms.GroupBox grpNhap;
        private System.Windows.Forms.ComboBox cboTenMonHoc;
        private System.Windows.Forms.Label lblTenMonHoc;
        private System.Windows.Forms.ComboBox cboNamHoc;
        private System.Windows.Forms.Label lblNamHoc;
        private System.Windows.Forms.ComboBox cboHocKy;
        private System.Windows.Forms.Label lblHocKy;
        private System.Windows.Forms.ComboBox cboMaSinhVien;
        private System.Windows.Forms.Label lblMaSinhVien;
        private System.Windows.Forms.GroupBox grbbutton;
        private System.Windows.Forms.Button btnThem;
        private System.Windows.Forms.GroupBox grpNoiDung;
        private System.Windows.Forms.DataGridView dgdNoiDung;
        private System.Windows.Forms.Button btnNhap;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.Button btnXuat;
    }
}