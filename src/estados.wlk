import personajePrincipal.*
import extras.*
import wollok.game.*

// estados negativos.

object asustado {
	 method surtirEfecto(personaje){
	 	game.say(personaje, 'QUE SUSTO LA PTM!')
    	personaje.restarVida(50)
    	}
    	
    method efectoDeBonusHp(personaje){
    	
    } 			
}

object infectado {
	 method surtirEfecto(personaje){
	 	game.say(personaje, 'ESTOY INFECTADO!')
	 	game.onTick(2000, "DAÑODEINFECCION", { personaje.restarVida(5)})
	 }
	 method efectoDeBonusHp(personaje){
	 	game.removeTickEvent("DAÑODEINFECCION") 	
	 }
}

 object paralisis {
	method surtirEfecto(personaje){}
	
	method efectoDeBonusHp(personaje){}
}

// estados positivos.

object normal {
	method surtirEfecto(personaje){}
	
	method efectoDeBonusHp(personaje){
		return personaje.vitalidad() + 100
	}

}

