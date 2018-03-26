using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PrimeCollections;
using Lista;

namespace PrimeCollections
{
    class PrimeCollection : System.Collections.IEnumerable, IEnumerator
    {
        int actualPrim = 2;

        public object Current
        {
            get
            {
                return actualPrim;
            }
        }
        public IEnumerator GetEnumerator()
        {
            return this;
        }


        public bool MoveNext()
        {
            actualPrim++;
            bool h = false;
            if (actualPrim % 2 == 0) actualPrim++;
            for (int i = actualPrim; i < Int32.MaxValue - 1; i += 2)
            {
                for (int j = 3; j < Math.Sqrt(i) + 1; j += 2)
                {
                    if (i % j == 0) { h = true; break; }
                }
                if (!h)
                {
                    actualPrim = i;
                    return true;
                }
                h = false;
            }
            return false;
        }

        public void Reset()
        {
            actualPrim = 2;
        }
    }

}

namespace CollectionInterface
{
    interface ICollections<K, V>
    {
        bool isEmpty();
    }
}

namespace Lista
{
    public class List<T> : CollectionInterface.ICollections<int, T>, IEnumerable<T>, IEnumerator<T>
    {
        ListStruct<T> firstE;
        ListStruct<T> lastE;
        ListStruct<T> actual = null;
        int length = 0;

        public int Length
        {
            get
            {
                return length;
            }
        }

        public T Current
        {
            get
            {
                return actual.getElem();
            }
        }

        object IEnumerator.Current
        {
            get
            {
                return actual;
            }
        }

        public T this[int index]
        {
            get
            {
                ListStruct<T> tmp = firstE;
                for (int i = 0; i < index; i++)
                {
                    if (tmp != null) tmp = tmp.getNextStruct();
                    else return default(T);
                }
                return tmp.getElem();
            }
        }

        public void add(T elem)
        {
            if (firstE == null)
            {
                firstE = new ListStruct<T>(elem, null);
                lastE = firstE;
            }
            else
            {
                ListStruct<T> tmp = new ListStruct<T>(elem, lastE);
                lastE.setNextStruct(tmp);
                lastE = tmp;
            }
            length++;
        }

        public bool isEmpty()
        {
            if (firstE == null || lastE == null) return true;
            return false;
        }

        public T removeFirst()
        {
            ListStruct<T> tmp = firstE;
            if (firstE != null)
            {
                if ((firstE = firstE.getPrevStruct()) == firstE) lastE = firstE;
                length--;
                return tmp.getElem();
            }
            return default(T);
        }

        public override string ToString()
        {
            return firstE.ToString() + lastE.ToString();
        }

        public T removeLast()
        {
            ListStruct<T> tmp = lastE;
            if (lastE != null)
            {
                if ((lastE = firstE.getPrevStruct()) == firstE) firstE = lastE;
                length--;
                return tmp.getElem();
            }
            return default(T);
        }

        public void Dispose()
        {
            actual = null;
        }

        public bool MoveNext()
        {
            if (actual == null) { actual = firstE; return true; }
            if (actual.getNextStruct() == null) return false;
            actual = actual.getNextStruct();
            return true;
        }

        public void Reset()
        {
            actual = null;
        }

        public IEnumerator<T> GetEnumerator()
        {
            return this;
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return this;
        }
    }

    class ListStruct<T>
    {
        T elem;
        ListStruct<T> pStruct;
        ListStruct<T> nStruct;

        public ListStruct(T elem, ListStruct<T> pStruct)
        {
            this.elem = elem;
            this.pStruct = pStruct;
        }

        public void setNextStruct(ListStruct<T> n)
        {
            nStruct = n;
        }

        public ListStruct<T> getPrevStruct()
        {
            return pStruct;
        }

        public ListStruct<T> getNextStruct()
        {
            return nStruct;
        }

        public T getElem()
        {
            return elem;
        }

    }
}

namespace Dictonary
{

    class Dictonary<K, V> : CollectionInterface.ICollections<K, V>
    {
        K key;
        V value;
        Dictonary<K, V> next;
        public Dictonary()
        {
            this.key = default(K);
            this.value = default(V);
            this.next = null;
        }
        Dictonary(K key, V val)
        {
            this.key = key;
            this.value = val;
            this.next = null;
        }
        public void add(K key, V val)
        {
            Dictonary<K, V> next = this.next;
            while (next.next != null)
            {
                next = next.next;
            }
            next.next = new Dictonary<K, V>(key, val);
        }
        public V find(K key)
        {
            Dictonary<K, V> next = this.next;

            while (next != null)
            {
                if (next.key.Equals(key))
                    return next.value;
                next = next.next;
            }
            return default(V);
        }
        public bool isEmpty()
        {
            if (this.next == null) return true;
            return false;
        }
        public void remove(K key)
        {
            Dictonary<K, V> next = this.next;
            Dictonary<K, V> prev = this;
            while (next != null)
            {
                if (next.key.Equals(key))
                {
                    prev.next = next.next;
                    return;
                }
                prev = next;
                next = next.next;

            }
        }
    }
}

namespace Main
{
    class Program
    {
        static void Main(string[] args)
        {
            //PrimeCollection p = new PrimeCollection();
            //foreach (int element in p)
            //{
            //    // Console.WriteLine(element);
            //}

            Lista.List<int> l = new Lista.List<int>();
            l.add(1);
            l.add(5);
            l.add(234);
            l.add(235);
            l.add(45);
            l.add(34);
            foreach (int element in l)
            {
                Console.WriteLine(element);
            }

            foreach (int element in l)
            {
                Console.WriteLine(element);
            }
            Console.WriteLine(l[3]);
            Console.WriteLine(l[0]);
            Console.WriteLine(l.ToString());
        }
    }
}
