using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Interfaces;
using Infrastructure.UnitOfWork;

namespace API.Extension;

    public static class ApplicationServiceExtensions
    {
        public static void ConfigureCors(this IServiceCollection services) =>
            services.AddCors(options =>
            {
                options.AddPolicy("CorsPolicy", builder =>
                    builder.AllowAnyHeader()          //WithOrigin("https://domain.com")
                        .AllowAnyMethod()             //WithMethods("GET","POST")
                        .WithOrigins());              //WithHeaders("accept","content-type")
            });
        public static void AddApplicationServices(this IServiceCollection services)
        {
            services.AddScoped<UnitOfWork>();
        }
    }
