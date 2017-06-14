namespace QLSV1
{
    partial class frmSettingCanhCaoHocTap
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmSettingCanhCaoHocTap));
            this.lblMatKhau = new System.Windows.Forms.Label();
            this.lblTenServer = new System.Windows.Forms.Label();
            this.lblTenDangNhap = new System.Windows.Forms.Label();
            this.updMucMot = new System.Windows.Forms.NumericUpDown();
            this.label4 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.updMucHai = new System.Windows.Forms.NumericUpDown();
            this.updMucBa = new System.Windows.Forms.NumericUpDown();
            this.btnLuuLai = new DevComponents.DotNetBar.ButtonX();
            ((System.ComponentModel.ISupportInitialize)(this.updMucMot)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.updMucHai)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.updMucBa)).BeginInit();
            this.SuspendLayout();
            // 
            // lblMatKhau
            // 
            this.lblMatKhau.AutoSize = true;
            this.lblMatKhau.Font = new System.Drawing.Font("Times New Roman", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMatKhau.ForeColor = System.Drawing.Color.Blue;
            this.lblMatKhau.Location = new System.Drawing.Point(51, 286);
            this.lblMatKhau.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblMatKhau.Name = "lblMatKhau";
            this.lblMatKhau.Size = new System.Drawing.Size(161, 22);
            this.lblMatKhau.TabIndex = 15;
            this.lblMatKhau.Text = "Cảnh Cáo Mức 3 :";
            // 
            // lblTenServer
            // 
            this.lblTenServer.AutoSize = true;
            this.lblTenServer.Font = new System.Drawing.Font("Times New Roman", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTenServer.ForeColor = System.Drawing.Color.Blue;
            this.lblTenServer.Location = new System.Drawing.Point(51, 160);
            this.lblTenServer.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblTenServer.Name = "lblTenServer";
            this.lblTenServer.Size = new System.Drawing.Size(161, 22);
            this.lblTenServer.TabIndex = 14;
            this.lblTenServer.Text = "Cảnh Cáo Mức 1 :";
            // 
            // lblTenDangNhap
            // 
            this.lblTenDangNhap.AutoSize = true;
            this.lblTenDangNhap.Font = new System.Drawing.Font("Times New Roman", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTenDangNhap.ForeColor = System.Drawing.Color.Blue;
            this.lblTenDangNhap.Location = new System.Drawing.Point(51, 220);
            this.lblTenDangNhap.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblTenDangNhap.Name = "lblTenDangNhap";
            this.lblTenDangNhap.Size = new System.Drawing.Size(161, 22);
            this.lblTenDangNhap.TabIndex = 16;
            this.lblTenDangNhap.Text = "Cảnh Cáo Mức 2 :";
            // 
            // updMucMot
            // 
            this.updMucMot.Location = new System.Drawing.Point(239, 161);
            this.updMucMot.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.updMucMot.Name = "updMucMot";
            this.updMucMot.Size = new System.Drawing.Size(52, 22);
            this.updMucMot.TabIndex = 0;
            this.updMucMot.Value = new decimal(new int[] {
            4,
            0,
            0,
            0});
            this.updMucMot.ValueChanged += new System.EventHandler(this.updMucMot_ValueChanged);
            // 
            // label4
            // 
            this.label4.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Times New Roman", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.Blue;
            this.label4.Location = new System.Drawing.Point(74, 19);
            this.label4.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(455, 35);
            this.label4.TabIndex = 18;
            this.label4.Text = "CÀI ĐẶT CẢNH CÁO HỌC TẬP";
            this.label4.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.Blue;
            this.label1.Location = new System.Drawing.Point(221, 64);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(161, 18);
            this.label1.TabIndex = 19;
            this.label1.Text = "TỔNG SỐ TÍN CHỈ NỢ";
            // 
            // updMucHai
            // 
            this.updMucHai.Location = new System.Drawing.Point(239, 219);
            this.updMucHai.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.updMucHai.Name = "updMucHai";
            this.updMucHai.Size = new System.Drawing.Size(52, 22);
            this.updMucHai.TabIndex = 1;
            this.updMucHai.Value = new decimal(new int[] {
            8,
            0,
            0,
            0});
            this.updMucHai.ValueChanged += new System.EventHandler(this.updMucHai_ValueChanged);
            // 
            // updMucBa
            // 
            this.updMucBa.Location = new System.Drawing.Point(239, 284);
            this.updMucBa.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.updMucBa.Name = "updMucBa";
            this.updMucBa.Size = new System.Drawing.Size(52, 22);
            this.updMucBa.TabIndex = 2;
            this.updMucBa.Value = new decimal(new int[] {
            12,
            0,
            0,
            0});
            // 
            // btnLuuLai
            // 
            this.btnLuuLai.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnLuuLai.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnLuuLai.Location = new System.Drawing.Point(418, 191);
            this.btnLuuLai.Name = "btnLuuLai";
            this.btnLuuLai.Size = new System.Drawing.Size(87, 84);
            this.btnLuuLai.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btnLuuLai.Symbol = "";
            this.btnLuuLai.TabIndex = 3;
            this.btnLuuLai.Text = "Lưu Lại";
            this.btnLuuLai.Click += new System.EventHandler(this.btnLuuLai_Click);
            // 
            // frmSettingCanhCaoHocTap
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(603, 394);
            this.Controls.Add(this.btnLuuLai);
            this.Controls.Add(this.updMucBa);
            this.Controls.Add(this.updMucHai);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.updMucMot);
            this.Controls.Add(this.lblMatKhau);
            this.Controls.Add(this.lblTenServer);
            this.Controls.Add(this.lblTenDangNhap);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmSettingCanhCaoHocTap";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Cài đặt cảnh cáo học tập";
            this.Load += new System.EventHandler(this.frmSettingCanhCaoHocTap_Load);
            ((System.ComponentModel.ISupportInitialize)(this.updMucMot)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.updMucHai)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.updMucBa)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblMatKhau;
        private System.Windows.Forms.Label lblTenServer;
        private System.Windows.Forms.Label lblTenDangNhap;
        private System.Windows.Forms.NumericUpDown updMucMot;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.NumericUpDown updMucHai;
        private System.Windows.Forms.NumericUpDown updMucBa;
        private DevComponents.DotNetBar.ButtonX btnLuuLai;
    }
}