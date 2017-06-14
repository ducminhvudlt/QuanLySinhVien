namespace QLSV1
{
    partial class UCQuanLyDiem
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(UCQuanLyDiem));
            this.lblXHoSoSinhVien = new DevComponents.DotNetBar.LabelX();
            this.grpTimKiem = new System.Windows.Forms.GroupBox();
            this.cboHocKi = new System.Windows.Forms.ComboBox();
            this.lblTenLops = new System.Windows.Forms.Label();
            this.cboMaLopTinChi = new System.Windows.Forms.ComboBox();
            this.cboNamHoc = new System.Windows.Forms.ComboBox();
            this.lblMaMons = new System.Windows.Forms.Label();
            this.lblMaSinhViens = new System.Windows.Forms.Label();
            this.grpThongTinChiTiet = new System.Windows.Forms.GroupBox();
            this.btnRefresh = new DevComponents.DotNetBar.ButtonX();
            this.txtDiemCuoiKi = new System.Windows.Forms.TextBox();
            this.lblSiSo = new System.Windows.Forms.Label();
            this.txtDiemGiuaKi = new System.Windows.Forms.TextBox();
            this.lblNamHoc = new System.Windows.Forms.Label();
            this.txtTenLopPhanCong = new System.Windows.Forms.TextBox();
            this.lblTenKhoa = new System.Windows.Forms.Label();
            this.txtMaSinhVien = new System.Windows.Forms.TextBox();
            this.lblTenLop = new System.Windows.Forms.Label();
            this.txtTenSinhVien = new System.Windows.Forms.TextBox();
            this.lblMaLop = new System.Windows.Forms.Label();
            this.dataGridView = new System.Windows.Forms.DataGridView();
            this.btnLuu = new System.Windows.Forms.Button();
            this.btnNhapDiem = new System.Windows.Forms.Button();
            this.grpTimKiem.SuspendLayout();
            this.grpThongTinChiTiet.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).BeginInit();
            this.SuspendLayout();
            // 
            // lblXHoSoSinhVien
            // 
            // 
            // 
            // 
            this.lblXHoSoSinhVien.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.lblXHoSoSinhVien.Dock = System.Windows.Forms.DockStyle.Top;
            this.lblXHoSoSinhVien.Font = new System.Drawing.Font("Times New Roman", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblXHoSoSinhVien.ForeColor = System.Drawing.Color.Blue;
            this.lblXHoSoSinhVien.Location = new System.Drawing.Point(0, 0);
            this.lblXHoSoSinhVien.Name = "lblXHoSoSinhVien";
            this.lblXHoSoSinhVien.Size = new System.Drawing.Size(1276, 50);
            this.lblXHoSoSinhVien.TabIndex = 7;
            this.lblXHoSoSinhVien.Text = "QUẢN LÝ ĐIỂM";
            this.lblXHoSoSinhVien.TextAlignment = System.Drawing.StringAlignment.Center;
            // 
            // grpTimKiem
            // 
            this.grpTimKiem.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.grpTimKiem.Controls.Add(this.cboHocKi);
            this.grpTimKiem.Controls.Add(this.lblTenLops);
            this.grpTimKiem.Controls.Add(this.cboMaLopTinChi);
            this.grpTimKiem.Controls.Add(this.cboNamHoc);
            this.grpTimKiem.Controls.Add(this.lblMaMons);
            this.grpTimKiem.Controls.Add(this.lblMaSinhViens);
            this.grpTimKiem.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grpTimKiem.Location = new System.Drawing.Point(0, 58);
            this.grpTimKiem.Margin = new System.Windows.Forms.Padding(5);
            this.grpTimKiem.Name = "grpTimKiem";
            this.grpTimKiem.Padding = new System.Windows.Forms.Padding(5);
            this.grpTimKiem.Size = new System.Drawing.Size(1276, 149);
            this.grpTimKiem.TabIndex = 19;
            this.grpTimKiem.TabStop = false;
            this.grpTimKiem.Text = "Thông Tin Lớp Nhập Điểm";
            this.grpTimKiem.Enter += new System.EventHandler(this.grpTimKiem_Enter);
            // 
            // cboHocKi
            // 
            this.cboHocKi.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.cboHocKi.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboHocKi.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cboHocKi.FormattingEnabled = true;
            this.cboHocKi.Location = new System.Drawing.Point(841, 45);
            this.cboHocKi.Margin = new System.Windows.Forms.Padding(5);
            this.cboHocKi.Name = "cboHocKi";
            this.cboHocKi.Size = new System.Drawing.Size(247, 28);
            this.cboHocKi.TabIndex = 2;
            this.cboHocKi.SelectedIndexChanged += new System.EventHandler(this.cboHocKi_SelectedIndexChanged);
            // 
            // lblTenLops
            // 
            this.lblTenLops.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.lblTenLops.AutoSize = true;
            this.lblTenLops.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTenLops.ForeColor = System.Drawing.Color.Blue;
            this.lblTenLops.Location = new System.Drawing.Point(673, 49);
            this.lblTenLops.Margin = new System.Windows.Forms.Padding(5, 0, 5, 0);
            this.lblTenLops.Name = "lblTenLops";
            this.lblTenLops.Size = new System.Drawing.Size(77, 22);
            this.lblTenLops.TabIndex = 6;
            this.lblTenLops.Text = "Học Kì :";
            // 
            // cboMaLopTinChi
            // 
            this.cboMaLopTinChi.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.cboMaLopTinChi.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboMaLopTinChi.Font = new System.Drawing.Font("Times New Roman", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cboMaLopTinChi.FormattingEnabled = true;
            this.cboMaLopTinChi.Location = new System.Drawing.Point(349, 48);
            this.cboMaLopTinChi.Margin = new System.Windows.Forms.Padding(4);
            this.cboMaLopTinChi.Name = "cboMaLopTinChi";
            this.cboMaLopTinChi.Size = new System.Drawing.Size(247, 25);
            this.cboMaLopTinChi.TabIndex = 0;
            this.cboMaLopTinChi.SelectedIndexChanged += new System.EventHandler(this.cboMaLopTinChi_SelectedIndexChanged);
            this.cboMaLopTinChi.TextChanged += new System.EventHandler(this.cboMaLopTinChi_TextChanged);
            // 
            // cboNamHoc
            // 
            this.cboNamHoc.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.cboNamHoc.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboNamHoc.Font = new System.Drawing.Font("Times New Roman", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cboNamHoc.FormattingEnabled = true;
            this.cboNamHoc.Location = new System.Drawing.Point(349, 91);
            this.cboNamHoc.Margin = new System.Windows.Forms.Padding(4);
            this.cboNamHoc.Name = "cboNamHoc";
            this.cboNamHoc.Size = new System.Drawing.Size(247, 25);
            this.cboNamHoc.TabIndex = 1;
            this.cboNamHoc.SelectedIndexChanged += new System.EventHandler(this.cboNamHoc_SelectedIndexChanged);
            // 
            // lblMaMons
            // 
            this.lblMaMons.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.lblMaMons.AutoSize = true;
            this.lblMaMons.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMaMons.ForeColor = System.Drawing.Color.Blue;
            this.lblMaMons.Location = new System.Drawing.Point(181, 93);
            this.lblMaMons.Margin = new System.Windows.Forms.Padding(5, 0, 5, 0);
            this.lblMaMons.Name = "lblMaMons";
            this.lblMaMons.Size = new System.Drawing.Size(97, 22);
            this.lblMaMons.TabIndex = 0;
            this.lblMaMons.Text = "Năm Học :";
            // 
            // lblMaSinhViens
            // 
            this.lblMaSinhViens.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.lblMaSinhViens.AutoSize = true;
            this.lblMaSinhViens.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMaSinhViens.ForeColor = System.Drawing.Color.Blue;
            this.lblMaSinhViens.Location = new System.Drawing.Point(181, 51);
            this.lblMaSinhViens.Margin = new System.Windows.Forms.Padding(5, 0, 5, 0);
            this.lblMaSinhViens.Name = "lblMaSinhViens";
            this.lblMaSinhViens.Size = new System.Drawing.Size(148, 22);
            this.lblMaSinhViens.TabIndex = 0;
            this.lblMaSinhViens.Text = "Mã Lớp Tín Chỉ:";
            // 
            // grpThongTinChiTiet
            // 
            this.grpThongTinChiTiet.Controls.Add(this.btnRefresh);
            this.grpThongTinChiTiet.Controls.Add(this.txtDiemCuoiKi);
            this.grpThongTinChiTiet.Controls.Add(this.lblSiSo);
            this.grpThongTinChiTiet.Controls.Add(this.txtDiemGiuaKi);
            this.grpThongTinChiTiet.Controls.Add(this.lblNamHoc);
            this.grpThongTinChiTiet.Controls.Add(this.txtTenLopPhanCong);
            this.grpThongTinChiTiet.Controls.Add(this.lblTenKhoa);
            this.grpThongTinChiTiet.Controls.Add(this.txtMaSinhVien);
            this.grpThongTinChiTiet.Controls.Add(this.lblTenLop);
            this.grpThongTinChiTiet.Controls.Add(this.txtTenSinhVien);
            this.grpThongTinChiTiet.Controls.Add(this.lblMaLop);
            this.grpThongTinChiTiet.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grpThongTinChiTiet.Location = new System.Drawing.Point(4, 208);
            this.grpThongTinChiTiet.Margin = new System.Windows.Forms.Padding(4);
            this.grpThongTinChiTiet.Name = "grpThongTinChiTiet";
            this.grpThongTinChiTiet.Padding = new System.Windows.Forms.Padding(4);
            this.grpThongTinChiTiet.Size = new System.Drawing.Size(358, 399);
            this.grpThongTinChiTiet.TabIndex = 24;
            this.grpThongTinChiTiet.TabStop = false;
            this.grpThongTinChiTiet.Text = "Thông Tin Chi Tiết";
            // 
            // btnRefresh
            // 
            this.btnRefresh.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnRefresh.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnRefresh.Image = ((System.Drawing.Image)(resources.GetObject("btnRefresh.Image")));
            this.btnRefresh.ImageFixedSize = new System.Drawing.Size(50, 50);
            this.btnRefresh.Location = new System.Drawing.Point(311, 12);
            this.btnRefresh.Name = "btnRefresh";
            this.btnRefresh.Shape = new DevComponents.DotNetBar.EllipticalShapeDescriptor();
            this.btnRefresh.Size = new System.Drawing.Size(40, 40);
            this.btnRefresh.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btnRefresh.Symbol = "";
            this.btnRefresh.TabIndex = 30;
            this.btnRefresh.Click += new System.EventHandler(this.btnRefresh_Click);
            // 
            // txtDiemCuoiKi
            // 
            this.txtDiemCuoiKi.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtDiemCuoiKi.Font = new System.Drawing.Font("Times New Roman", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDiemCuoiKi.Location = new System.Drawing.Point(181, 296);
            this.txtDiemCuoiKi.Margin = new System.Windows.Forms.Padding(4);
            this.txtDiemCuoiKi.Multiline = true;
            this.txtDiemCuoiKi.Name = "txtDiemCuoiKi";
            this.txtDiemCuoiKi.Size = new System.Drawing.Size(166, 24);
            this.txtDiemCuoiKi.TabIndex = 7;
            // 
            // lblSiSo
            // 
            this.lblSiSo.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lblSiSo.AutoSize = true;
            this.lblSiSo.Font = new System.Drawing.Font("Times New Roman", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSiSo.ForeColor = System.Drawing.Color.Blue;
            this.lblSiSo.Location = new System.Drawing.Point(9, 299);
            this.lblSiSo.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblSiSo.Name = "lblSiSo";
            this.lblSiSo.Size = new System.Drawing.Size(107, 17);
            this.lblSiSo.TabIndex = 7;
            this.lblSiSo.Text = "Điểm Cuối Kì :";
            // 
            // txtDiemGiuaKi
            // 
            this.txtDiemGiuaKi.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtDiemGiuaKi.Font = new System.Drawing.Font("Times New Roman", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDiemGiuaKi.Location = new System.Drawing.Point(181, 241);
            this.txtDiemGiuaKi.Margin = new System.Windows.Forms.Padding(4);
            this.txtDiemGiuaKi.Multiline = true;
            this.txtDiemGiuaKi.Name = "txtDiemGiuaKi";
            this.txtDiemGiuaKi.Size = new System.Drawing.Size(166, 24);
            this.txtDiemGiuaKi.TabIndex = 6;
            // 
            // lblNamHoc
            // 
            this.lblNamHoc.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lblNamHoc.AutoSize = true;
            this.lblNamHoc.Font = new System.Drawing.Font("Times New Roman", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNamHoc.ForeColor = System.Drawing.Color.Blue;
            this.lblNamHoc.Location = new System.Drawing.Point(9, 244);
            this.lblNamHoc.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblNamHoc.Name = "lblNamHoc";
            this.lblNamHoc.Size = new System.Drawing.Size(107, 17);
            this.lblNamHoc.TabIndex = 7;
            this.lblNamHoc.Text = "Điểm Giữa Kì :";
            // 
            // txtTenLopPhanCong
            // 
            this.txtTenLopPhanCong.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtTenLopPhanCong.Font = new System.Drawing.Font("Times New Roman", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTenLopPhanCong.Location = new System.Drawing.Point(181, 186);
            this.txtTenLopPhanCong.Margin = new System.Windows.Forms.Padding(4);
            this.txtTenLopPhanCong.Multiline = true;
            this.txtTenLopPhanCong.Name = "txtTenLopPhanCong";
            this.txtTenLopPhanCong.Size = new System.Drawing.Size(166, 24);
            this.txtTenLopPhanCong.TabIndex = 5;
            // 
            // lblTenKhoa
            // 
            this.lblTenKhoa.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lblTenKhoa.AutoSize = true;
            this.lblTenKhoa.Font = new System.Drawing.Font("Times New Roman", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTenKhoa.ForeColor = System.Drawing.Color.Blue;
            this.lblTenKhoa.Location = new System.Drawing.Point(9, 189);
            this.lblTenKhoa.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblTenKhoa.Name = "lblTenKhoa";
            this.lblTenKhoa.Size = new System.Drawing.Size(148, 17);
            this.lblTenKhoa.TabIndex = 6;
            this.lblTenKhoa.Text = "Tên Lớp Phân Công :";
            // 
            // txtMaSinhVien
            // 
            this.txtMaSinhVien.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtMaSinhVien.Font = new System.Drawing.Font("Times New Roman", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMaSinhVien.Location = new System.Drawing.Point(181, 131);
            this.txtMaSinhVien.Margin = new System.Windows.Forms.Padding(4);
            this.txtMaSinhVien.Multiline = true;
            this.txtMaSinhVien.Name = "txtMaSinhVien";
            this.txtMaSinhVien.Size = new System.Drawing.Size(166, 24);
            this.txtMaSinhVien.TabIndex = 4;
            // 
            // lblTenLop
            // 
            this.lblTenLop.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lblTenLop.AutoSize = true;
            this.lblTenLop.Font = new System.Drawing.Font("Times New Roman", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTenLop.ForeColor = System.Drawing.Color.Blue;
            this.lblTenLop.Location = new System.Drawing.Point(9, 134);
            this.lblTenLop.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblTenLop.Name = "lblTenLop";
            this.lblTenLop.Size = new System.Drawing.Size(100, 17);
            this.lblTenLop.TabIndex = 5;
            this.lblTenLop.Text = "Mã Sinh Viên:";
            // 
            // txtTenSinhVien
            // 
            this.txtTenSinhVien.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtTenSinhVien.Font = new System.Drawing.Font("Times New Roman", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTenSinhVien.Location = new System.Drawing.Point(181, 76);
            this.txtTenSinhVien.Margin = new System.Windows.Forms.Padding(4);
            this.txtTenSinhVien.Multiline = true;
            this.txtTenSinhVien.Name = "txtTenSinhVien";
            this.txtTenSinhVien.Size = new System.Drawing.Size(166, 24);
            this.txtTenSinhVien.TabIndex = 3;
            // 
            // lblMaLop
            // 
            this.lblMaLop.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lblMaLop.AutoSize = true;
            this.lblMaLop.Font = new System.Drawing.Font("Times New Roman", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMaLop.ForeColor = System.Drawing.Color.Blue;
            this.lblMaLop.Location = new System.Drawing.Point(9, 79);
            this.lblMaLop.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblMaLop.Name = "lblMaLop";
            this.lblMaLop.Size = new System.Drawing.Size(108, 17);
            this.lblMaLop.TabIndex = 4;
            this.lblMaLop.Text = "Tên Sinh Viên :";
            // 
            // dataGridView
            // 
            this.dataGridView.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView.Location = new System.Drawing.Point(369, 220);
            this.dataGridView.Name = "dataGridView";
            this.dataGridView.RowTemplate.Height = 24;
            this.dataGridView.Size = new System.Drawing.Size(672, 387);
            this.dataGridView.TabIndex = 25;
            this.dataGridView.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView_CellClick);
            this.dataGridView.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView_CellContentClick);
            this.dataGridView.CellEndEdit += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView_CellEndEdit);
            this.dataGridView.CellEnter += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView_CellEnter);
            this.dataGridView.CellLeave += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView_CellLeave);
            this.dataGridView.CellValueChanged += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView_CellValueChanged);
            this.dataGridView.DataError += new System.Windows.Forms.DataGridViewDataErrorEventHandler(this.dataGridView_DataError);
            this.dataGridView.EditingControlShowing += new System.Windows.Forms.DataGridViewEditingControlShowingEventHandler(this.dataGridView_EditingControlShowing);
            // 
            // btnLuu
            // 
            this.btnLuu.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnLuu.Enabled = false;
            this.btnLuu.Location = new System.Drawing.Point(1087, 407);
            this.btnLuu.Name = "btnLuu";
            this.btnLuu.Size = new System.Drawing.Size(113, 44);
            this.btnLuu.TabIndex = 9;
            this.btnLuu.Text = "Lưu";
            this.btnLuu.UseVisualStyleBackColor = true;
            this.btnLuu.Click += new System.EventHandler(this.btnLuu_Click);
            // 
            // btnNhapDiem
            // 
            this.btnNhapDiem.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnNhapDiem.Location = new System.Drawing.Point(1087, 284);
            this.btnNhapDiem.Name = "btnNhapDiem";
            this.btnNhapDiem.Size = new System.Drawing.Size(113, 44);
            this.btnNhapDiem.TabIndex = 8;
            this.btnNhapDiem.Text = "Nhập Điểm";
            this.btnNhapDiem.UseVisualStyleBackColor = true;
            this.btnNhapDiem.Click += new System.EventHandler(this.btnNhapDiem_Click);
            // 
            // UCQuanLyDiem
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.btnNhapDiem);
            this.Controls.Add(this.btnLuu);
            this.Controls.Add(this.dataGridView);
            this.Controls.Add(this.grpThongTinChiTiet);
            this.Controls.Add(this.grpTimKiem);
            this.Controls.Add(this.lblXHoSoSinhVien);
            this.Name = "UCQuanLyDiem";
            this.Size = new System.Drawing.Size(1276, 698);
            this.Load += new System.EventHandler(this.UCQuanLyDiem_Load);
            this.grpTimKiem.ResumeLayout(false);
            this.grpTimKiem.PerformLayout();
            this.grpThongTinChiTiet.ResumeLayout(false);
            this.grpThongTinChiTiet.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DevComponents.DotNetBar.LabelX lblXHoSoSinhVien;
        private System.Windows.Forms.GroupBox grpTimKiem;
        private System.Windows.Forms.ComboBox cboMaLopTinChi;
        private System.Windows.Forms.ComboBox cboNamHoc;
        private System.Windows.Forms.Label lblMaMons;
        private System.Windows.Forms.Label lblMaSinhViens;
        private System.Windows.Forms.ComboBox cboHocKi;
        private System.Windows.Forms.Label lblTenLops;
        private System.Windows.Forms.GroupBox grpThongTinChiTiet;
        private System.Windows.Forms.TextBox txtDiemCuoiKi;
        private System.Windows.Forms.Label lblSiSo;
        private System.Windows.Forms.TextBox txtDiemGiuaKi;
        private System.Windows.Forms.Label lblNamHoc;
        private System.Windows.Forms.TextBox txtTenLopPhanCong;
        private System.Windows.Forms.Label lblTenKhoa;
        private System.Windows.Forms.TextBox txtMaSinhVien;
        private System.Windows.Forms.Label lblTenLop;
        private System.Windows.Forms.TextBox txtTenSinhVien;
        private System.Windows.Forms.Label lblMaLop;
        private System.Windows.Forms.DataGridView dataGridView;
        private System.Windows.Forms.Button btnLuu;
        private System.Windows.Forms.Button btnNhapDiem;
        private DevComponents.DotNetBar.ButtonX btnRefresh;
    }
}
