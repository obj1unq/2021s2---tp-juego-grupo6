import personajePrincipal.*
import extras.*
import wollok.game.*
import bonus.*

// estados negativos.

object asustado {
	 method surtirEfecto(personaje){
	 	game.say(personaje, "QUÉ SUSTO LPM!")
    	personaje.restarVida(50)
    	game.schedule(2800, { personaje.estado(normal) } )
    	}
    	
    method efectoDeBonusHp(personaje){ personaje.regenerarVida(25) } 			
}

object infectado {
	 method surtirEfecto(personaje){
	 	game.onTick(250, "DAÑODEINFECCION", { personaje.restarVida(1) })
	 }
	 
	 method efectoDeBonusHp(personaje){ game.removeTickEvent("DAÑODEINFECCION") }
}

object paralizado { //cuando choca con la araña se paraliza
 	
	method surtirEfecto(personaje) {
		game.schedule(5000, {personaje.estado(normal)})//pasa 5 segundos paralizado, y después vuelve a normalidad
	}
	
	method efectoDeBonusHp(personaje) {}
}


// estados positivos.

object normal {
	
	method surtirEfecto(personaje) {/* POLIMORFISMO */}
	method efectoDeBonusHp(personaje) { personaje.regenerarVida(50) }
}

object regenerando {
	
	method surtirEfecto(personaje) {
		game.onTick(300, "REGENERACION", { personaje.regenerarVida(3) })
		game.schedule(3800, { game.removeTickEvent("REGENERACION"); personaje.estado(normal)})
		
	}

	method efectoDeBonusHp(personaje) {/* POLIMORFISMO */}
}


object muerto {
	method surtirEfecto(personaje)  { game.say(personaje, "memurí") }
	method efectoDeBonusHp(personaje) {/* POLIMORFISMO */}
}








