import personajePrincipal.*
import wollok.game.*
import niveles.*

object fantasma {
	var property position = game.at(2,3)
	
	method image() { return "CharacterGhost.png"}
	
	method chocarCon(personaje) { 
		personaje.estado("Asustado")
		personaje.restarVida(50)
	}
	
	method movete(){
      if(position.x() < game.width() - 1){
      	position = position.right(1)
      } 
      else {position = position.left(9)}       
	}
}

object zombie {
	var property position = game.at(1,8)
	
	method image() { return "CharacterZombi.png"}
	
	method chocarCon(personaje) { 
		personaje.estado("Infectado")
		game.onTick(2000, "DAÑODEINFECCION", { personaje.restarVida(5) })
	}
	
	method movete(){
		if(position.y() < game.height() - 1){
			 position = position.up(1)
		}
		else {position = position.down(9)}
   }
}


object cueva {
	var property position = game.at(6,8)
	
	method image() = "cueva.PNG"
	
	method chocarCon(personaje){
		 personaje.entrarACueva()
	}	
}









