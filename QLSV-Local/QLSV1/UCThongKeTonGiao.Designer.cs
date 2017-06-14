namespace QLSV1
{
    partial class UCThongKeTonGiao
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
            this.highlighter1 = new DevComponents.DotNetBar.Validator.Highlighter();
            this.dataGridView = new System.Windows.Forms.DataGridView();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.cboTenTonGiao = new System.Windows.Forms.ComboBox();
            this.btnInDanhSach = new DevComponents.DotNetBar.ButtonX();
            this.label3 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).BeginInit();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // label4
            // 
            this.label4.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Times New Roman", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.Blue;
            this.label4.Location = new System.Drawing.Point(233, 45);
            this.label4.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(595, 35);
            this.label4.TabIndex = 13;
            this.label4.Text = "THỐNG KÊ SINH VIÊN THEO TÔN GIÁO";
            this.label4.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // dataGridView
            // 
            this.dataGridView.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView.Location = new System.Drawing.Point(110, 212);
            this.dataGridView.Name = "dataGridView";
            this.dataGridView.RowTemplate.Height = 24;
            this.dataGridView.Size = new System.Drawing.Size(819, 347);
            this.dataGridView.TabIndex = 33;
            // 
            // groupBox2
            // 
            this.groupBox2.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox2.Controls.Add(this.label4);
            this.groupBox2.Location = new System.Drawing.Point(0, 0);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(1060, 100);
            this.groupBox2.TabIndex = 35;
            this.groupBox2.TabStop = false;
            // 
            // cboTenTonGiao
            // 
            this.cboTenTonGiao.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboTenTonGiao.FormattingEnabled = true;
            this.cboTenTonGiao.Location = new System.Drawing.Point(349, 133);
            this.cboTenTonGiao.Name = "cboTenTonGiao";
            this.cboTenTonGiao.Size = new System.Drawing.Size(208, 24);
            this.cboTenTonGiao.TabIndex = 0;
            this.cboTenTonGiao.SelectedIndexChanged += new System.EventHandler(this.cboTenTonGiao_SelectedIndexChanged);
            // 
            // btnInDanhSach
            // 
            this.btnInDanhSach.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnInDanhSach.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnInDanhSach.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnInDanhSach.Location = new System.Drawing.Point(699, 125);
            this.btnInDanhSach.Name = "btnInDanhSach";
            this.btnInDanhSach.Shape = new DevComponents.DotNetBar.RoundRectangleShapeDescriptor(2);
            this.btnInDanhSach.Size = new System.Drawing.Size(111, 43);
            this.btnInDanhSach.Style = DevComponents.DotNetBar.eDotNetBarStyle.Office2010;
            this.btnInDanhSach.Symbol = "";
            this.btnInDanhSach.SymbolColor = System.Drawing.Color.Black;
            this.btnInDanhSach.SymbolSize = 20F;
            this.btnInDanhSach.TabIndex = 1;
            this.btnInDanhSach.Text = "In Danh Sách";
            this.btnInDanhSach.ThemeAware = true;
            this.btnInDanhSach.Click += new System.EventHandler(this.btnInDanhSach_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Times New Roman", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.Blue;
            this.label3.Location = new System.Drawing.Point(235, 135);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(93, 22);
            this.label3.TabIndex = 33;
            this.label3.Text = "Tôn Giáo:";
            // 
            // UCThongKeTonGiao
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.cboTenTonGiao);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.btnInDanhSach);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.dataGridView);
            this.Name = "UCThongKeTonGiao";
            this.Size = new System.Drawing.Size(1060, 562);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).EndInit();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private DevComponents.DotNetBar.Validator.Highlighter highlighter1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.DataGridView dataGridView;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.ComboBox cboTenTonGiao;
        private DevComponents.DotNetBar.ButtonX btnInDanhSach;
        private System.Windows.Forms.Label label3;
    }
}
