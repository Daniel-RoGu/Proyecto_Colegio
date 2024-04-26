using Microsoft.AspNetCore.Identity;
using ProyectoColegio.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore.Migrations.Internal;
using ProyectoColegio.Inicializador;
using ProyectoColegio.Models;
using Mono.Unix.Native;

namespace ProyectoColegio.Inicializador
{
    public class DbInicializador : IDbInicializador
    {
        private readonly ContextoMigracion _contexto;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly UserManager<IdentityRole> _roleManager;

        public DbInicializador(ContextoMigracion contexto, UserManager<IdentityUser> userManager, UserManager<IdentityRole> roleManager)
        {
            _contexto = contexto;
            _userManager = userManager;
            _roleManager = roleManager;
        }

        //public void Inicializar()
        //{
        //    try
        //    {
        //        //if (_contexto.Database.GetPendingMigrations().Count() > 0)
        //        //{

        //        //}
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }
        //}

        public void Inicializar()
        {
            try
            {
                var migrations = _contexto.Database.GetPendingMigrations();

                if (migrations.Any())
                {
                    Console.WriteLine("Migraciones pendientes:");

                    foreach (var migration in migrations)
                    {
                        Console.WriteLine(migration);
                    }

                    _contexto.Database.Migrate(); // Aplicar las migraciones pendientes
                    Console.WriteLine("Migraciones aplicadas correctamente.");
                }
                else
                {
                    Console.WriteLine("No hay migraciones pendientes.");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al aplicar migraciones: {ex.Message}");
            }

            if (_contexto.Rol.Any(r => r.NombreRol == "Coordinador")) return;

            _roleManager.CreateAsync(new IdentityRole("Coordinador")).GetAwaiter().GetResult();
            _roleManager.CreateAsync(new IdentityRole("Docente")).GetAwaiter().GetResult();
            _roleManager.CreateAsync(new IdentityRole("Estudiante")).GetAwaiter().GetResult();

            // Crea un usuario administrador
            _userManager.CreateAsync(new UsuarioLogin
            {
                UserName = "RectorAdmin",
                Password = "RectorAdmin"
            }, "@dmin").GetAwaiter().GetResult();

            // Asignar el rol al usuario
            Usuario usuario = _contexto.Usuarios.Where(u => u.NombreUsuario == "RectorAdmin").FirstOrDefault();
            //_userManager.AddToRoleAsync(usuario.Rol, "Coordinador").GetAwaiter.GetResult();
        }

        private class UsuarioLogin : IdentityUser
        {
            public string UserName { get; set; }
            public string Password { get; set; }
        }
    }
    
}