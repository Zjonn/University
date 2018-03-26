using System.Windows;

namespace _3._2._1
{
    /// <summary>
    /// Logika interakcji dla klasy MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void checkBox1_Checked(object sender, RoutedEventArgs e)
        {

        }

        private void button1_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void ok_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show(name.Text + "\n" + adr.Text +
                "\nStudia " + cmb.Text + "\n" +
                ((bool)(day.IsChecked) ? "dzienne " : "") + ((bool)(uzu.IsChecked) ? "uzupełniające" : ""), "Informacje");
        }
    }
}
