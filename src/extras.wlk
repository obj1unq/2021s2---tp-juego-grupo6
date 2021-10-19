import personajePrincipal.*
import wollok.game.*
import niveles.*
import estados.*

class Fantasma {
	var property position
	
	method image() = "Fantasma/CharacterGhost.png"
	
	method movete(){
      if(position.x() < game.width() - 1){
      	position = position.right(1)
      } 
      else {position = position.left(13)}       
	}
	
	method chocarCon(personaje){
		personaje.estado(asustado)
		personaje.efectoDeEstado()
	}
}

class Zombie {
	var property position = game.at(1,8)
	
	method image() = "Zombie/CharacterZombi.png"
		
	method movete(){
		if(position.y() < game.height() - 1){
			 position = position.up(1)
		}
		else {position = position.down(11)}
   }
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









