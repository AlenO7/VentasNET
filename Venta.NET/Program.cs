using VentasNet.Entity.Data;
using Microsoft.EntityFrameworkCore;
using System.Configuration;
using VentasNet.Infra.Interfaces;
using VentasNet.Infra.Repositories;
using VentasNet.Infra.Servicios.Repo;
using VentasNet.Infra.Servicios.Interfaces;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

builder.Services.AddControllers();
builder.Services.AddDbContext<VentasNETContext>(options => options.UseSqlServer(
    builder.Configuration.GetConnectionString("VentasNetConnection")));

builder.Services.AddScoped<IClienteRepo, ClienteRepo>();
builder.Services.AddScoped<IProveedorRepo, ProveedorRepo>();
builder.Services.AddScoped<IProductoRepo, ProductoRepo>();
builder.Services.AddScoped<IUsuarioRepo, UsuarioRepo>();
builder.Services.AddScoped<IMetodoPagoRepo, MetodoPagoRepo>();
builder.Services.AddScoped<IStockRepo, StockRepo>();
builder.Services.AddScoped<IVentaRepo, VentaRepo>();
builder.Services.AddScoped<IClienteService, ClienteService>();





var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Usuario}/{action=Index}/{id?}");

app.Run();
