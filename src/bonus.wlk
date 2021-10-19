import estados.*
import extras.*
import niveles.*
import personajePrincipal.*
import wollok.game.*


object bonusHp {
	var property position = game.at(5,7)
	
	method image() = "Bonus/bonusHP.png"
	
	method chocarCon(personaje){
		personaje.aplicarBonusHp()
		personaje.estado(normal)
	}
}