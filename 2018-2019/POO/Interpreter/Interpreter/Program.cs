using System;
using System.Collections.Generic;

namespace Interpreter
{
    class Program
    {
        static void Main(string[] args)
        {
            Context ctx = new Context();

            ctx.SetValue("x", false);
            ctx.SetValue("y", true);

            AbstractExpression exp = new ConjExpression(new NegExpression(
                new VarExpression("x")), new ConstExpression(true)); 
            bool Value = exp.Interpret(ctx);
            Console.WriteLine(Value.ToString());
            Console.ReadKey();
        }
    }

    public class Context
    {
        private Dictionary<string, bool> vars = new Dictionary<string, bool>();

        public bool GetValue(string VariableName)
        {
            return vars[VariableName];
        }
        public void SetValue(string VariableName, bool Value)
        {
            vars[VariableName] = Value;
        }
    }

    public abstract class AbstractExpression
    {
        public abstract bool Interpret(Context context);
    }

    public class ConstExpression : AbstractExpression
    {
        private bool b;
        public ConstExpression(bool value)
        {
            b = value;
        }

        public override bool Interpret(Context context)
        {
            return b;
        }
    }

    public class VarExpression : AbstractExpression
    {
        private string name;
        public VarExpression(string v)
        {
            name = v;
        }

        public override bool Interpret(Context context)
        {
            return context.GetValue(name);
        }
    }

    public abstract class BinaryExpression : AbstractExpression
    {
        protected AbstractExpression e1;
        protected AbstractExpression e2;
        public BinaryExpression(AbstractExpression e1, AbstractExpression e2)
        {
            this.e1 = e1;
            this.e2 = e2;
        }
    }

    public class ConjExpression : BinaryExpression
    {
        public ConjExpression(AbstractExpression e1, AbstractExpression e2) : base(e1, e2)
        {

        }
        public override bool Interpret(Context context)
        {
            return e1.Interpret(context) && e2.Interpret(context);
        }
    }

    public class DisExpression : BinaryExpression
    {
        public DisExpression(AbstractExpression e1, AbstractExpression e2) : base(e1, e2)
        {

        }
        public override bool Interpret(Context context)
        {
            return e1.Interpret(context) || e2.Interpret(context);
        }
    }

    public abstract class UnaryExpression : AbstractExpression
    {
        protected AbstractExpression e;
        public UnaryExpression(AbstractExpression e)
        {
            this.e = e;
        }
    }

    public class NegExpression : UnaryExpression
    {
        public NegExpression(AbstractExpression e) : base(e)
        {

        }

        public override bool Interpret(Context context)
        {
            return !e.Interpret(context);
        }
    }
}
