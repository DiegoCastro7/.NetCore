using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API.Helpers;

    public class Authorization
    {
        public enum Roles 
        {
            Administrador,
            Manager,
            Employee,
            Person
        }
        public const Roles rol_default = Roles.Person;
    }
