import personajePrincipal.*
import extras.*
import wollok.game.*
import bonus.*

object nivel1{

// TODO: AGREGAR MUSICA
	
	method iniciar(){
		game.addVisual(cueva)
		game.addVisual(fantasma)
		game.addVisual(zombie)
		game.addVisual(personajePrincipal)
		game.onTick(5000, "GenerarBonus", {game.addVisual(bonusHp)} )
// TODO:game.addVisual(contador) // HACER DINÁMICO
// TODO:game.addVisual(opcionDeReinicio)
		game.addVisual(opcionDeSalir)
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
// TODO:keyboard.r().onPressDo({ nivel1.reiniciar() })
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



/*

// TODO: CONTADOR

object contador {
	const valor = 30
	
	method position() = game.at(9,9)
	method text() = valor
	method textColor() = colores.cyan()
	
	method seAcaboElTiempo () {
		return contador == 0
	}
}

 */