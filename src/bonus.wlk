import estados.*
import extras.*
import niveles.*
import personajePrincipal.*
import wollok.game.*
import sonidos.*

class Bonus {
	
	method aparecer(){
	
		if(game.getObjectsIn(self.position()).isEmpty() and !game.hasVisual(self))
			{ game.addVisual(self) }
	}
	
	method position()
}

object bonusHp inherits Bonus {
	var property position = game.at(5,7)
	
	method image() = "Bonus/bonusHP.png"
	
	method chocarCon(personaje){
		personaje.aplicarBonusHp()
		personaje.estado(normal)
		game.removeVisual(self)
	}
}

object bonusRegeneracion inherits Bonus {
	var property position = game.at(7,9)
	
	method image() = "pepita.png" // Cambiar pepita por un bonus
	
	method chocarCon(personaje) {
		regeneracion.reproducir()
		personaje.estado(regenerando)
		personaje.efectoDeEstado()
		game.removeVisual(self)
	}
}

// TODO: Agregar diferentes tipos de bonus.

// TODO: Aplicar aparición aleatoria.