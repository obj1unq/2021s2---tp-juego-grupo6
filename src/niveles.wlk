import personajePrincipal.*
import extras.*
import wollok.game.*
import bonus.*

object tutorial {
	method iniciar() {
		game.addVisual(casaEmbrujada)
		game.addVisual(personajePrincipal)
		game.boardGround("silent hill.JPG")
		config.configuracionDeTeclas()
		config.configurarColisiones()
	}
}	
object nivel2 {
	method iniciar(){
		const fantasma = new Fantasma(position = game.at(4,3))
		const puerta = new Puerta (position = game.at(12,12))
		const llave = new Llave (position = game.at(7,9))
		game.addVisual(fantasma)
		game.addVisual(puerta)
		game.addVisual(llave)
		game.addVisual(personajePrincipal)
		game.boardGround("fondo/fondo2.png")
		config.configuracionDeTeclas()
		config.configurarColisiones()
		config.configurarMovimiento(fantasma,200)
	}
	
}
object nivel1{

// TODO: AGREGAR MUSICA
	
	method iniciar(){

	/********** ENEMIGOS DEL NIVEL ********/
		const fantasma = new Fantasma(position = game.at(4,3)) // Esta constante nos da un objeto fantasma.
		const zombie   = new Zombie(position = game.at(2,4))   // Esta constante nos da un objeto zombie.
		const zaramay  = new Fantasma(position = game.at(6,7)) // xd
		const arana1   = new Arana()

		
	/********** VISUALS DEL NIVEL********/
		game.addVisual(cueva2)
		game.addVisual(cueva)
		game.addVisual(personajePrincipal)
		game.addVisual(zombie)
		game.addVisual(fantasma)
		game.addVisual(zaramay)
		game.addVisual(arana1)
		game.boardGround("Fondo/fondo2.png")
		self.addBonus(5000, bonusHp)
		self.addBonus(4000, bonusRegeneracion)

/********** CONFIGURACIONES DEL NIVEL ********/
		config.configuracionDeTeclas()
		config.configurarColisiones()
		config.configurarMovimiento(fantasma, 100)
		config.configurarMovimiento(zombie, 200)
		config.configurarMovimiento(zaramay, 100)
		config.configurarMovimiento(arana1, 700)
	}
	

//TODO: configurar validación de existencia de bonus ▼ ▼ ▼


	method addBonus(tiempo, bonus) {
		const position = bonus.position()
		
		if(game.getObjectsIn(position).isEmpty()) {
			return game.onTick(tiempo, "GenerarBonus", {game.addVisual(bonus)})
		}
		else { return self.emptyPosition() }
	}

}


object config{
	
	method configuracionDeTeclas(){
		keyboard.up().onPressDo({ personajePrincipal.mover(arriba) 		 })
		keyboard.down().onPressDo({ personajePrincipal.mover(abajo)      })
		keyboard.left().onPressDo( { personajePrincipal.mover(izquierda) })
		keyboard.right().onPressDo({ personajePrincipal.mover(derecha)   })
		
		keyboard.w().onPressDo( { personajePrincipal.mover(arriba)    })
		keyboard.a().onPressDo( { personajePrincipal.mover(izquierda) })
		keyboard.s().onPressDo( { personajePrincipal.mover(abajo)  	  })
		keyboard.d().onPressDo( { personajePrincipal.mover(derecha)   })
	}

	method configurarColisiones() {
		game.onCollideDo(personajePrincipal, { cosa => cosa.chocarCon(personajePrincipal)})
	}

	method configurarMovimiento(enemigo, tiempo){
		game.onTick(tiempo, "MOVIMIENTOS", { enemigo.movete() })
	}
}

/********* COLORES ********/

object colores {
	const property verde = "00FF00FF"
	const property rojo = "FF0000FF"
	const property cyan = "00FFFFFF"
}