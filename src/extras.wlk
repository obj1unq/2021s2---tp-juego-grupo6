import personajePrincipal.*
import wollok.game.*
import niveles.*
import estados.*

object fantasma {
	var property position = game.at(2,3)
	
	method image() = "CharacterGhost.png"
	
	method chocarCon(personaje) { 
		personaje.estado(asustado)
		personaje.efectoDeEstado()
	}
	
	method movete(){
      if(position.x() < game.width() - 1){
      	position = position.right(1)
      } 
      else {position = position.left(13)}       
	}
}

object zombie {
	var property position = game.at(1,8)
	
	method image() = "CharacterZombi.png"
	
	method chocarCon(personaje) { 
		personaje.estado(infectado)
		personaje.efectoDeEstado()
	}
	
	method movete(){
		if(position.y() < game.height() - 1){
			 position = position.up(1)
		}
		else {position = position.down(11)}
   }
}


object cueva {
	var property position = game.at(13,13)
	
	method image() = "Cueva_clara.PNG"
	
	method chocarCon(personaje){
		 personaje.entrarACueva()
	}	
}









