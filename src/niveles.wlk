import personajePrincipal.*
import extras.*
import wollok.game.*
import bonus.*

object nivel1{

// TODO: AGREGAR MUSICA
	
	method iniciar(){
	/********** ENEMIGOS DEL NIVEL ********/
		const fantasma = new Fantasma(position = game.at(4,3)) // Esta constante nos da un objeto fantasma.
		const zombie   = new Zombie(position = game.at(2,4))   // Esta constante nos da un objeto zombie.
		const zaramay  = new Fantasma(position = game.at(6,7)) // xd
		const arana1   = new Arana()
		
	/********** VISUALS DEL NIVEL********/
		game.addVisual(cueva)
		game.addVisual(personajePrincipal)
		game.addVisual(zombie)
		game.addVisual(fantasma)
		game.addVisual(zaramay)
		game.addVisual(arana1)
		game.onTick(5000, "GenerarBonus", {game.addVisual(bonusHp)} )
		game.onTick(5000, "GenerarBonus2", {game.addVisual(bonusRegeneracion)})

// TODO:game.addVisual(contador) // HACER DINÁMICO
// TODO:game.addVisual(opcionDeReinicio)
		game.addVisual(opcionDeSalir)
		
/********** CONFIGURACIONES DEL NIVEL ********/
		config.configuracionDeTeclas()
		config.configurarColisiones()
		config.configurarMovimiento(fantasma, 100)
		config.configurarMovimiento(zombie, 200)
		config.configurarMovimiento(zaramay, 100)
		config.configurarMovimiento(arana1, 700)
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
	
	method configurarMovimiento(enemigo, tiempo){
		game.onTick(tiempo, "MOVIMIENTOS", {enemigo.movete()} )
	
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