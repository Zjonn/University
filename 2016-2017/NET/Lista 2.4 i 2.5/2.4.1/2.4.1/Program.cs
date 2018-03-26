using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _2._4._1
{
    class Program
    {
        static void Main(string[] args)
        {
            string s = "abcaba";
            Console.WriteLine(s.isPalindrome());
        }
    }
    static class RString
    {
        public static bool isPalindrome(this string s)
        {
            for (int i = 0; i < s.Length / 2; i++)
            {
                if (s[i] != s[s.Length - 1 - i]) return false;
            }
            return true;
        }
    }
}

