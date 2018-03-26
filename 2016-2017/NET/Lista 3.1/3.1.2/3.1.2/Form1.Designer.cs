namespace _3._1._2
{
    partial class Form1
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
            this.components = new System.ComponentModel.Container();
            this.pb1 = new System.Windows.Forms.ProgressBar();
            this.numericUpDown1 = new System.Windows.Forms.NumericUpDown();
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.progressBarrToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.stanToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.więcejToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.mnieToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.contextMenuStrip2 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.progresBarrToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.stanToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.więcejToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.mniejToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.toolTip1 = new System.Windows.Forms.ToolTip(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown1)).BeginInit();
            this.contextMenuStrip2.SuspendLayout();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // pb1
            // 
            this.pb1.Location = new System.Drawing.Point(12, 123);
            this.pb1.Name = "pb1";
            this.pb1.Size = new System.Drawing.Size(237, 38);
            this.pb1.Style = System.Windows.Forms.ProgressBarStyle.Continuous;
            this.pb1.TabIndex = 0;
            // 
            // numericUpDown1
            // 
            this.numericUpDown1.Font = new System.Drawing.Font("Neogrey", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.numericUpDown1.Increment = new decimal(new int[] {
            5,
            0,
            0,
            0});
            this.numericUpDown1.Location = new System.Drawing.Point(255, 123);
            this.numericUpDown1.Name = "numericUpDown1";
            this.numericUpDown1.Size = new System.Drawing.Size(63, 22);
            this.numericUpDown1.TabIndex = 4;
            this.numericUpDown1.ThousandsSeparator = true;
            this.toolTip1.SetToolTip(this.numericUpDown1, "\"Modyfikuje stan progres bara\"");
            this.numericUpDown1.Click += new System.EventHandler(this.numericUpDown1_Click);
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(61, 4);
            // 
            // progressBarrToolStripMenuItem
            // 
            this.progressBarrToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.stanToolStripMenuItem});
            this.progressBarrToolStripMenuItem.Name = "progressBarrToolStripMenuItem";
            this.progressBarrToolStripMenuItem.Size = new System.Drawing.Size(140, 22);
            this.progressBarrToolStripMenuItem.Text = "ProgressBarr";
            // 
            // stanToolStripMenuItem
            // 
            this.stanToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.więcejToolStripMenuItem,
            this.mnieToolStripMenuItem});
            this.stanToolStripMenuItem.Name = "stanToolStripMenuItem";
            this.stanToolStripMenuItem.Size = new System.Drawing.Size(97, 22);
            this.stanToolStripMenuItem.Text = "Stan";
            // 
            // więcejToolStripMenuItem
            // 
            this.więcejToolStripMenuItem.Name = "więcejToolStripMenuItem";
            this.więcejToolStripMenuItem.Size = new System.Drawing.Size(109, 22);
            this.więcejToolStripMenuItem.Text = "Więcej";
            // 
            // mnieToolStripMenuItem
            // 
            this.mnieToolStripMenuItem.Name = "mnieToolStripMenuItem";
            this.mnieToolStripMenuItem.Size = new System.Drawing.Size(109, 22);
            this.mnieToolStripMenuItem.Text = "Mnie";
            // 
            // contextMenuStrip2
            // 
            this.contextMenuStrip2.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.progressBarrToolStripMenuItem});
            this.contextMenuStrip2.Name = "contextMenuStrip2";
            this.contextMenuStrip2.Size = new System.Drawing.Size(141, 26);
            // 
            // progresBarrToolStripMenuItem
            // 
            this.progresBarrToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.stanToolStripMenuItem1});
            this.progresBarrToolStripMenuItem.Name = "progresBarrToolStripMenuItem";
            this.progresBarrToolStripMenuItem.Size = new System.Drawing.Size(76, 20);
            this.progresBarrToolStripMenuItem.Text = "ProgresBar";
            // 
            // stanToolStripMenuItem1
            // 
            this.stanToolStripMenuItem1.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.więcejToolStripMenuItem1,
            this.mniejToolStripMenuItem});
            this.stanToolStripMenuItem1.Name = "stanToolStripMenuItem1";
            this.stanToolStripMenuItem1.Size = new System.Drawing.Size(152, 22);
            this.stanToolStripMenuItem1.Text = "Stan";
            // 
            // więcejToolStripMenuItem1
            // 
            this.więcejToolStripMenuItem1.Name = "więcejToolStripMenuItem1";
            this.więcejToolStripMenuItem1.Size = new System.Drawing.Size(152, 22);
            this.więcejToolStripMenuItem1.Text = "Więcej";
            this.więcejToolStripMenuItem1.Click += new System.EventHandler(this.więcejToolStripMenuItem1_Click);
            // 
            // mniejToolStripMenuItem
            // 
            this.mniejToolStripMenuItem.Name = "mniejToolStripMenuItem";
            this.mniejToolStripMenuItem.Size = new System.Drawing.Size(109, 22);
            this.mniejToolStripMenuItem.Text = "Mniej";
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.progresBarrToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(410, 24);
            this.menuStrip1.TabIndex = 3;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(410, 363);
            this.Controls.Add(this.numericUpDown1);
            this.Controls.Add(this.menuStrip1);
            this.Controls.Add(this.pb1);
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "Form1";
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown1)).EndInit();
            this.contextMenuStrip2.ResumeLayout(false);
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ProgressBar pb1;
        private System.Windows.Forms.NumericUpDown numericUpDown1;
        private System.Windows.Forms.ToolTip toolTip1;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.ToolStripMenuItem progressBarrToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem stanToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem więcejToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem mnieToolStripMenuItem;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip2;
        private System.Windows.Forms.ToolStripMenuItem progresBarrToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem stanToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem więcejToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem mniejToolStripMenuItem;
        private System.Windows.Forms.MenuStrip menuStrip1;
    }
}

