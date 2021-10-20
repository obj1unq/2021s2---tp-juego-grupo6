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
    	
    method efectoDeBonusHp(personaje){ personaje.regenerarVida(25) } 			
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
	
	method surtirEfecto(personaje) {/* POLIMORFISMO */}
	method efectoDeBonusHp(personaje) { personaje.regenerarVida(50) }
}

object regenerando {
	
	method surtirEfecto(personaje) {
		game.say(personaje, "ME ESTOY REGENERANDO")
		game.onTick(300, "REGENERACION", { personaje.regenerarVida(3) })
		game.schedule(3800, { game.removeTickEvent("REGENERACION"); personaje.estado(normal)})
		
	}

	method efectoBonusHp(personaje) {/* POLIMORFISMO */}
}

object inquebrantable { 	
	// TODO: hacer que no pueda ser afectado durante este estado.
	method surtirEfecto(personaje)  {}
	method efectoBonusHp(personaje) {}
}


