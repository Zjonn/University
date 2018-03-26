using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2._4._5
{
    class Program
    {
        static void Main(string[] args)
        {
            var list = from s in File.ReadAllLines("1.txt")
                       let st = s.Split(',')
                       join r in File.ReadAllLines("2.txt") on st[2] equals r.Split(',')[0]
                       let rt = r.Split(',')
                       
                       select new { Imie = st[0], Nazwisko = st[1], Pesel = st[2], Konto = rt[1] };

            foreach (var a in list)
            {
                Console.WriteLine(a);
            }
        }
    }
}
