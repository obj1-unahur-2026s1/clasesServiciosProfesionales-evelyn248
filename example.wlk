//---ETAPA 1---

class Profesional {

  const property universidadQueAsistio
  
  //si hago metodos abstractos no es qe se acuerde, es que enviara un msj preguntando a quien corresponda
  method honorarios ()
  method provinciasQuePuedeTrabajar() 

}

class ProfesionalVinculado inherits Profesional{

  override method honorarios() = universidadQueAsistio.honorariosRecomendados()
  override method provinciasQuePuedeTrabajar() = [universidadQueAsistio.proincia()]
}

class ProfesionalAsociado inherits Profesional {

 override method honorarios() = 3000
 override method provinciasQuePuedeTrabajar() = ["Entre Ríos", "Santa Fe", "Corrientes"]
}

class ProfesionalLibre inherits Profesional{
  
  const property honorarios
  const property provincias = []
  
  override method honorarios() = honorarios
  override method provinciasQuePuedeTrabajar() = provincias
}

class Universidad {
  const property provincia
  const property honorariosRecomendados 
}

class Empresa {
  const profesionalesContratados = []
  const property honorarioDeReferencia

  method cuantosContratadosDe(unaUniversidad) = profesionalesContratados.count({p => p.universidadQueAsistio() == unaUniversidad})
  method profesionalesCaros() = profesionalesContratados.filter({p => p.honorarios() > self.honorarioDeReferencia()})
  method universidadesFormadoras() = profesionalesContratados.map({p => p.universidadQueAsistio()}).asSet() //con .asSet() elimino los repertidos
  method profesionalMasBarato() = profesionalesContratados.min({p => p.honorarios()})
  method esDeGenteAcotada() = profesionalesContratados.all({p => p.provinciasQuePuedeTrabajar().size() < 3})

}