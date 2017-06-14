namespace QLSV1
{
    partial class UCXetHocBong
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
            this.label4 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.updPhanTram = new System.Windows.Forms.NumericUpDown();
            this.updSoLuong = new System.Windows.Forms.NumericUpDown();
            this.radioPhanTram = new System.Windows.Forms.RadioButton();
            this.radioSoLuong = new System.Windows.Forms.RadioButton();
            this.label1 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.dataGridView = new System.Windows.Forms.DataGridView();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.cboHocKi = new System.Windows.Forms.ComboBox();
            this.cboNamHoc = new System.Windows.Forms.ComboBox();
            this.lblTenKhoas = new System.Windows.Forms.Label();
            this.lblMaKhoas = new System.Windows.Forms.Label();
            this.btnInDanhSach = new DevComponents.DotNetBar.ButtonX();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.updPhanTram)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.updSoLuong)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).BeginInit();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // label4
            // 
            this.label4.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Times New Roman", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.Blue;
            this.label4.Location = new System.Drawing.Point(514, 10);
            this.label4.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(248, 35);
            this.label4.TabIndex = 29;
            this.label4.Text = "XÉT HỌC BỔNG";
            this.label4.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.groupBox1.Controls.Add(this.updPhanTram);
            this.groupBox1.Controls.Add(this.updSoLuong);
            this.groupBox1.Controls.Add(this.radioPhanTram);
            this.groupBox1.Controls.Add(this.radioSoLuong);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(0, 108);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(638, 136);
            this.groupBox1.TabIndex = 32;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Tiêu Chí Xét Học Bổng";
            // 
            // updPhanTram
            // 
            this.updPhanTram.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.updPhanTram.Location = new System.Drawing.Point(401, 91);
            this.updPhanTram.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.updPhanTram.Name = "updPhanTram";
            this.updPhanTram.Size = new System.Drawing.Size(58, 27);
            this.updPhanTram.TabIndex = 3;
            this.updPhanTram.Value = new decimal(new int[] {
            10,
            0,
            0,
            0});
            this.updPhanTram.Visible = false;
            this.updPhanTram.ValueChanged += new System.EventHandler(this.updPhanTram_ValueChanged);
            // 
            // updSoLuong
            // 
            this.updSoLuong.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.updSoLuong.Location = new System.Drawing.Point(401, 36);
            this.updSoLuong.Maximum = new decimal(new int[] {
            10000,
            0,
            0,
            0});
            this.updSoLuong.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.updSoLuong.Name = "updSoLuong";
            this.updSoLuong.Size = new System.Drawing.Size(58, 27);
            this.updSoLuong.TabIndex = 1;
            this.updSoLuong.Value = new decimal(new int[] {
            10,
            0,
            0,
            0});
            this.updSoLuong.ValueChanged += new System.EventHandler(this.updSoLuong_ValueChanged);
            // 
            // radioPhanTram
            // 
            this.radioPhanTram.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.radioPhanTram.AutoSize = true;
            this.radioPhanTram.Location = new System.Drawing.Point(368, 95);
            this.radioPhanTram.Name = "radioPhanTram";
            this.radioPhanTram.Size = new System.Drawing.Size(17, 16);
            this.radioPhanTram.TabIndex = 2;
            this.radioPhanTram.UseVisualStyleBackColor = true;
            // 
            // radioSoLuong
            // 
            this.radioSoLuong.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.radioSoLuong.AutoSize = true;
            this.radioSoLuong.Checked = true;
            this.radioSoLuong.Location = new System.Drawing.Point(368, 42);
            this.radioSoLuong.Name = "radioSoLuong";
            this.radioSoLuong.Size = new System.Drawing.Size(17, 16);
            this.radioSoLuong.TabIndex = 0;
            this.radioSoLuong.TabStop = true;
            this.radioSoLuong.UseVisualStyleBackColor = true;
            this.radioSoLuong.CheckedChanged += new System.EventHandler(this.radioSoLuong_CheckedChanged);
            // 
            // label1
            // 
            this.label1.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.Blue;
            this.label1.Location = new System.Drawing.Point(183, 37);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(170, 22);
            this.label1.TabIndex = 33;
            this.label1.Text = "Xét Theo Số Lượng";
            // 
            // label3
            // 
            this.label3.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Times New Roman", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.Blue;
            this.label3.Location = new System.Drawing.Point(183, 93);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(182, 22);
            this.label3.TabIndex = 32;
            this.label3.Text = "Xét Theo Phần Trăm";
            // 
            // dataGridView
            // 
            this.dataGridView.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView.Location = new System.Drawing.Point(181, 255);
            this.dataGridView.Name = "dataGridView";
            this.dataGridView.RowTemplate.Height = 24;
            this.dataGridView.Size = new System.Drawing.Size(914, 362);
            this.dataGridView.TabIndex = 33;
            // 
            // groupBox2
            // 
            this.groupBox2.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.groupBox2.Controls.Add(this.cboHocKi);
            this.groupBox2.Controls.Add(this.cboNamHoc);
            this.groupBox2.Controls.Add(this.lblTenKhoas);
            this.groupBox2.Controls.Add(this.lblMaKhoas);
            this.groupBox2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox2.Location = new System.Drawing.Point(638, 108);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(638, 136);
            this.groupBox2.TabIndex = 38;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Thời Gian";
            this.groupBox2.Enter += new System.EventHandler(this.groupBox2_Enter);
            // 
            // cboHocKi
            // 
            this.cboHocKi.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.cboHocKi.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboHocKi.FormattingEnabled = true;
            this.cboHocKi.Location = new System.Drawing.Point(255, 36);
            this.cboHocKi.Name = "cboHocKi";
            this.cboHocKi.Size = new System.Drawing.Size(233, 28);
            this.cboHocKi.TabIndex = 4;
            this.cboHocKi.SelectedIndexChanged += new System.EventHandler(this.cboHocKi_SelectedIndexChanged);
            // 
            // cboNamHoc
            // 
            this.cboNamHoc.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.cboNamHoc.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboNamHoc.FormattingEnabled = true;
            this.cboNamHoc.Location = new System.Drawing.Point(255, 83);
            this.cboNamHoc.Name = "cboNamHoc";
            this.cboNamHoc.Size = new System.Drawing.Size(233, 28);
            this.cboNamHoc.TabIndex = 5;
            this.cboNamHoc.SelectedIndexChanged += new System.EventHandler(this.cboNamHoc_SelectedIndexChanged);
            // 
            // lblTenKhoas
            // 
            this.lblTenKhoas.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.lblTenKhoas.AutoSize = true;
            this.lblTenKhoas.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTenKhoas.ForeColor = System.Drawing.Color.Blue;
            this.lblTenKhoas.Location = new System.Drawing.Point(151, 42);
            this.lblTenKhoas.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblTenKhoas.Name = "lblTenKhoas";
            this.lblTenKhoas.Size = new System.Drawing.Size(77, 22);
            this.lblTenKhoas.TabIndex = 3;
            this.lblTenKhoas.Text = "Học Kì :";
            // 
            // lblMaKhoas
            // 
            this.lblMaKhoas.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.lblMaKhoas.AutoSize = true;
            this.lblMaKhoas.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMaKhoas.ForeColor = System.Drawing.Color.Blue;
            this.lblMaKhoas.Location = new System.Drawing.Point(151, 89);
            this.lblMaKhoas.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblMaKhoas.Name = "lblMaKhoas";
            this.lblMaKhoas.Size = new System.Drawing.Size(97, 22);
            this.lblMaKhoas.TabIndex = 4;
            this.lblMaKhoas.Text = "Năm Học :";
            // 
            // btnInDanhSach
            // 
            this.btnInDanhSach.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnInDanhSach.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnInDanhSach.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnInDanhSach.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnInDanhSach.Location = new System.Drawing.Point(1141, 377);
            this.btnInDanhSach.Name = "btnInDanhSach";
            this.btnInDanhSach.Shape = new DevComponents.DotNetBar.RoundRectangleShapeDescriptor(2);
            this.btnInDanhSach.Size = new System.Drawing.Size(110, 89);
            this.btnInDanhSach.Style = DevComponents.DotNetBar.eDotNetBarStyle.Office2010;
            this.btnInDanhSach.Symbol = "";
            this.btnInDanhSach.SymbolColor = System.Drawing.Color.Black;
            this.btnInDanhSach.SymbolSize = 20F;
            this.btnInDanhSach.TabIndex = 6;
            this.btnInDanhSach.Text = "In Danh Sách";
            this.btnInDanhSach.ThemeAware = true;
            this.btnInDanhSach.Click += new System.EventHandler(this.btnInDanhSach_Click);
            // 
            // UCXetHocBong
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.Controls.Add(this.btnInDanhSach);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.dataGridView);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.label4);
            this.Name = "UCXetHocBong";
            this.Size = new System.Drawing.Size(1276, 698);
            this.Load += new System.EventHandler(this.UCXetHocBong_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.updPhanTram)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.updSoLuong)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).EndInit();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.NumericUpDown updPhanTram;
        private System.Windows.Forms.NumericUpDown updSoLuong;
        private System.Windows.Forms.RadioButton radioPhanTram;
        private System.Windows.Forms.RadioButton radioSoLuong;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.DataGridView dataGridView;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.ComboBox cboHocKi;
        private System.Windows.Forms.ComboBox cboNamHoc;
        private System.Windows.Forms.Label lblTenKhoas;
        private System.Windows.Forms.Label lblMaKhoas;
        private DevComponents.DotNetBar.ButtonX btnInDanhSach;

    }
}
