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
	//if ( self.estaEnBordeEste() ) { self.moverEste() } else { self.irAlBordeOeste() }
	//method estaEnBordeEste() = position.x() < game.width() - 1
	//method moverEste() {position = position.right(1)}
	//method irAlBordeOeste() {position = position.left(game.width() - 1)}
	
	method chocarCon(personaje){
		susto.reproducir()
		personaje.estado(asustado)
		personaje.efectoDeEstado()
	}
	method pasoAleatorio() {
		return if(0.randomUpTo(2) >= 1){1} else{-1}
	}
}

class Zombie {
	var property position
	
	method image() = "Zombie/CharacterZombi.png"
		
	
 	method movete(){
		var nuevaY = position.y() + self.pasoAleatorio()
		nuevaY = nuevaY.max(0).min(game.width() - 1) // esto es para que el Zombie no salga del tablero.
		position = game.at(position.x(),nuevaY)
    }
 
  // method estaEnBordeNorte() = position.y() < game.height() - 1
  // method moverNorte() {position = position.up(1)}
  // method irAlBordeSur() {position = position.down(game.height() - 1)}
   
   method chocarCon(personaje){
   	    infectar.reproducir()
   	    personaje.estado(infectado)
		personaje.efectoDeEstado()
   }
   
   method pasoAleatorio() {
		return if(0.randomUpTo(2) >= 1){1} else{-1}
	}
}


object cueva {
	var property position = game.at(13,13)
	
	method image() {return  "Cueva/CuevaClara.PNG"
					}
	         		//{return if (personajePrincipal.estado == normal) "Cueva/CuevaClara.PNG" 
					//	else "Cueva/CuevaOscura.PNG"
	// TODO: Ver cómo arreglar este código. (parametrizar)
	// Hacer que no se pueda entrar a la cueva cuando está oscura.
	
	method chocarCon(personaje){ personaje.entrarACueva() }
}


class Arana {
	
	var property position = game.at(6,8)
	
	method image() { return "Araña/araña.png"}
	
	method chocarCon(personaje) {}
	
	method movete() {
    	const x = 0.randomUpTo(game.width()).truncate(0)
    	const y = 0.randomUpTo(game.height()).truncate(0)
    
    	position = game.at(x,y)
    
	}
	
}






