using System;

namespace ProstyAlgorytm
{
    class Program
    {
        /// <summary>
        /// Głowna funkcja
        /// </summary>
        /// <param name="args"></param>
        static void Main(string[] args)
        {
            for (int i = 1; i < 100000; i++)
            {
                if (podzielna(i)) { Console.WriteLine(i); }
            }
        }
        /// <summary>
        /// Metoda sprawdza czy liczba dzieli się
        /// przez każdą ze swoich cyfr i przez ich sumę
        /// </summary>
        /// <param name="x"></param>
        /// <returns></returns>
        static bool podzielna(int x)
        {
            char[] liczba = x.ToString().ToCharArray();
            int val = 0;

            for (int i = 0; i < liczba.Length; i++)
            {
                int num = Int32.Parse(liczba[i].ToString());
                if (num != 0 && x % num != 0) return false;
                val += num;
            }
            if (x % val == 0) return true;
            return false;
        }
    }
}
namespace Grid
{
    class Grid
    {
        int[,] tab;
        int rows, kolumns;

        public Grid(int rows, int kolumns)
        {
            tab = new int[rows, kolumns];
            this.rows = rows;
            this.kolumns = kolumns;
        }
        /// <summary>
        /// Indekser zwraca wiersz tablicy
        /// </summary>
        /// <param name="indeks"></param>
        /// <returns></returns>
        public int[] this[int indeks]
        {
            get
            {
                int[] ret = new int[kolumns];
                for (int i = 0; i < rows; i++)
                {
                    ret[i] = tab[indeks, i];
                }
                return ret;
            }
        }
        /// <summary>
        /// Indekser pozwala pobrać dowolną wartość z tablicy
        /// </summary>
        /// <param name="r"></param>
        /// <param name="k"></param>
        /// <returns></returns>
        public int this[int r, int k]
        {
            get
            {
                return tab[r, k];
            }
            set
            {
                tab[r, k] = value;
            }
        }

    }

}
