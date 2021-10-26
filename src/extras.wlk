import personajePrincipal.*
import wollok.game.*
import niveles.*
import estados.*
import sonidos.*

class Fantasma {
	var property position
	const property image = "Fantasma/CharacterGhost.png"
	
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
	const property image = "Zombie/CharacterZombi.png"
		
	
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

class Llave {
	const property position
	const property image = "Llaves/Llave1.png"
	
	
	method chocarCon(personaje){personaje.agregarLlave(self)}
	
}

class Puerta{
	const property position
	var property estaAbierta = false
	
	method image(){return if(!estaAbierta){"Puertas/puertaCerrada1.png"} else {"Puertas/puertaAbierta.png"}}
	
	method chocarCon(personaje){personaje.abrirPuerta(self)}
	
	method fueAbierta(){
		estaAbierta = true
	}
	
}
object cueva {
	var property position = game.at(13,13)
	const property image = "Cueva/CuevaClara.PNG"
	
	method chocarCon(personaje){ personaje.entrarACueva() }
}



object cueva2 {
	
//TODO: Hacer que Ricky aparezca en la posición de la casa!

	var property position = game.origin()
//	const property image = "Cueva/CuevaOscura.PNG"
	
	method chocarCon(personaje){ 
		self.irATutorial()
	}
		
	method irATutorial() { 
		game.clear()
		tutorial.iniciar() 
	}
}

class Arana {
	
	var property position = game.at(6,8)
	const property image = "Araña/araña.png"
	
	method chocarCon(personaje) {
		personaje.estado(paralizado)
		personaje.efectoDeEstado()
	}
	
	method movete() {
    	const x = 0.randomUpTo(game.width()).truncate(0)
    	const y = 0.randomUpTo(game.height()).truncate(0)
    
    	position = game.at(x,y)
	}
}

object casaEmbrujada {
	
//TODO: Hacer que Ricky aparezca en la posición de la (futura) puerta!

	const property position = game.at(1, 8)
	const property image = "Casa/CASA EMBRUJADA.png"
	
	method chocarCon(personaje){
		self.irAnivel1()
	}
	
	method irAnivel1(){
		game.clear()
		//game.addVisual(visual1)
		nivel1.iniciar()
	}
}

object visual1 {
	const property position = game.at(0, 0)
	const property image = "Fondo/Fondo2.png"
	
	method chocarCon(personaje){}
}




