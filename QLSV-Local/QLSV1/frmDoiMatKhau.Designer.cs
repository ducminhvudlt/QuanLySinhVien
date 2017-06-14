namespace QLSV1
{
    partial class frmDoiMatKhau
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmDoiMatKhau));
            this.ucDoiMatKhau1 = new QLSV1.UCDoiMatKhau();
            this.SuspendLayout();
            // 
            // ucDoiMatKhau1
            // 
            this.ucDoiMatKhau1.BackColor = System.Drawing.SystemColors.Control;
            this.ucDoiMatKhau1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ucDoiMatKhau1.Location = new System.Drawing.Point(0, 0);
            this.ucDoiMatKhau1.Name = "ucDoiMatKhau1";
            this.ucDoiMatKhau1.Size = new System.Drawing.Size(819, 539);
            this.ucDoiMatKhau1.TabIndex = 0;
            // 
            // frmDoiMatKhau
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(819, 539);
            this.Controls.Add(this.ucDoiMatKhau1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmDoiMatKhau";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Đổi Mật Khẩu";
            this.ResumeLayout(false);

        }

        #endregion

        private UCDoiMatKhau ucDoiMatKhau1;
    }
}