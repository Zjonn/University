using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace zad4
{
    class zad4
    {
        static void Main()
        {
            TagBuilder tag = new TagBuilder();
            Console.WriteLine(tag.StartTag("parent")
         .AddAttribute("parentproperty1", "true")
         .AddAttribute("parentproperty2", "5")
             .StartTag("child1")
             .AddAttribute("childproperty1", "c")
             .AddContent("childbody")
             .EndTag()
             .StartTag("child2")
             .AddAttribute("childproperty2", "c")
             .AddContent("childbody")
             .EndTag()
         .EndTag()
         .StartTag("script")
         .AddContent("$.scriptbody();")
         .EndTag()
         .ToString());

            Console.ReadKey();
        }
    }

    public class TagBuilder
    {
        public TagBuilder() { }

        public TagBuilder(string TagName, TagBuilder Parent, string indentation, string indent_step)
        {
            this.tagName = TagName;
            this.parent = Parent;

            this.indent_step = indent_step;
            this.indentation = indentation;
        }

        private string tagName;
        private TagBuilder parent;
        private StringBuilder body = new StringBuilder();
        private Dictionary<string, string> _attributes = new Dictionary<string, string>();

        private string indent_step = "    ";
        private string indentation = "";

        public TagBuilder AddContent(string Content)
        {
            body.Append(Content);
            return this;
        }

        public TagBuilder AddContentFormat(string Format, params object[] args)
        {
            body.AppendFormat(Format, args);
            return this;
        }

        public TagBuilder StartTag(string TagName)
        {
            TagBuilder tag = new TagBuilder(TagName, this, indentation + indent_step, indent_step);

            return tag;
        }

        public TagBuilder EndTag()
        {
            parent.AddContent(this.ToString());
            return parent;
        }

        public TagBuilder AddAttribute(string Name, string Value)
        {
            _attributes.Add(Name, Value);
            return this;
        }

        public override string ToString()
        {
            StringBuilder tag = new StringBuilder();

            // preamble
            if (!string.IsNullOrEmpty(this.tagName))
            {
                tag.AppendFormat("<{1}", indentation, tagName);
            }

            if (_attributes.Count > 0)
            {
                tag.Append(" ");
                tag.Append(
                    string.Join(" ",
                        _attributes
                            .Select(
                                kvp => string.Format("{0}='{1}'", kvp.Key, kvp.Value))
                            .ToArray()));
            }

            // body/ending
            if (body.Length > 0)
            {
                if (!string.IsNullOrEmpty(this.tagName) || this._attributes.Count > 0)
                {
                    tag.AppendFormat(">\n");
                }
                tag.AppendFormat("{0}{1}", indentation, body.ToString());
                if (!string.IsNullOrEmpty(this.tagName))
                {
                    tag.AppendFormat("\n</{1}>\n", indentation, this.tagName);
                }
            }
            else
                if (!string.IsNullOrEmpty(this.tagName))
            {
                tag.Append("/>");
            }

            return tag.ToString();
        }
    }
}
