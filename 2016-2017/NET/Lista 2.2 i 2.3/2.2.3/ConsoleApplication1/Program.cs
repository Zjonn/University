using System;
using System.Runtime.InteropServices;

namespace ConsoleApplication1
{
    class Program
    {
        [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
        public delegate int Del(int n);

        [DllImport("Lib.dll")]
        public static extern int ExecuteC(int n, [MarshalAs(UnmanagedType.FunctionPtr)] Del fun);



        static void Main(string[] args)
        {
            Del d = isPrimeCs;
            Console.WriteLine(ExecuteC(Int32.Parse(args[0]), d));
        }

        static int isPrimeCs(int n)
        {
            for(int i = 2; i * i <= n; i++)
            {
                if (n % i == 0) return 0;
            }return 1;
        }
    }
}
