namespace QLSV1
{
    partial class UCKetQuaXuLyHocTap
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(UCKetQuaXuLyHocTap));
            this.btnCaiDat = new DevComponents.DotNetBar.ButtonX();
            this.lblXDanhSachKhoaVien = new DevComponents.DotNetBar.LabelX();
            this.dataGridView = new System.Windows.Forms.DataGridView();
            this.chkMuc1 = new System.Windows.Forms.CheckBox();
            this.chkMuc2 = new System.Windows.Forms.CheckBox();
            this.chkMuc3 = new System.Windows.Forms.CheckBox();
            this.btnInDanhSach = new DevComponents.DotNetBar.ButtonX();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).BeginInit();
            this.SuspendLayout();
            // 
            // btnCaiDat
            // 
            this.btnCaiDat.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnCaiDat.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnCaiDat.Image = ((System.Drawing.Image)(resources.GetObject("btnCaiDat.Image")));
            this.btnCaiDat.ImageFixedSize = new System.Drawing.Size(50, 50);
            this.btnCaiDat.Location = new System.Drawing.Point(3, 3);
            this.btnCaiDat.Name = "btnCaiDat";
            this.btnCaiDat.Shape = new DevComponents.DotNetBar.EllipticalShapeDescriptor();
            this.btnCaiDat.Size = new System.Drawing.Size(69, 69);
            this.btnCaiDat.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btnCaiDat.TabIndex = 28;
            this.btnCaiDat.Click += new System.EventHandler(this.btnCaiDat_Click);
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
            this.lblXDanhSachKhoaVien.TabIndex = 29;
            this.lblXDanhSachKhoaVien.Text = "DANH SÁCH SINH VIÊN BỊ CẢNH CÁO HỌC TẬP";
            this.lblXDanhSachKhoaVien.TextAlignment = System.Drawing.StringAlignment.Center;
            // 
            // dataGridView
            // 
            this.dataGridView.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView.Location = new System.Drawing.Point(100, 188);
            this.dataGridView.Name = "dataGridView";
            this.dataGridView.RowTemplate.Height = 24;
            this.dataGridView.Size = new System.Drawing.Size(961, 331);
            this.dataGridView.TabIndex = 30;
            // 
            // chkMuc1
            // 
            this.chkMuc1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.chkMuc1.AutoSize = true;
            this.chkMuc1.Font = new System.Drawing.Font("Times New Roman", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkMuc1.ForeColor = System.Drawing.Color.Blue;
            this.chkMuc1.Location = new System.Drawing.Point(103, 145);
            this.chkMuc1.Name = "chkMuc1";
            this.chkMuc1.Size = new System.Drawing.Size(173, 26);
            this.chkMuc1.TabIndex = 0;
            this.chkMuc1.Text = "Cảnh Cáo Mức 1";
            this.chkMuc1.UseVisualStyleBackColor = true;
            this.chkMuc1.CheckedChanged += new System.EventHandler(this.chkMuc1_CheckedChanged);
            // 
            // chkMuc2
            // 
            this.chkMuc2.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.chkMuc2.AutoSize = true;
            this.chkMuc2.Font = new System.Drawing.Font("Times New Roman", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkMuc2.ForeColor = System.Drawing.Color.Blue;
            this.chkMuc2.Location = new System.Drawing.Point(485, 145);
            this.chkMuc2.Name = "chkMuc2";
            this.chkMuc2.Size = new System.Drawing.Size(173, 26);
            this.chkMuc2.TabIndex = 1;
            this.chkMuc2.Text = "Cảnh Cáo Mức 2";
            this.chkMuc2.UseVisualStyleBackColor = true;
            this.chkMuc2.CheckedChanged += new System.EventHandler(this.chkMuc2_CheckedChanged);
            // 
            // chkMuc3
            // 
            this.chkMuc3.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.chkMuc3.AutoSize = true;
            this.chkMuc3.Font = new System.Drawing.Font("Times New Roman", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkMuc3.ForeColor = System.Drawing.Color.Blue;
            this.chkMuc3.Location = new System.Drawing.Point(907, 145);
            this.chkMuc3.Name = "chkMuc3";
            this.chkMuc3.Size = new System.Drawing.Size(173, 26);
            this.chkMuc3.TabIndex = 2;
            this.chkMuc3.Text = "Cảnh Cáo Mức 3";
            this.chkMuc3.UseVisualStyleBackColor = true;
            this.chkMuc3.CheckedChanged += new System.EventHandler(this.chkMuc3_CheckedChanged);
            // 
            // btnInDanhSach
            // 
            this.btnInDanhSach.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnInDanhSach.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnInDanhSach.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnInDanhSach.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnInDanhSach.Font = new System.Drawing.Font("Times New Roman", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnInDanhSach.Location = new System.Drawing.Point(1098, 286);
            this.btnInDanhSach.Name = "btnInDanhSach";
            this.btnInDanhSach.Shape = new DevComponents.DotNetBar.RoundRectangleShapeDescriptor(2);
            this.btnInDanhSach.Size = new System.Drawing.Size(123, 131);
            this.btnInDanhSach.Style = DevComponents.DotNetBar.eDotNetBarStyle.Office2010;
            this.btnInDanhSach.Symbol = "";
            this.btnInDanhSach.SymbolColor = System.Drawing.Color.Black;
            this.btnInDanhSach.SymbolSize = 20F;
            this.btnInDanhSach.TabIndex = 3;
            this.btnInDanhSach.Text = "In Danh Sách";
            this.btnInDanhSach.ThemeAware = true;
            this.btnInDanhSach.Click += new System.EventHandler(this.btnInDanhSach_Click);
            // 
            // UCKetQuaXuLyHocTap
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.btnInDanhSach);
            this.Controls.Add(this.chkMuc3);
            this.Controls.Add(this.chkMuc2);
            this.Controls.Add(this.chkMuc1);
            this.Controls.Add(this.dataGridView);
            this.Controls.Add(this.btnCaiDat);
            this.Controls.Add(this.lblXDanhSachKhoaVien);
            this.Name = "UCKetQuaXuLyHocTap";
            this.Size = new System.Drawing.Size(1276, 698);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private DevComponents.DotNetBar.ButtonX btnCaiDat;
        private DevComponents.DotNetBar.LabelX lblXDanhSachKhoaVien;
        private System.Windows.Forms.DataGridView dataGridView;
        private System.Windows.Forms.CheckBox chkMuc1;
        private System.Windows.Forms.CheckBox chkMuc2;
        private System.Windows.Forms.CheckBox chkMuc3;
        private DevComponents.DotNetBar.ButtonX btnInDanhSach;
    }
}
