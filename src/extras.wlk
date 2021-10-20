import personajePrincipal.*
import wollok.game.*
import niveles.*
import estados.*

class Fantasma {
	var property position
	
	method image() = "Fantasma/CharacterGhost.png"
	
	method movete(){
   	  if ( self.estaEnBordeEste() ) { self.moverEste() } else { self.irAlBordeOeste() }
	}
	
	method estaEnBordeEste() = position.x() < game.width() - 1
	method moverEste() {position = position.right(1)}
	method irAlBordeOeste() {position = position.left(game.width() - 1)}
	
	method chocarCon(personaje){
		personaje.estado(asustado)
		personaje.efectoDeEstado()
	}
}

class Zombie {
	var property position
	
	method image() = "Zombie/CharacterZombi.png"
		
	
 	method movete(){
		  if ( self.estaEnBordeNorte() ){ self.moverNorte() }
		else { self.irAlBordeSur() }
    }
 
   method estaEnBordeNorte() = position.y() < game.height() - 1
   method moverNorte() {position = position.up(1)}
   method irAlBordeSur() {position = position.down(game.height() - 1)}
   
   method chocarCon(personaje){
   	    personaje.estado(infectado)
		personaje.efectoDeEstado()
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






