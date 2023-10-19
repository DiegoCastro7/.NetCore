using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace Persistence.Data
{
    public class ShopOnlineContext : DbContext
    {
        public ShopOnlineContext(DbContextOptions options) : base(options)
        {
        }
    }
}