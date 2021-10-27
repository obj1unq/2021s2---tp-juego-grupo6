import personajePrincipal.*
import extras.*
import wollok.game.*
import bonus.*

object tutorial {
	method iniciar() {
		game.addVisual(casaEmbrujada)
		game.addVisual(personajePrincipal)
		game.boardGround("silent.JPG")
		config.configuracionDeTeclas()
		config.configurarColisiones()
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
	

	method addBonus(tiempo, bonus) {
		game.onTick(tiempo, "GenerarBonus" + bonus, { bonus.aparecer() })	
	}
	
}



object nivel2 {  //HABITACIÓN DE FANTASMAS
	method iniciar(){
		const fantasma1 = new Fantasma(position = game.at(4,3))
		const fantasma2 = new Fantasma(position = game.at(8,11))
		const fantasma3 = new Fantasma(position = game.at(12,7))
		const puerta = new Puerta (position = game.at(12,12))
		const llave = new Llave (position = game.at(7,9))
		
		game.addVisual(fantasma1)
		game.addVisual(fantasma2)
		game.addVisual(fantasma3)
		game.addVisual(puerta)
		game.addVisual(llave)
		game.boardGround("fondo/fondo2.png")
		game.addVisual(personajePrincipal)
		config.configuracionDeTeclas()
		config.configurarColisiones()
		config.configurarMovimiento(fantasma1,200)
		config.configurarMovimiento(fantasma2,400)
		config.configurarMovimiento(fantasma3,300)
	}
	
}


object nivel3 {  //HABITACIÓN DE ARAÑAS
	method iniciar(){
		const arana1 = new Arana 
		const arana2 = new Arana (position = game.at(5,6))
		const arana3 = new Arana (position = game.at(0,3))
		const puerta = new Puerta (position = game.at(12,12))
		const llave = new Llave (position = game.at(7,9))
		
		game.addVisual(arana1)
		game.addVisual(arana2)
		game.addVisual(arana3)
		game.addVisual(puerta)
		game.addVisual(llave)
		//cartel para informar 
		//game.addVisual(cartelInformativo)

		game.boardGround("fondo/fondo2.png")
		game.addVisual(personajePrincipal)
		
		config.configuracionDeTeclas()
		config.configurarColisiones()
		config.configurarMovimiento(arana1,700)
		config.configurarMovimiento(arana2,700)
		config.configurarMovimiento(arana3,00)
	}
	
	method addBonus(tiempo, bonus) {
		game.onTick(tiempo, "GenerarBonus" + bonus, { bonus.aparecer() })	
	}
	
}




object config {
	
	method configuracionDeTeclas(){
		keyboard.up().onPressDo({ personajePrincipal.mover(arriba) 		 })
		keyboard.down().onPressDo({ personajePrincipal.mover(abajo)      })
		keyboard.left().onPressDo( { personajePrincipal.mover(izquierda) })
		keyboard.right().onPressDo({ personajePrincipal.mover(derecha)   })
		
		keyboard.w().onPressDo( { personajePrincipal.mover(arriba)    })
		keyboard.s().onPressDo( { personajePrincipal.mover(abajo)  	  })
		keyboard.a().onPressDo( { personajePrincipal.mover(izquierda) })
		keyboard.d().onPressDo( { personajePrincipal.mover(derecha)   })
		
		//Cuando el personaje toca la 'z' se vuelve en 3seg
		keyboard.z().onPressDo( { personajePrincipal.activarCapaProtectora() })
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





