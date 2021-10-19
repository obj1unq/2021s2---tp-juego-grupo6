import personajePrincipal.*
import extras.*
import wollok.game.*
import bonus.*

// estados negativos.

object asustado {
	 method surtirEfecto(personaje){
	 	game.say(personaje, "QUE SUSTO LPM!")
    	personaje.restarVida(50)
    	game.schedule(2800, { personaje.estado(normal) } )
    	}
    	
    method efectoDeBonusHp(personaje){ } 			
}

object infectado {
	 method surtirEfecto(personaje){
	 	game.say(personaje, "ESTOY INFECTADO!")
	 	game.onTick(250, "DAÑODEINFECCION", { personaje.restarVida(1) })
	 }
	 
	 method efectoDeBonusHp(personaje){ game.removeTickEvent("DAÑODEINFECCION") }
}

 object paralizado {
 	
	method surtirEfecto(personaje) {}
	method efectoDeBonusHp(personaje) {}
}

// estados positivos.

object normal {
	
	method surtirEfecto(personaje){ /* POLIMORFISMO */}
	method efectoDeBonusHp(personaje) { personaje.vitalidad(100) }
}

