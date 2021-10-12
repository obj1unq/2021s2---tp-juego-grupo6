import pepita.*
import extras.*
import wollok.game.*

object nivel1{
	
	
	method iniciar(){
		game.addVisual(personajePrincipal)
		game.addVisual(fantasma)
		game.addVisual(zombie)
		game.addVisual(contador) // HACER DINÁMICO
		game.addVisual(opcionesFinDeJuego)
		config.configuracionDeTeclas()
		config.configurarColisiones()
		config.configurarMovimientosEnemigos()
	}
}

object config{
	
	method configuracionDeTeclas(){
		keyboard.left().onPressDo( { personajePrincipal.mover(izquierda)  })
		keyboard.right().onPressDo({ personajePrincipal.mover(derecha) })
		keyboard.up().onPressDo({ personajePrincipal.mover(arriba) })
		keyboard.down().onPressDo({ personajePrincipal.mover(abajo) })
	}
	
	method configurarColisiones() {
		game.onCollideDo(personajePrincipal, { cosa => cosa.chocarCon(personajePrincipal)})
	}	
	
	method configurarMovimientosEnemigos(){
		game.onTick(500, "MOVIMIENTOS", {fantasma.movete()} )
		game.onTick(500, "MOVIMIENTOS", {zombie.movete()} )
	}

}

object colores {
	const property verde = "00FF00FF"
	const property rojo = "FF0000FF"
	const property cyan = "00FFFFFF"
}

object contador {
	const contador = "120"
	
	method position() = game.at(9,9)
	method text() = contador
	method textColor() = colores.cyan()
	
	method seAcaboElTiempo () {
		return contador == 0
	}
}
