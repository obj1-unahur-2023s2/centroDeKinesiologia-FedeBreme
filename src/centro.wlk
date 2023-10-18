import pacientes.*
import aparatos.*

object centroDeKinesiologia {
    const aparatos = []
    const pacientes = []
    var visitaTecnica = 0
    
    method sumarAparato(unAparato) {
   	 aparatos.add(unAparato)
    }
    
    method quitarAparato(unAparato) {
   	 aparatos.remove(unAparato)
    }
    
    method sumarPaciente(unPaciente) {
   	 pacientes.add(unPaciente)
    }
    
    method quitarPaciente(unPaciente) {
   	 pacientes.remove(unPaciente)
    }
    
    method coloresDeAparatos() {
   	 return aparatos.map({a => a.color()}).asSet()
    }
    
    method pacientesMenoresDe8Anios() {
   	 return pacientes.filter({p => p.edad() < 8})
    }
    
    method cantDePacientesQueNoPuedenCumplirSuRutina() {
   	 return pacientes.count({p => !p.puedeRealizarLaRutina()})
    }
    
    method estaEnCondiciones() {
   	 return aparatos.all({a => !a.necesitaMantenimiento()})
    }
    
    method estaComplicado() {
   	 return aparatos.count({a => a.necesitaMantenimiento()}) >= aparatos.size() / 2
    }
    
	method visitaTecnica() = visitaTecnica
    
    method realizarMantenimientoGeneral() {
   	 aparatos.forEach({a => a.hacerleMantenimiento()})
   	 visitaTecnica += 1
    }
}
