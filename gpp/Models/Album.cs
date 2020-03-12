using System.Collections;
using System.Collections.Generic;
using System.Linq;

namespace gpp.Models
{
    public class RuleViolation
    {

        public string ErrorMessage { get; private set; }
        public string TagName { get; private set; }

        public RuleViolation(string errorMessage, string tagName)
        {
            ErrorMessage = errorMessage;
            TagName = tagName;
        }
    }


    public partial class Album
    {
            public int Count { get; set; }
            public bool IsValid
            {
                get
                {
                    return (GetRuleViolations().Count() == 0);
                }
            }

            public IEnumerable<RuleViolation> GetRuleViolations()
            {
                if (string.IsNullOrEmpty(this.Caption)) yield return new RuleViolation("Title is Required", "Title");
                yield break;
            }


            partial void OnValidate(System.Data.Linq.ChangeAction action)
            {
                if(!IsValid)
                    throw new System.ApplicationException("Rule Violations prevent Saving...");
            }
   }

    
}