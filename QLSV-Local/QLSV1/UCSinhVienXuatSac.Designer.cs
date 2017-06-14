namespace QLSV1
{
    partial class UCSinhVienXuatSac
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
            this.lblXDanhSachKhoaVien = new DevComponents.DotNetBar.LabelX();
            this.grpNoiDung = new System.Windows.Forms.GroupBox();
            this.dataGridView = new System.Windows.Forms.DataGridView();
            this.cboNamHoc = new System.Windows.Forms.ComboBox();
            this.lblMaKhoas = new System.Windows.Forms.Label();
            this.btnInDanhSach = new DevComponents.DotNetBar.ButtonX();
            this.grpNoiDung.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).BeginInit();
            this.SuspendLayout();
            // 
            // lblXDanhSachKhoaVien
            // 
            this.lblXDanhSachKhoaVien.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            // 
            // 
            // 
            this.lblXDanhSachKhoaVien.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.lblXDanhSachKhoaVien.Font = new System.Drawing.Font("Times New Roman", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblXDanhSachKhoaVien.ForeColor = System.Drawing.Color.Blue;
            this.lblXDanhSachKhoaVien.Location = new System.Drawing.Point(0, 12);
            this.lblXDanhSachKhoaVien.Margin = new System.Windows.Forms.Padding(4);
            this.lblXDanhSachKhoaVien.Name = "lblXDanhSachKhoaVien";
            this.lblXDanhSachKhoaVien.Size = new System.Drawing.Size(1276, 69);
            this.lblXDanhSachKhoaVien.TabIndex = 30;
            this.lblXDanhSachKhoaVien.Text = "DANH SÁCH SINH VIÊN XUẤT SẮC";
            this.lblXDanhSachKhoaVien.TextAlignment = System.Drawing.StringAlignment.Center;
            // 
            // grpNoiDung
            // 
            this.grpNoiDung.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.grpNoiDung.Controls.Add(this.dataGridView);
            this.grpNoiDung.Location = new System.Drawing.Point(88, 186);
            this.grpNoiDung.Margin = new System.Windows.Forms.Padding(4);
            this.grpNoiDung.Name = "grpNoiDung";
            this.grpNoiDung.Padding = new System.Windows.Forms.Padding(4);
            this.grpNoiDung.Size = new System.Drawing.Size(1101, 420);
            this.grpNoiDung.TabIndex = 33;
            this.grpNoiDung.TabStop = false;
            // 
            // dataGridView
            // 
            this.dataGridView.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView.Location = new System.Drawing.Point(23, 23);
            this.dataGridView.Margin = new System.Windows.Forms.Padding(4);
            this.dataGridView.Name = "dataGridView";
            this.dataGridView.Size = new System.Drawing.Size(1055, 379);
            this.dataGridView.TabIndex = 0;
            // 
            // cboNamHoc
            // 
            this.cboNamHoc.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.cboNamHoc.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboNamHoc.FormattingEnabled = true;
            this.cboNamHoc.Location = new System.Drawing.Point(435, 135);
            this.cboNamHoc.Name = "cboNamHoc";
            this.cboNamHoc.Size = new System.Drawing.Size(233, 24);
            this.cboNamHoc.TabIndex = 0;
            this.cboNamHoc.SelectedIndexChanged += new System.EventHandler(this.cboNamHoc_SelectedIndexChanged);
            // 
            // lblMaKhoas
            // 
            this.lblMaKhoas.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.lblMaKhoas.AutoSize = true;
            this.lblMaKhoas.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMaKhoas.ForeColor = System.Drawing.Color.Blue;
            this.lblMaKhoas.Location = new System.Drawing.Point(331, 135);
            this.lblMaKhoas.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblMaKhoas.Name = "lblMaKhoas";
            this.lblMaKhoas.Size = new System.Drawing.Size(97, 22);
            this.lblMaKhoas.TabIndex = 34;
            this.lblMaKhoas.Text = "Năm Học :";
            // 
            // btnInDanhSach
            // 
            this.btnInDanhSach.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnInDanhSach.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.btnInDanhSach.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnInDanhSach.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnInDanhSach.Location = new System.Drawing.Point(756, 124);
            this.btnInDanhSach.Name = "btnInDanhSach";
            this.btnInDanhSach.Shape = new DevComponents.DotNetBar.RoundRectangleShapeDescriptor(2);
            this.btnInDanhSach.Size = new System.Drawing.Size(204, 35);
            this.btnInDanhSach.Style = DevComponents.DotNetBar.eDotNetBarStyle.Office2010;
            this.btnInDanhSach.Symbol = "";
            this.btnInDanhSach.SymbolColor = System.Drawing.Color.Black;
            this.btnInDanhSach.SymbolSize = 20F;
            this.btnInDanhSach.TabIndex = 1;
            this.btnInDanhSach.Text = "In Danh Sách";
            this.btnInDanhSach.ThemeAware = true;
            this.btnInDanhSach.Click += new System.EventHandler(this.btnInDanhSach_Click);
            // 
            // UCSinhVienXuatSac
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.btnInDanhSach);
            this.Controls.Add(this.cboNamHoc);
            this.Controls.Add(this.lblMaKhoas);
            this.Controls.Add(this.lblXDanhSachKhoaVien);
            this.Controls.Add(this.grpNoiDung);
            this.Name = "UCSinhVienXuatSac";
            this.Size = new System.Drawing.Size(1276, 698);
            this.grpNoiDung.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private DevComponents.DotNetBar.LabelX lblXDanhSachKhoaVien;
        private System.Windows.Forms.GroupBox grpNoiDung;
        private System.Windows.Forms.DataGridView dataGridView;
        private System.Windows.Forms.ComboBox cboNamHoc;
        private System.Windows.Forms.Label lblMaKhoas;
        private DevComponents.DotNetBar.ButtonX btnInDanhSach;
    }
}
