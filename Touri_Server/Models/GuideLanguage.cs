//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Touri_Server.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class GuideLanguage
    {
        public int id { get; set; }
        public int guideId { get; set; }
        public int languageId { get; set; }
        public int fluency { get; set; }
    
        public virtual Fluency Fluency1 { get; set; }
        public virtual GuideProfile GuideProfile { get; set; }
        public virtual Language Language { get; set; }
    }
}
