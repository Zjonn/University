using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using TestClass;

namespace Reflekcje
{
    class Program
    {
        static void Main(string[] args)
        {
            Test test = new Test();
            Type t = test.GetType();

            PropertyInfo m = t.GetProperty("A", BindingFlags.NonPublic | BindingFlags.Instance);
            FieldInfo f = t.GetField("a", BindingFlags.NonPublic | BindingFlags.Instance);
            Console.WriteLine(m.GetValue(test));
            Console.WriteLine(f.GetValue(test));


            //Testy czasu dostępu
            Program.test(test, t, 1000);


            //Zadanie 2.1.4

            Foo foo = new Foo();
            Type fooT = foo.GetType();
            MethodInfo[] fooI = fooT.GetMethods();

            foreach (MethodInfo fooID in fooI)
            {
                if (fooID.ReturnType == Type.GetType("System.Int32") && fooID.GetParameters().Length == 0 &&
                    fooID.GetCustomAttribute<OznakowaneAttribute>() != null)

                    Console.WriteLine(fooID.Invoke(foo, null));

            }
        }

        static void test(Test test, Type t, int tests)
        {
            FieldInfo a = t.GetField("b");
            int tmp;
            int LiczbaProb = tests;


            DateTime Start = DateTime.Now;
            DateTime End = DateTime.Now;
            for (int proba = 0; proba < LiczbaProb; proba++)
            {
                tmp = (int)a.GetValue(test);
                End = DateTime.Now;
            }

            TimeSpan Czas = End - Start;
            Console.WriteLine("Test 1 (reflekcja): {0}", Czas);

            Start = DateTime.Now;
            for (int proba = 0; proba < LiczbaProb; proba++)
            {
                tmp = test.b;
                End = DateTime.Now;
            }
            Czas = End - Start;
            Console.WriteLine("Test 2 (normalny): {0}", Czas);
        }
    }

    class Test
    {
        public int b = 10;
        int a = 0;
        int A
        {
            get
            {
                return a;
            }
            set
            {
                a = value;
            }
        }
    }
}
namespace TestClass
{
    public class Foo
    {
        [Oznakowane]
        public int Bar()
        {
            return 1;
        }
        public int Qux()
        {
            return 2;
        }
    }

    internal class OznakowaneAttribute : Attribute
    {
    }
}
