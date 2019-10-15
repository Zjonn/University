using System;
using DependencyEngine;
using Microsoft.VisualStudio.TestTools.UnitTesting;


namespace SimpleContainerTests
{
    public class Foo : IFoo
    { }

    public interface IFoo
    { }

    public class Moo : IFoo
    { }

    public class Boo
    {
        public Moo m;
        public Boo(Moo m)
        {
            this.m = m;
        }
    }

    public class Roo
    {
        public Roo(Roo r)
        { }
    }

    public class Ioo
    {
        public Ioo(IFoo r)
        { }
    }

    public class X
    {
        public X(Y d, string s) { }
    }
    public class Y { }

    [TestClass]
    public class NoParamsConstructor
    {

        [TestMethod]
        public void Basic()
        {
            SimpleContainer sc = new SimpleContainer();
            sc.RegisterType<Foo>(false);

            Foo f1 = sc.ResolveNoParams<Foo>();
            Foo f2 = sc.ResolveNoParams<Foo>();
            Assert.AreNotEqual<Foo>(f1, f2);
        }

        [TestMethod]
        public void Singleton()
        {
            SimpleContainer sc = new SimpleContainer();
            sc.RegisterType<Foo>(true);

            Foo f1 = sc.ResolveNoParams<Foo>();
            Foo f2 = sc.ResolveNoParams<Foo>();
            Assert.AreEqual<Foo>(f1, f2);
        }

        [TestMethod]
        public void SimpleInherit()
        {
            SimpleContainer sc = new SimpleContainer();
            sc.RegisterType<IFoo, Foo>(false);

            IFoo f1 = sc.ResolveNoParams<IFoo>();
            Assert.IsInstanceOfType(f1, typeof(Foo));
        }

        [TestMethod]
        public void Inherit()
        {
            SimpleContainer sc = new SimpleContainer();

            sc.RegisterType<IFoo, Foo>(false);
            IFoo f1 = sc.ResolveNoParams<IFoo>();
            Assert.IsInstanceOfType(f1, typeof(Foo));

            sc.RegisterType<IFoo, Moo>(false);
            IFoo f2 = sc.ResolveNoParams<IFoo>();
            Assert.IsInstanceOfType(f2, typeof(Moo));
        }

        [TestMethod]
        public void Instance()
        {
            SimpleContainer sc = new SimpleContainer();
            IFoo f1 = new Foo();
            sc.RegisterInstance<IFoo>(f1);
            IFoo f2 = sc.ResolveNoParams<IFoo>();
            Assert.AreEqual<IFoo>(f1, f2);

        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException),
   "You can resolve only objects with callable constructor")]
        public void TestUnMappedInterface()
        {
            SimpleContainer sc = new SimpleContainer();
            sc.ResolveNoParams<IFoo>();
        }
    }

    [TestClass]
    public class LongestConstructor
    {

        [TestMethod]
        public void Basic()
        {
            SimpleContainer sc = new SimpleContainer();
            sc.RegisterType<Foo>(false);

            Foo f1 = sc.Resolve<Foo>();
            Foo f2 = sc.Resolve<Foo>();
            Assert.AreNotEqual<Foo>(f1, f2);
        }

        [TestMethod]
        public void Singleton()
        {
            SimpleContainer sc = new SimpleContainer();
            sc.RegisterType<Foo>(true);

            Foo f1 = sc.Resolve<Foo>();
            Foo f2 = sc.Resolve<Foo>();
            Assert.AreEqual<Foo>(f1, f2);
        }

        [TestMethod]
        public void SimpleInherit()
        {
            SimpleContainer sc = new SimpleContainer();
            sc.RegisterType<IFoo, Foo>(false);

            IFoo f1 = sc.Resolve<IFoo>();
            Assert.IsInstanceOfType(f1, typeof(Foo));
        }

        [TestMethod]
        public void Inherit()
        {
            SimpleContainer sc = new SimpleContainer();

            sc.RegisterType<IFoo, Foo>(false);
            IFoo f1 = sc.Resolve<IFoo>();
            Assert.IsInstanceOfType(f1, typeof(Foo));

            sc.RegisterType<IFoo, Moo>(false);
            IFoo f2 = sc.Resolve<IFoo>();
            Assert.IsInstanceOfType(f2, typeof(Moo));
        }

        [TestMethod]
        public void Instance()
        {
            SimpleContainer sc = new SimpleContainer();
            IFoo f1 = new Foo();
            sc.RegisterInstance<IFoo>(f1);
            IFoo f2 = sc.Resolve<IFoo>();
            Assert.AreEqual<IFoo>(f1, f2);

        }

        [TestMethod]
        public void OneParameter()
        {
            SimpleContainer sc = new SimpleContainer();
            sc.RegisterType<Foo>(false);

            Boo b1 = sc.Resolve<Boo>();
            Assert.AreNotEqual<Moo>(b1.m, null);
        }

        [TestMethod]
        public void OneParameterInterface()
        {
            SimpleContainer sc = new SimpleContainer();
            IFoo f1 = new Foo();
            sc.RegisterInstance<IFoo>(f1);

            sc.RegisterType<Ioo>(false);

            Ioo i1 = sc.Resolve<Ioo>();
            Ioo i2 = sc.Resolve<Ioo>();
            Assert.AreNotEqual<Ioo>(i1, i2);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException), "Unresolvable type")]
        public void InfRec()
        {
            SimpleContainer sc = new SimpleContainer();
            sc.Resolve<Roo>();
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException), "Unresolvable type")]
        public void NotRecTypeConstructor()
        {
            SimpleContainer c = new SimpleContainer();
            X x = c.Resolve<X>();
        }

        [TestMethod]
        public void RecTypeConstructor()
        {
            SimpleContainer c = new SimpleContainer();

            c.RegisterInstance("ala ma kota");
            X x = c.Resolve<X>();
        }
    }
}
