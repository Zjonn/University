using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3._3._3
{
    class Program
    {
        public Program(string[] args)
        {
            

            if (args[0] == "o")
            {
                Deszyfruj(args[1], args[1] + "dec.txt");
            }
            else
            {
                Szyfruj(args[1], args[1] + "sz.txt");
            }
        }

        public void Szyfruj(String input, String output)
        {
            FileStream fsOutput = new FileStream(output, FileMode.Create);
            FileStream fsInput = new FileStream(input, FileMode.Open);
            GZipStream gZip = new GZipStream(fsOutput, CompressionMode.Compress);
            StreamWriter writer = new StreamWriter(gZip);
            StreamReader read = new StreamReader(fsInput);

            writer.WriteLine(read.ReadToEnd());

            writer.Close();
            gZip.Close();
            fsOutput.Close();
        }

        public void Deszyfruj(String input, String output)
        {
            String tekst;
            FileStream fsInput = new FileStream(input, FileMode.Open);
            FileStream fsOutput = new FileStream(output, FileMode.Create);
            GZipStream gZip = new GZipStream(fsInput, CompressionMode.Decompress);
            StreamReader reader = new StreamReader(gZip);
            StreamWriter writer = new StreamWriter(fsOutput);
            tekst = reader.ReadLine();
            reader.Close();
            gZip.Close();
            fsInput.Close();
            writer.Write(tekst);
            //writer.Flush();
            writer.Close();
        }

        static void Main(string[] args)
        {
            new Program(args);
        }

    }
}
