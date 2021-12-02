import wollok.game.*
import extras.*
import niveles.*
import estados.*

/********** MOVIMIENTOS ********/
object arriba   { method siguiente(posicion) = posicion.up(1)	 }
object abajo    { method siguiente(posicion) = posicion.down(1)  }
object izquierda{ method siguiente(posicion) = posicion.left(1)  }
object derecha  { method siguiente(posicion) = posicion.right(1) }

object personajePrincipal {
    var property position
    var property vitalidad = 100
	var property estado = normal
    var property direccion = derecha
    var property llavesEncontradas = #{}
	var property tieneCapaProtectora = false
	
    method image() = "Personaje/Ricky-" + estado.toString() + direccion.toString() + ".png"
    
/********** CONFIGURACION ********/   
	method irA(nuevaPosicion){ position = nuevaPosicion }
	method estaMuerto() = vitalidad <= 0
    method restarVida(cantidad) { self.validarVida() ; vitalidad -= cantidad }
    method regenerarVida(cantidad) { vitalidad += cantidad }
    
    method activarCapaProtectora() {
    	self.tieneCapaProtectora(true)
    	game.say(self, "¡SOY INVENCIBLE!")
    	game.schedule(3000, {self.tieneCapaProtectora(false)})
    }
    
	method estaParalizado() { return estado == paralizado }

	
/********** VALIDACIONES ********/
	method validarMover() {if (self.estaMuerto() or self.estaParalizado()) { self.error("¡Ojalá pudiera!") } }
	method validarVida()  {if (self.estaMuerto()) { self.terminar() } }
	method tieneLaLlave(llave) {if (!llavesEncontradas.contains(llave)){self.error("No tengo la llave!")}}	

/********** ACCIONES **********/
	method mover(_direccion){ 
		self.validarMover() ;
		direccion = _direccion
		self.irA(_direccion.siguiente(self.position()))
	}
	
	method terminar() { 
		game.stop()
	}
	
	method agregarLlave(llave){
		llavesEncontradas.add(llave)
		game.removeVisual(llave)
	}
    
/********** BONUS ********/
    method aplicarBonusHp(){ estado.efectoDeBonusHp(self) }
	method efectoDeEstado(){ estado.surtirEfecto(self) }
}
