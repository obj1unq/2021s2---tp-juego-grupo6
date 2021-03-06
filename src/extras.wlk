import personajePrincipal.*
import wollok.game.*
import niveles.*
import estados.*
import sonidos.*
import puertasYLlaves.*

class Fantasma {
	var property position
	const property image = "Fantasma/CharacterGhost.png"
	
	method movete(){
   	  	var nuevaX = position.x() + self.pasoAleatorio()
   	  
   	    nuevaX = nuevaX.max(0).min(game.height() - 1) // esto es para que el fantasma no salga del tablero.
   	    position = game.at(nuevaX,position.y())
	}
	
	method chocarCon(personaje){
		if(!personaje.tieneCapaProtectora()) {
			susto.reproducir()
			personaje.estado(asustado)
			personaje.efectoDeEstado()
		}
	}
	
	method pasoAleatorio() = if ( 0.randomUpTo(3) >= 1 ) 1 else -1
}

class Zombie {
	var property position
	const property image = "Zombie/CharacterZombi.png"
		
 	method movete(){
		var nuevaY = position.y() + self.pasoAleatorio()
		
		nuevaY = nuevaY.max(0).min(game.width() - 1) // esto es para que el Zombie no salga del tablero.
		position = game.at(position.x(),nuevaY)
    }
  
   method chocarCon(personaje){
   		if(!personaje.tieneCapaProtectora()){
  	    	infeccion.reproducir()
   	    	personaje.estado(infectado)
			personaje.efectoDeEstado()
   		}
	}
   
   method pasoAleatorio() = if ( 0.randomUpTo(2) >= 1 ) 1 else -1
}

class Arana {
	
	var property position = game.at(6,8)
	const property image = "Araña/araña.png"
	
	method chocarCon(personaje) {
		if(!personaje.tieneCapaProtectora()) {
			personaje.estado(paralizado)
			personaje.efectoDeEstado()
			//personaje.efectoASufrir(estado)
		}
	}
	
	method movete() {
    	const x = 0.randomUpTo(game.width()).truncate(0)
    	const y = 0.randomUpTo(game.height()).truncate(0)
    
    	position = game.at(x,y)
		}
}

object casaEmbrujada {

	const property position = game.at(10,5)
	const property image = "Casa/CASA EMBRUJADA.png"
	
	method chocarCon(personaje){
		self.irASalaPrincipal()
	}
	
	method irASalaPrincipal(){
		game.clear()
		salonDeLaCasa.iniciar()
	}
}

object visual1 {
	const property position = game.origin()
	const property image = "Fondo/FondoHabitacion.jpg"
	
	method chocarCon(personaje){}
}

object visualSalon {
	const property position = game.origin()
	const property image = "Fondo/fondoSalon.jpg"
	
	method chocarCon(personaje){}
	
	
}

object visualInicio {
	const property position = game.origin()
	const property image = "Fondo/fondo3.png"
	
	method chocarCon(personaje){}
}

object visualPresentacion{
	const property position = game.origin()
	const property image = "Fondo/ricky's.png"
	
	method chocarCon(personaje){}
	
	method reproducir(){
		game.sound("Fondo/musicaInicial.mp3").play()
	}
}
object visualArania {
   const property position = game.origin()
   const property image = "Fondo/back_cave.png"
   
   method chocarCon(personaje){}
}



