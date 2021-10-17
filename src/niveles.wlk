import personajePrincipal.*
import extras.*
import wollok.game.*

object nivel1{
	
	method iniciar(){
		game.addVisual(cueva)
		game.addVisual(fantasma)
		game.addVisual(zombie)
		game.addVisual(personajePrincipal)
		game.addVisual(bonusHp)
    //	game.addVisual(contador) // HACER DINÁMICO
	//	game.addVisual(opcionDeReinicio)
		game.addVisual(opcionDeSalir)
		config.configuracionDeTeclas()
		config.configurarColisiones()
		config.configurarMovimientosEnemigos()
	}
	
	method reiniciar(){
		game.clear()
		self.iniciar()
	}
}

object config{
	
	method configuracionDeTeclas(){
		keyboard.left().onPressDo( { personajePrincipal.mover(izquierda)  })
		keyboard.right().onPressDo({ personajePrincipal.mover(derecha) })
		keyboard.up().onPressDo({ personajePrincipal.mover(arriba) })
		keyboard.down().onPressDo({ personajePrincipal.mover(abajo) })
		keyboard.r().onPressDo({ nivel1.reiniciar() })
	}
	
	method configurarColisiones() {
		game.onCollideDo(personajePrincipal, { cosa => cosa.chocarCon(personajePrincipal)})
	}	
	
	method configurarMovimientosEnemigos(){
		game.onTick(100, "MOVIMIENTOS", {fantasma.movete()} )
		game.onTick(350, "MOVIMIENTOS", {zombie.movete()} )
	}

}

object colores {
	const property verde = "00FF00FF"
	const property rojo = "FF0000FF"
	const property cyan = "00FFFFFF"
}

//object contador {
//	const valor = 30
//	
//	method position() = game.at(9,9)
//	method text() = valor
//	method textColor() = colores.cyan()
//	
//	method seAcaboElTiempo () {
//		return contador == 0
//	}
//}
