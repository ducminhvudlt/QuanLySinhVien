using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

/////Add the references (new)
using Microsoft.Office.Interop.Word;
using Microsoft.Office.Core;
using System.Reflection;
using Word = Microsoft.Office.Interop.Word;
using System.IO;
using System.Diagnostics;
using System.Drawing.Drawing2D;
////

namespace QLSV1
{
    public partial class UCGiayChungNhanSV : UserControl
    {
        public UCGiayChungNhanSV()
        {
            InitializeComponent();
            txtMaSoSinhVien.KeyDown += new KeyEventHandler(txtMaSoSinhVien_KeyDown);
            btnXuatRaWord.Visible = false;
        }
        string _gioiTinh;
        void txtMaSoSinhVien_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                LayThongTinTuDatabase();
            }
    
        }    

        private void LayThongTinTuDatabase()
        {
            try
            {
                Connection conn = new Connection();
                SqlConnection _sqlConnection;
                _sqlConnection = new SqlConnection(conn._sqlConnectionString);
                _sqlConnection.Open();
                SqlCommand _sqlCommand = new SqlCommand();
                _sqlCommand.Connection = _sqlConnection;
                _sqlCommand.CommandText = @"select HoTen,
                                        DATEPART(dd,NgaySinh) as Ngay,DATEPART(mm,NgaySinh) as Thang,
                                        DATEPART(yyyy,NgaySinh) as Nam,NoiSinh,GioiTinh,MaLop 
                                        from SINHVIEN 
                                        where MaSINHVIEN like '" + txtMaSoSinhVien.Text + "'";
                SqlDataReader _sqlDataReader = _sqlCommand.ExecuteReader();
                System.Data.DataTable _dataTable = new System.Data.DataTable();
                _dataTable.Load(_sqlDataReader);
                if (_dataTable != null)
                {
                    lbHoTen.Text = _dataTable.Rows[0][0].ToString().ToUpper();
                    lbNgaySinh.Text = _dataTable.Rows[0][1].ToString();
                    lbThangSinh.Text = _dataTable.Rows[0][2].ToString();
                    lbNamSinh.Text = _dataTable.Rows[0][3].ToString();
                    lbNoiSinh.Text = _dataTable.Rows[0][4].ToString();
                    _gioiTinh=(_dataTable.Rows[0][5].ToString().ToUpper()=="FALSE")?"anh":"chị";
                    //MessageBox.Show(_dataTable.Rows[0][5].ToString());
                    lbLop.Text = _dataTable.Rows[0][6].ToString();
                    lbMaSV.Text = txtMaSoSinhVien.Text.ToUpper();
                    lbNgayThang.Text = "Hà Nội, ngày " + DateTime.Today.ToString("dd") + " tháng " + DateTime.Today.ToString("MM") + " năm " + DateTime.Today.ToString("yyyy");
                    btnXuatRaWord.Visible = true;
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Mã Sinh Viên Này Không Tồn Tại");
                btnXuatRaWord.Visible = false;
            }
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            LayThongTinTuDatabase();
        }

        private void btnXuatRaWord_Click(object sender, EventArgs e)
        {
            object filename = System.IO.Path.GetDirectoryName(System.Windows.Forms.Application.ExecutablePath).ToString() + @"\\GiayChungNhanSinhVien.doc";
            //CreateWordDocument(filename);  
            XuatFileWord(filename.ToString());
        }

        #region Xuat Ra Word

        /*
        //Methode Find and Replace:
        private void FindAndReplace(Microsoft.Office.Interop.Word.Application wordApp, object findText, object replaceWithText)
        {
            object matchCase = true;
            object matchWholeWord = true;
            object matchWildCards = false;
            object matchSoundLike = false;
            object nmatchAllForms = false;
            object forward = true;
            object format = false;
            object matchKashida = false;
            object matchDiactitics = false;
            object matchAlefHamza = false;
            object matchControl = false;
            object read_only = false;
            object visible = true;
            object replace = 2;
            object wrap = 1;

            wordApp.Selection.Find.Execute(ref findText,
                        ref matchCase, ref matchWholeWord,
                        ref matchWildCards, ref matchSoundLike,
                        ref nmatchAllForms, ref forward,
                        ref wrap, ref format, ref replaceWithText,
                        ref replace, ref matchKashida,
                        ref matchDiactitics, ref matchAlefHamza,
                        ref matchControl);
        }

        private void CreateWordDocument(object filename)
        {
            try
            {

                List<int> processesbeforegen = getRunningProcesses();
                List<int> processesaftergen = getRunningProcesses();
                killProcesses(processesbeforegen, processesaftergen);

                object missing = Missing.Value;

                Word.Application wordApp = new Word.Application();

                Word.Document aDoc = null;

                if (File.Exists((string)filename))
                {
                    object readOnly = false; //default
                    //object isVisible = true;

                    wordApp.Visible = true;

                  
                    aDoc = wordApp.Documents.Open(ref filename, ref missing, ref readOnly,
                                                     false, ref missing, ref missing,
                                                     ref missing, ref missing, ref missing,
                                                     ref missing, ref missing, ref missing,
                                                     ref missing, ref missing, ref missing, ref missing);
                       
                    /*aDoc = wordApp.Documents.OpenNoRepairDialog(ref filename, ref missing, ref readOnly,
                                                     false, ref missing, ref missing,
                                                     ref missing, ref missing, ref missing,
                                                     ref missing, ref missing, ref missing,
                                                     ref missing, ref missing, ref missing, ref missing);*/

                    //aDoc = wordApp.Documents.Add(ref filename, ref missing, ref missing, ref missing);

                    
                    //aDoc = wordApp.Documents.Open(ref filename);
        /*
                    aDoc.Activate();

                    //Find and replace:
                    this.FindAndReplace(wordApp, "<gioiTinh>", _gioiTinh);
                    this.FindAndReplace(wordApp, "<hoTen>", lbHoTen.Text);
                    this.FindAndReplace(wordApp, "<ngaySinh>", lbNgaySinh.Text);
                    this.FindAndReplace(wordApp, "<thangSinh>", lbThangSinh.Text);
                    this.FindAndReplace(wordApp, "<namSinh>", lbNamSinh.Text);
                    this.FindAndReplace(wordApp, "<noiSinh>", lbNoiSinh.Text);
                    this.FindAndReplace(wordApp, "<lopSV>", lbLop.Text);
                    this.FindAndReplace(wordApp, "<maSoSV>", lbMaSV.Text);
                    this.FindAndReplace(wordApp, "<ngayHN>", DateTime.Today.ToString("dd"));
                    this.FindAndReplace(wordApp, "<thangHN>", DateTime.Today.ToString("MM"));
                    this.FindAndReplace(wordApp, "<namHN>", DateTime.Today.ToString("yyyy"));
                }
                
            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString());
            }
        }
        public static List<int> getRunningProcesses()
        {
            List<int> ProcessIDs = new List<int>();
            //here we're going to get a list of all running processes on
            //the computer
            foreach (Process clsProcess in Process.GetProcesses())
            {
                if (Process.GetCurrentProcess().Id == clsProcess.Id)
                    continue;
                if (clsProcess.ProcessName.Contains("WINWORD"))
                {
                    ProcessIDs.Add(clsProcess.Id);
                }
            }
            return ProcessIDs;
        }


        public static void killProcesses(List<int> processesbeforegen, List<int> processesaftergen)
        {
            foreach (int pidafter in processesaftergen)
            {
                bool processfound = false;
                foreach (int pidbefore in processesbeforegen)
                {
                    if (pidafter == pidbefore)
                    {
                        processfound = true;
                    }
                }

                if (processfound == false)
                {
                    Process clsProcess = Process.GetProcessById(pidafter);
                    clsProcess.Kill();
                }
            }
        }
*/

        public void XuatFileWord(string _filename)
        {
            var fileName = _filename;

            var wordApp = new Word.Application();
            wordApp.Visible = true;
            var document = wordApp.Documents.Open(fileName);            
            var newDocument = CopyToNewDocument(document);
            document.Close();

            SearchAndReplaceEverywhere(newDocument, "<gioiTinh>", _gioiTinh);
            SearchAndReplaceEverywhere(newDocument, "<hoTen>", lbHoTen.Text);
            SearchAndReplaceEverywhere(newDocument, "<ngaySinh>", lbNgaySinh.Text);
            SearchAndReplaceEverywhere(newDocument, "<thangSinh>", lbThangSinh.Text);
            SearchAndReplaceEverywhere(newDocument, "<namSinh>", lbNamSinh.Text);
            SearchAndReplaceEverywhere(newDocument, "<noiSinh>", lbNoiSinh.Text);
            SearchAndReplaceEverywhere(newDocument, "<lopSV>", lbLop.Text);
            SearchAndReplaceEverywhere(newDocument, "<maSoSV>", lbMaSV.Text);
            SearchAndReplaceEverywhere(newDocument, "<ngayHN>", DateTime.Today.ToString("dd"));
            SearchAndReplaceEverywhere(newDocument, "<thangHN>", DateTime.Today.ToString("MM"));
            SearchAndReplaceEverywhere(newDocument, "<namHN>", DateTime.Today.ToString("yyyy"));

        }

         static Word.Document CopyToNewDocument(Word.Document document)
        {
            document.StoryRanges[Word.WdStoryType.wdMainTextStory].Copy();
            var newDocument = document.Application.Documents.Add();
            newDocument.StoryRanges[Word.WdStoryType.wdMainTextStory].Paste();
            return newDocument;
        }

        static void SearchAndReplaceEverywhere(
            Word.Document document, string find, string replace)
        {
            foreach (Word.Range storyRange in document.StoryRanges)
            {
                var range = storyRange;
                while (range != null)
                {
                    SearchAndReplaceInStoryRange(range, find, replace);

                    if (range.ShapeRange.Count > 0)
                    {
                        foreach (Word.Shape shape in range.ShapeRange)
                        {
                            if (shape.TextFrame.HasText != 0)
                            {
                                SearchAndReplaceInStoryRange(
                                    shape.TextFrame.TextRange, find, replace);
                            }
                        }                        
                    }
                    range = range.NextStoryRange;
                }
            }
        }

        static void SearchAndReplaceInStoryRange(
            Word.Range range, string find, string replace)
        {
            range.Find.ClearFormatting();
            range.Find.Replacement.ClearFormatting();
            range.Find.Text = find;
            range.Find.Replacement.Text = replace;
            range.Find.Wrap = Word.WdFindWrap.wdFindContinue;
            range.Find.Execute(Replace: Word.WdReplace.wdReplaceAll);
        }
    
    

        #endregion
    }
}
