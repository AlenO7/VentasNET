﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using VentasNet.Entity.Data;
using VentasNet.Entity.Models;

namespace VentasNet.Entity.Data.Configurations
{
    public partial class StockConfiguration : IEntityTypeConfiguration<Stock>
    {
        public void Configure(EntityTypeBuilder<Stock> entity)
        {
            entity.Property(e => e.FechaEgreso).HasColumnType("date");

            entity.Property(e => e.FechaIngreso).HasColumnType("date");

            entity.Property(e => e.FechaMovimiento)
                .IsRequired()
                .IsRowVersion()
                .IsConcurrencyToken();

            OnConfigurePartial(entity);
        }

        partial void OnConfigurePartial(EntityTypeBuilder<Stock> entity);
    }
}