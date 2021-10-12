import wollok.game.*
import extras.*
import niveles.*

object personajePrincipal {
    var property position = game.origin()
    var property vitalidad = 100
    var property estado = "normal"
    var property direccion = derecha
    
    
    method chocoConElZombie() {
    	return self.estaEnLaMismaPosicion(zombie)
    }
    
    method chocoConElFantasma() {
    	return self.estaEnLaMismaPosicion(fantasma)
    }
    
    method estaEnLaMismaPosicion(algo) {
		return position == algo.position()
	}
    
    method restarVida(cantidad) {
    	vitalidad -= cantidad
    }
    
	method image() {
		return "personajePrincipal.png"
	}
	
	method mover(_direccion){	
		direccion = _direccion	
		self.irA(_direccion.siguiente(self.position()))
	}
	
	method irA(nuevaPosicion){
		position = nuevaPosicion
	}
	
	method ganar() {
		self.terminar()
	}
	
	method perder() {
		self.terminar()
	}
	
	method estaEnLaMeta() {
		self.estaEnLaMismaPosicion(META)
	}
	
	method perdio() {
		return self.estaMuerto() or contador.seAcaboElTiempo()
	}
	
	method estaMuerto() = vitalidad <= 0
	
	method terminar() {
		opcionesFinDeJuego.text("REINICIAR [espacio]")
		opcionesFinDeJuego.text("SALIR [enter]")
		game.removeTickEvent("MOVIMIENTOS")
		keyboard.enter().onPressDo({game.stop()})
		keyboard.space().onPressDo({game.start()})
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

object opcionesFinDeJuego {
	method position() = game.center()
	method text() = ""
	method textColor() = colores.verde()
}

	


