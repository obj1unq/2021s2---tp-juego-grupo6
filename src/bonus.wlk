import estados.*
import extras.*
import niveles.*
import personajePrincipal.*
import wollok.game.*
import sonidos.*

object bonusHp {
	var property position = game.at(5,7)
	
	method image() = "Bonus/bonusHP.png"
	
	method chocarCon(personaje){
		personaje.aplicarBonusHp()
		personaje.estado(normal)
		game.removeVisual(self)
	}
}

object bonusRegeneracion {
	var property position = game.at(7,9)
	
	method image() = "pepita.png" //Cambiar pepita por un bonus
	
	method chocarCon(personaje) {
		regeneracion.reproducir()
		personaje.estado(regenerando)
		personaje.efectoDeEstado()
		game.removeVisual(self)
	}
}

// TODO: Agregar diferentes tipos de bonus.