using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2._3._3
{
    class Program
    {
        private delegate List<int> convert(List<string> l,Converter<string, int> converter);
        convert converterr = delegate (List<string> list,Converter<string, int> converter)
        {
            List<int> l = list.ConvertAll<int>(converter);
            return l;
        };

        private delegate int TypDelegacji(int a);
        TypDelegacji obiektDelegacji = delegate (int x)
        {
            Console.WriteLine("Wywołano metode anonimową");
            return (x * x);
        };
        static void Main(string[] args)
        {

        }
    }
}
