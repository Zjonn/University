using System;
using System.IO;

namespace Null_Object
{
    class Program
    {
        static void Main(string[] args)
        {
            ILogger logger1 = LoggerFactory.Instance.GetLogger(LogType.File, System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location) + "\\MyFile.txt");
            logger1.Log("foo bar"); // logowanie do pliku
            ILogger logger2 = LoggerFactory.Instance.GetLogger(LogType.None);
            logger2.Log("qux"); // brak logowania
        }
    }

    public interface ILogger
    {
        void Log(string Message);
    }

    public class NoneLogger : ILogger
    {
        void ILogger.Log(string Message)
        {
            return;
        }
    }
    public class ConsoleLogger : ILogger
    {
        void ILogger.Log(string Message)
        {
            Console.WriteLine(Message);
        }
    }

    public class FileLogger : ILogger
    {
        private string filePath;
        public FileLogger(string FilePath)
        {
            filePath = FilePath;
        }
        void ILogger.Log(string Message)
        {
            if (File.Exists(filePath))
            {
                using (var tw = new StreamWriter(filePath, true))
                {
                    tw.WriteLine(Message + "\n");
                }
            }
            else
            {
                File.WriteAllText(filePath, Message + "\n");
            }
        }
    }
    public enum LogType
    {
        None,
        Console,
        File
    }
    public class LoggerFactory
    {
        private static LoggerFactory _instance;
        private LoggerFactory()
        {

        }
   
        public ILogger GetLogger(LogType LogType, string Parameters = null)
        {
            if (LogType == LogType.None)
            {
                return new NoneLogger();
            }
            else if (LogType == LogType.Console)
            {
                return new ConsoleLogger();
            }
            else
            {
                return new FileLogger(Parameters);
            }
        }
        public static LoggerFactory Instance
        {
            get
            {
                if (_instance == null)
                {
                    _instance = new LoggerFactory();
                }
                return _instance;
            }
        }
    }
}
