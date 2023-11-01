using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Core.Interfaces;
public interface IUnitOfWork 
{

    IBienRepository IBienRepositorys { get; }
    IDanielRepository IDanielRepositorys { get; }
    IDiegoRepository IDiegoRepositorys { get; }
    IdieRepository IdieRepositorys { get; }
    IedRepository IedRepositorys { get; }
    IerRepository IerRepositorys { get; }
    Ifr1Repository Ifr1Repositorys { get; }
    Ifr2Repository Ifr2Repositorys { get; }
    IfrRepository IfrRepositorys { get; }
    IGenericRepository IGenericRepositorys { get; }
    IgoRepository IgoRepositorys { get; }
    ImarianaRepository ImarianaRepositorys { get; }
    IpaolaRepository IpaolaRepositorys { get; }
    IpruebasssRepository IpruebasssRepositorys { get; }
    IqasRepository IqasRepositorys { get; }
    ItiRepository ItiRepositorys { get; }
    ItrewRepository ItrewRepositorys { get; }
    ItyRepository ItyRepositorys { get; }
    IwertRepository IwertRepositorys { get; }
    IytRepository IytRepositorys { get; }

    Task<int> SaveAsync();
}
