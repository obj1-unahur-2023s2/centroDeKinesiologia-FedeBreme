import pacientes.*

class Maquina {
    var property color = "blanco"
}

class Magneto inherits Maquina {
    var nivelDeImantacion = 800
    
    method usar(unPaciente){
   	 nivelDeImantacion -= 1
   	 unPaciente.nivelDeDolor(unPaciente.nivelDeDolor() * 0.10)
    }
    
	method puedeSerUsadoPor(unPaciente) = true
    
    method necesitaMantenimiento() = nivelDeImantacion < 100
    
    method hacerleMantenimiento() {
   	 nivelDeImantacion += 500
    }
}

class Bicicleta inherits Maquina {
    var vecesQueSeDesajustanLosTornillos = 0
    var vecesQuePierdeAceite = 0
    
    method usar(unPaciente) {
   	 if(unPaciente.nivelDeDolor() > 30 and unPaciente.edad().between(30, 50)) {
   		 vecesQueSeDesajustanLosTornillos += 1
   		 vecesQuePierdeAceite += 1
   	 } else if(unPaciente.nivelDeDolor() > 30) {
   		 vecesQueSeDesajustanLosTornillos += 1
   	 }
   	 unPaciente.nivelDeDolor(4)
   	 unPaciente.fortalezaMuscular(3)
    }
    
    method puedeSerUsadoPor(unPaciente) {
   	 return unPaciente.edad() > 8
    }
    
    method necesitaMantenimiento() = vecesQueSeDesajustanLosTornillos <= 10 or vecesQuePierdeAceite <= 5
    
    method hacerleMantenimiento() {
   	 vecesQueSeDesajustanLosTornillos = 0
   	 vecesQuePierdeAceite = 0
    }
}

class Minitramp inherits Maquina {
    
	method usar(unPaciente) {
   	 unPaciente.fortalezaMuscular(unPaciente.edad() * 0.10)
	}
    
	method puedeSerUsadoPor(unPaciente) {
   	 return unPaciente.nivelDeDolor() < 20
	}
    
    method necesitaMantenimiento() = false
    
    method hacerleMantenimiento() {}
}

