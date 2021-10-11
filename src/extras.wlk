import pepita.*
import wollok.game.*

object fantasma {
	var property position = game.at(2,3)
	
	method image() { return "CharacterGhost.png"}
	
	method chocarCon(personaje) { 
		personaje.estado("Asustado")
		personaje.restarVida(50)
	}
	
}

object zombie {
	var property position = game.at(1,8)
	
	method image() { return "CharacterZombi.png"}
	
	method chocarCon(personaje) { 
		personaje.estado("Infectado")
		game.onTick(1000, "DAÑODEINFECCION", { personaje.restarVida(5) })
	}
}