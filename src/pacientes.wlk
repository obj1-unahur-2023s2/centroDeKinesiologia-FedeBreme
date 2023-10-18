import aparatos.*

class Paciente {
    var property edad
    var fortalezaMuscular
    var nivelDeDolor
    const rutinaAsignada = []
    
	method asignarRutina(unaRutina) {
   	 rutinaAsignada.addAll(unaRutina)
	}
    
    method puedeUsar(unAparato) {
   	 return unAparato.puedeSerUsadoPor(self)
    }
    
    method usar(unAparato) {
   	 unAparato.usar(self)
    }
    
	method fortalezaMuscular() = fortalezaMuscular
    
	method fortalezaMuscular(unaCantidad) {
   	 fortalezaMuscular = 0.max(fortalezaMuscular + unaCantidad)
	}
    
	method nivelDeDolor() = nivelDeDolor
    
	method nivelDeDolor(unaCantidad) {
   	 nivelDeDolor = 0.max(nivelDeDolor - unaCantidad)
	}
    
    method puedeRealizarLaRutina() {
   	 return rutinaAsignada.all({r => self.puedeUsar(r)})
    }
    
    method realizarRutina() {
   	 rutinaAsignada.forEach({r => self.usar(r)})
    }
}

class PacienteResidente inherits Paciente {
    
    override method realizarRutina() {
   	 super()
   	 fortalezaMuscular += 1 * (rutinaAsignada.size())
    }
}

class PacienteCaprichoso inherits Paciente {
    
    override method puedeRealizarLaRutina() {
   	 return super() and rutinaAsignada.any({r => r.color() == "rojo"})
    }
    
    override method realizarRutina() {
   	 super()
   	 super()
    }
}

object nivelDeDolorQueDecrementa {
    var nivelQueDecrementa = 3
    
    method nivelQueDecrementa() {
   	 return nivelQueDecrementa
    }
    
    method asignarNivelDeCecrementacion(unValor) {
   	 nivelQueDecrementa = unValor
    }
}

class PacienteRapidaRecuperacion inherits Paciente {
    
    override method realizarRutina() {
   	 super()
   	 nivelDeDolor -= nivelDeDolorQueDecrementa.nivelQueDecrementa()
    }
}


