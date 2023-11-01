using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using API.Dtos;
using AutoMapper;
using Core.Entities;

namespace API.Profiles
{
    public class MappingProfiles : Profile {
        public MappingProfiles() {

            CreateMap<Bien, BienDto>().ReverseMap();
            CreateMap<Daniel, DanielDto>().ReverseMap();
            CreateMap<die, dieDto>().ReverseMap();
            CreateMap<Diego, DiegoDto>().ReverseMap();
            CreateMap<ed, edDto>().ReverseMap();
            CreateMap<er, erDto>().ReverseMap();
            CreateMap<fr, frDto>().ReverseMap();
            CreateMap<fr1, fr1Dto>().ReverseMap();
            CreateMap<fr2, fr2Dto>().ReverseMap();
            CreateMap<go, goDto>().ReverseMap();
            CreateMap<mariana, marianaDto>().ReverseMap();
            CreateMap<paola, paolaDto>().ReverseMap();
            CreateMap<pruebasss, pruebasssDto>().ReverseMap();
            CreateMap<qas, qasDto>().ReverseMap();
            CreateMap<ti, tiDto>().ReverseMap();
            CreateMap<trew, trewDto>().ReverseMap();
            CreateMap<ty, tyDto>().ReverseMap();
            CreateMap<wert, wertDto>().ReverseMap();
            CreateMap<yt, ytDto>().ReverseMap();

        }
    }
}
