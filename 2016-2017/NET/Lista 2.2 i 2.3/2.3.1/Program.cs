using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.Generic;

namespace _2._3._1
{
    class Program
    {
        static void Main(string[] args)
        {
            int a = 0;
            for (int i = 0; i < 1000; i++) a++;
            test1();
            test2();
        }

        static void test1()
        {
            int tests = 20000;
            DateTime arrayTime = DateTime.Now;

            ArrayList l = new ArrayList();

            for (int i = 0; i < tests; i++)
            {
                l.Add(i);
            }
            for (int i = 0; i < tests; i++)
            {
                l.IndexOf(i);
            }
            int a;
            for (int i = 0; i < tests; i++)
            {
                a = (int)l[i];
            }
            Console.WriteLine("Czas dostępu do arraylist {0}", DateTime.Now - arrayTime);

            DateTime listTime = DateTime.Now;

            List<int> list = new List<int>();

            for (int i = 0; i < tests; i++)
            {
                list.Add(i);
            }
            for (int i = 0; i < tests; i++)
            {
                list.IndexOf(i);
            }

            for (int i = 0; i < tests; i++)
            {
                a = list[i];
            }
            Console.WriteLine("Czas dostępu do list {0}", DateTime.Now - listTime);
        }

        static void test2()
        {
            int tests = 900000;
            DateTime arrayTime = DateTime.Now;

            Hashtable h = new Hashtable();

            for (int i = 0; i < tests; i++)
            {
                h.Add(i, i);
            }
            for (int i = 0; i < tests; i++)
            {
                h.ContainsKey(i);
            }
            int a;
            for (int i = 0; i < tests; i++)
            {
                a = (int)h[i];
            }
            Console.WriteLine("Czas dostępu do hashtable {0}", DateTime.Now - arrayTime);

            DateTime listTime = DateTime.Now;

            Dictionary<int, int> list = new Dictionary<int, int>();

            for (int i = 0; i < tests; i++)
            {
                list.Add(i, i);
            }
            for (int i = 0; i < tests; i++)
            {
                list.ContainsKey(i);
            }
            for (int i = 0; i < tests; i++)
            {
                a = list[i];
            }
            Console.WriteLine("Czas dostępu do dictonary {0}", DateTime.Now - listTime);
        }
    }
}
