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
    
    public partial class GuideLocation
    {
        public int id { get; set; }
        public int guideId { get; set; }
        public string cityServed { get; set; }
        public double latitude { get; set; }
        public double longitude { get; set; }
    
        public virtual GuideProfile GuideProfile { get; set; }
    }
}
