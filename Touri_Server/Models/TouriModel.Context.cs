﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class NativusDBEntities : DbContext
    {
        public NativusDBEntities()
            : base("name=NativusDBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Attribute> Attributes { get; set; }
        public virtual DbSet<Connection> Connections { get; set; }
        public virtual DbSet<Expertise> Expertises { get; set; }
        public virtual DbSet<Fluency> Fluencies { get; set; }
        public virtual DbSet<GuideExpertises> GuideExpertises { get; set; }
        public virtual DbSet<GuideLanguage> GuideLanguages { get; set; }
        public virtual DbSet<GuideLocation> GuideLocations { get; set; }
        public virtual DbSet<GuideProfile> GuideProfiles { get; set; }
        public virtual DbSet<GuideProfileImage> GuideProfileImages { get; set; }
        public virtual DbSet<Language> Languages { get; set; }
        public virtual DbSet<ReviewedAttribute> ReviewedAttributes { get; set; }
        public virtual DbSet<Review> Reviews { get; set; }
        public virtual DbSet<TouriImage> TouriImages { get; set; }
        public virtual DbSet<TravellerProfile> TravellerProfiles { get; set; }
        public virtual DbSet<UserLastMessage> UserLastMessages { get; set; }
        public virtual DbSet<Message> Messages { get; set; }
    }
}
