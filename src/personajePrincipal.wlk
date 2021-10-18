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
    
/********** CONFIGURACION ********/
	method image() = "principal-derecha.png"
	method irA(nuevaPosicion){ position = nuevaPosicion }
	method estaMuerto() = vitalidad == 0
    method restarVida(cantidad) { self.validarVida() ; vitalidad -= cantidad }
	
/********** VALIDACIONES ********/
	method validarMover() {if (self.estaMuerto()) { self.error("¡Ojalá pudiera!") } }
	method validarVida()  {if (self.estaMuerto()) { self.terminar() } }

/********** ACCIONES **********/

	method mover(_direccion){ 
		self.validarMover() ;
		direccion = _direccion
		self.irA(_direccion.siguiente(self.position()))
	}
	
	method entrarACueva() {
		game.say(self, 'LLEGUÉ A LA CUEVA!')
		game.schedule(650, {game.removeVisual(self)})
		keyboard.enter().onPressDo({game.stop()})
		game.schedule(2000, {opcionDeSalir.text("Presione ENTER para salir")})
	}
	
	method terminar() { 
		game.say(self, 'memurí')
		keyboard.enter().onPressDo({game.stop()})
		game.schedule(2000, {opcionDeSalir.text("Presione ENTER para salir")})
	}
	
/********** COLISIONES ********/
    method estaEnLaMismaPosicion(algo) = position == algo.position()
    
    method chocoConElZombie() = self.estaEnLaMismaPosicion(zombie)
    method chocoConElFantasma() = self.estaEnLaMismaPosicion(fantasma)    
	method chocoConLaCueva() = self.estaEnLaMismaPosicion(cueva)
    
    method aplicarBonusHp(){ estado.efectoDeBonusHp(self) }
    method efectoDeEstado(){ estado.surtirEfecto(self) }

/********** CARTELES ********/
object opcionDeSalir {
	var property position = game.at(7,7)
	var property text = ""
	
	method textColor() = colores.rojo()
	method chocarCon(personaje){ /* POLIMORFISMO */ }
}
