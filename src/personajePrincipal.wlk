import wollok.game.*
import extras.*
import niveles.*
import estados.*

/********** MOVIMIENTOS ********/
object derecha {
	method siguiente(posicion) = posicion.right(1)	
}

object arriba {
	method siguiente(posicion) = posicion.up(1)		
}

object abajo {
	method siguiente(posicion) = posicion.down(1)
}

object izquierda{
	method siguiente(posicion) = posicion.left(1)
}

object personajePrincipal {
    var property position = game.origin()
    var property vitalidad = 100
	var property estado = normal
    var property direccion = derecha
    var property llavesEncontradas = #{}

    method image() = "Personaje/Ricky-" + estado.toString() + direccion.toString() + ".png"
    
/********** CONFIGURACION ********/   
	method irA(nuevaPosicion){ position = nuevaPosicion }
	method estaMuerto() = vitalidad <= 0
    method restarVida(cantidad) { self.validarVida() ; vitalidad -= cantidad }
    method regenerarVida(cantidad) { vitalidad += cantidad }
	
/********** VALIDACIONES ********/
	method validarMover() {if (self.estaMuerto()) { self.error("¡Ojalá pudiera!") } }
	method validarVida()  {if (self.estaMuerto()) { self.terminar() } }
	method validarSiHayLlave(){if (llavesEncontradas.isEmpty()){self.error("No tengo la llave!")}}

/********** ACCIONES **********/
	method mover(_direccion){ 
		self.validarMover() ;
		direccion = _direccion
		self.irA(_direccion.siguiente(self.position()))
	}
	
	method entrarACueva() {
		game.say(self, 'LLEGUÉ A LA CUEVA!')
		game.schedule(650, {game.removeVisual(self)})
		self.terminar()
	}
	
	method terminar() { 
		game.addVisual(opcionDeSalir)
		keyboard.enter().onPressDo({game.stop()})
		game.schedule(2000, {opcionDeSalir.text("Presione ENTER para salir")})
	}
	
	method agregarLlave(llave){
		llavesEncontradas.add(llave)
		game.removeVisual(llave)
	}
	
	method abrirPuerta(puerta){
		self.validarSiHayLlave()
		puerta.fueAbierta()
	}
	
/********** COLISIONES ********/
    method estaEnLaMismaPosicion(algo) = position == algo.position()
   	method chocoConLaCueva() = self.estaEnLaMismaPosicion(cueva)
    
//	BONUS
    method aplicarBonusHp(){ estado.efectoDeBonusHp(self) }
    method efectoDeEstado(){ estado.surtirEfecto(self) }

}

/********** CARTELES ********/
object opcionDeSalir {
	var property position = game.center()
	var property text = ""
	
	method textColor() = colores.rojo()
}
