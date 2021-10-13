import wollok.game.*
import extras.*
import niveles.*



object personajePrincipal {
    var property position = game.origin()
    var vitalidad = 100
    var property estado = "normal"
    var property direccion = derecha
    
    method vitalidad(){
    	return vitalidad//.min(0)
    }
    
    method chocoConElZombie() {
    	return self.estaEnLaMismaPosicion(zombie)
    }
    
    method chocoConElFantasma() {
    	return self.estaEnLaMismaPosicion(fantasma)
    }
    
	method estaEnLaMeta() {
		return self.estaEnLaMismaPosicion(cueva)
	}
    
    method estaEnLaMismaPosicion(algo) {
		return position == algo.position()
	}
    
    method restarVida(cantidad) {
    	self.validarVida()
    	vitalidad -= cantidad
    }
    
	method image() {
		return "personajePrincipal.png"
	}
	
	method mover(_direccion){
		direccion = _direccion	
		self.irA(_direccion.siguiente(self.position()))
	}
	
	method validarVida(){
		if (self.estaMuerto()) {self.perder()}
	}
	
	method irA(nuevaPosicion){
		position = nuevaPosicion
	}
	
	method entrarACueva() {
		game.say(self, 'LLEGUÉ A LA CUEVA!')
		opcionDeEntrar.text("presione ENTER para entrar");
		keyboard.enter().onPressDo({game.removeVisual(self)})
		game.schedule(2000, {game.stop()})		
	}
	
	method perder() {
		self.terminar()
	}
	
	
	method perdio() {
		return self.estaMuerto()// or contador.seAcaboElTiempo()
	}
	
	method estaMuerto() = vitalidad <= 0
	
	method terminar() {
	
		opcionDeSalir.text("presione ENTER para salir")
		opcionDeReinicio.text("presione ESPACIO para reiniciar")
		game.removeTickEvent("MOVIMIENTOS")
		keyboard.enter().onPressDo({game.stop()})
	}
}

object derecha {
	method siguiente(posicion) {
		return posicion.right(1)
	}
	
}

object arriba {
	method siguiente(posicion) {
		return posicion.up(1)
	}
		
}

object abajo {
	method siguiente(posicion) {
		return posicion.down(1)
	}
		
}

object izquierda{
	method siguiente(posicion) {
		return posicion.left(1)
	}
}

object opcionDeSalir {
	var property position = game.at(5,4)
	var property text = ""
	
	method textColor() = colores.rojo()
}


object opcionDeReinicio {
	var property position = game.at(5,5)
	var property text = ""
	
	method textColor() = colores.verde()
}


object opcionDeEntrar {
	var property position = game.at(5,5)
	var property text = ""
	
	method textColor() {
		colores.cyan()
	} 
}


