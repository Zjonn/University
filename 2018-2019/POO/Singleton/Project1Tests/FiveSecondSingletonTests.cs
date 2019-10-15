using Microsoft.VisualStudio.TestTools.UnitTesting;
using zad1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;

namespace zad1.Tests
{
    [TestClass()]
    public class FiveSecondSingletonTests
    {
        [TestMethod()]
        public void TestS1()
        {
            Singleton s1, s2;

            s1 = Singleton.GetInstance();
            s2 = Singleton.GetInstance();

            Assert.IsNotNull(s1);
            Assert.IsNotNull(s2);
            Assert.AreSame(s1, s2);
        }

        [TestMethod()]
        public void TestS2()
        {
            Thread t1, t2;
            ThreadSingleton s1 = null, s2 = null;

            t1 = new Thread(() =>
            {
                s1 = ThreadSingleton.GetInstance();
            }
                );
            t2 = new Thread(() =>
            {
                s2 = ThreadSingleton.GetInstance();
            }
                );

            t1.Start();
            t2.Start();
            t1.Join();
            t2.Join();

            Assert.IsNotNull(s1);
            Assert.IsNotNull(s2);
            Assert.AreNotSame(s1, s2);
        }

        [TestMethod()]
        public void TestS3()
        {
            FiveSecondSingleton s1, s2, s3;

            s1 = FiveSecondSingleton.GetInstance();
            Thread.Sleep(TimeSpan.FromSeconds(4));
            s2 = FiveSecondSingleton.GetInstance();
            Thread.Sleep(TimeSpan.FromSeconds(2));
            s3 = FiveSecondSingleton.GetInstance();

            Assert.AreSame(s1, s2);
            Assert.AreNotSame(s1, s3);
            Assert.AreNotSame(s2, s3);
        }
    }
}