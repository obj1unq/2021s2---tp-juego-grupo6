import pepita.*
import extras.*
import wollok.game.*

object nivel1{
	method iniciar(){
	game.addVisual(personajePrincipal)
	game.addVisual(fantasma)
	game.addVisual(zombie)
	config.configuracionDeTeclas()
}
}

object config{
	
	method configuracionDeTeclas(){
		keyboard.left().onPressDo( { personajePrincipal.mover(izquierda)  })
		keyboard.right().onPressDo({ personajePrincipal.mover(derecha) })
		keyboard.up().onPressDo({ personajePrincipal.mover(arriba) })
		keyboard.down().onPressDo({ personajePrincipal.mover(abajo) })
	}
}