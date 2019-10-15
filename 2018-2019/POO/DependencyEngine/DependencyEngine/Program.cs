using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace DependencyEngine
{
    public class SimpleContainer
    {
        private string unresolvableType = "Unresolvable type";
        private class TypeData
        {
            public bool isSingleton { get; }
            public Type mappedType { get; }
            public Object instance { get; set; }

            public TypeData(bool Singleton)
            {
                isSingleton = Singleton;
            }

            public TypeData(Object instance)
            {
                isSingleton = false;
                this.instance = instance;
            }

            public TypeData(bool Singleton, Type mappedType)
            {
                this.mappedType = mappedType;
                isSingleton = Singleton;
            }
        }

        private Dictionary<Type, TypeData> mapping = new Dictionary<Type, TypeData>();

        public void RegisterInstance<T>(T Instance)
        {
            mapping[typeof(T)] = new TypeData(Instance);
        }

        public void RegisterType<T>(bool Singleton) where T : class
        {
            mapping[typeof(T)] = new TypeData(Singleton);
        }

        public void RegisterType<From, To>(bool Singleton) where To : From
        {
            mapping[typeof(From)] = new TypeData(Singleton, typeof(To));
        }

        public T ResolveNoParams<T>()
        {
            Type t = typeof(T);

            try
            {
                TypeData typeInfo = mapping[t];
                Object result = null;

                if (typeInfo.instance == null)
                {
                    Type toConstruct = typeInfo.mappedType == null ? t : typeInfo.mappedType;

                    result = toConstruct
                            .GetConstructor(Type.EmptyTypes).Invoke(new object[] { });

                    if (typeInfo.isSingleton)
                        typeInfo.instance = result;
                }
                else
                {
                    result = typeInfo.instance;
                }
                return (T)result;
            }
            catch (Exception)
            {
                if (!t.IsClass)
                    throw new ArgumentException("You can resolve only objects with constructors");
                return (T)(t.GetConstructor(Type.EmptyTypes).Invoke(new object[] { }));
            }

        }

        Object _Resolve(Type type, List<Type> visited)
        {
            ConstructorInfo longest = null;

            if (type.IsClass)
            {
                longest = type.GetConstructors()[0];

                foreach (ConstructorInfo constr in type.GetConstructors())
                    if (constr.GetParameters().Length > longest.GetParameters().Length)
                        longest = constr;
            }

            try
            {
                TypeData typeInfo = mapping[t];

                if (typeInfo.instance != null)
                    return tpeInfo.instance;

                if (!type.IsClass)
                {
                    if (typeInfo.mappedType == null)
                        throw new ArgumentException(unresolvableType);

                    Object instance;
                    instance = _Resolve(typeInfo.mappedType, visited);
                    mapping[typeInfo.mappedType] = new TypeData(instance);
                    return instance;
                }
            }
            catch (KeyNotFoundException)
            {
                if (!t.IsClass)
                    throw new ArgumentException(unresolvableType);
            }


            if (longest.GetParameters().Length == 0)
            {
                return ResolveNoParams<T>();
            }

            object[] paramObj = new object[longest.GetParameters().Length];
            int i = 0;
            foreach (ParameterInfo paramInfo in longest.GetParameters())
            {
                Type paramType = paramInfo.ParameterType;

                if (visited.Contains<Type>(paramType)
                    && !mapping.ContainsKey(paramType))
                    throw new ArgumentException(unresolvableType);

                visited.Add(paramType);

                paramObj[i] = _Resolve(this, paramType, visited);
                mapping[paramType] = new TypeData(paramObj[i]);

                i++;
            }
            return longest.Invoke(paramObj);
        }

        public T Resolve<T>()
        {
            try
            {
                List<Type> ls = new List<Type>();
                return (T)_Resolve(typeof(T), ls);
            }
            catch (Exception)
            {
                throw new ArgumentException(unresolvableType);
            }
        }
    }


    class Program
    {
        static void Main(string[] args)
        {
        }
    }
}
