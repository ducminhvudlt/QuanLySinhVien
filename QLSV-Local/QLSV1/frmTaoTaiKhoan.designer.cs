namespace QLSV1
{
    partial class frmTaoTaiKhoan
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmTaoTaiKhoan));
            this.ucTaoTaiKhoan = new QLSV1.UCTaoTaiKhoan();
            this.SuspendLayout();
            // 
            // ucTaoTaiKhoan
            // 
            this.ucTaoTaiKhoan.BackColor = System.Drawing.SystemColors.Control;
            this.ucTaoTaiKhoan.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ucTaoTaiKhoan.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.ucTaoTaiKhoan.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ucTaoTaiKhoan.Location = new System.Drawing.Point(0, 0);
            this.ucTaoTaiKhoan.Name = "ucTaoTaiKhoan";
            this.ucTaoTaiKhoan.Size = new System.Drawing.Size(831, 551);
            this.ucTaoTaiKhoan.TabIndex = 0;
            // 
            // frmTaoTaiKhoan
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(831, 551);
            this.Controls.Add(this.ucTaoTaiKhoan);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmTaoTaiKhoan";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Tạo Tài Khoản";
            this.ResumeLayout(false);

        }

        #endregion

        private UCTaoTaiKhoan ucTaoTaiKhoan;
    }
}