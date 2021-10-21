import personajePrincipal.*
import wollok.game.*
import niveles.*
import estados.*
import sonidos.*

class Fantasma {
	var property position
	
	method image() = "Fantasma/CharacterGhost.png"
	
	method movete(){
   	  	var nuevaX = position.x() + self.pasoAleatorio()
   	  
   	     nuevaX = nuevaX.max(0).min(game.height() - 1) // esto es para que el fantasma no salga del tablero.
   	     position = game.at(nuevaX,position.y())
   	  
	}
	
	method chocarCon(personaje){
		susto.reproducir()
		personaje.estado(asustado)
		personaje.efectoDeEstado()
	}
	
	method pasoAleatorio() = if ( 0.randomUpTo(2) >= 1 ) 1 else -1
}

class Zombie {
	var property position
	
	method image() = "Zombie/CharacterZombi.png"
		
	
 	method movete(){
		var nuevaY = position.y() + self.pasoAleatorio()
		
		nuevaY = nuevaY.max(0).min(game.width() - 1) // esto es para que el Zombie no salga del tablero.
		position = game.at(position.x(),nuevaY)
    }
  
   method chocarCon(personaje){
   	    infeccion.reproducir()
   	    personaje.estado(infectado)
		personaje.efectoDeEstado()
   }
   
   method pasoAleatorio() = if ( 0.randomUpTo(2) >= 1 ) 1 else -1
}


object cueva {
	var property position = game.at(13,13)
	
	method image() ="Cueva/CuevaClara.PNG"
	method chocarCon(personaje){ personaje.entrarACueva() }
}


class Arana {
	
	var property position = game.at(6,8)
	
	method image() = "Araña/araña.png"
	
	method chocarCon(personaje) {}
	
	method movete() {
    	const x = 0.randomUpTo(game.width()).truncate(0)
    	const y = 0.randomUpTo(game.height()).truncate(0)
    
    	position = game.at(x,y)
	}
}






