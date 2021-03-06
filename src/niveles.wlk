import personajePrincipal.*
import extras.*
import wollok.game.*
import bonus.*
import puertasYLlaves.*
import sonidos.*

/************* NIVELES ************/
object presentacion { 
	
	method iniciar(){
		game.addVisual(visualPresentacion)
		game.boardGround("Fondo/fondo3.png")
		config.configuracionPresentacion()
}
	
	
}
object intro {
	method iniciar() {
		game.addVisual(visualInicio)
		game.addVisual(casaEmbrujada)
		game.addVisual(personajePrincipal)
		config.configuracionDeTeclas()
		config.configurarColisiones()
		config.posicionInicial(personajePrincipal,game.origin())
		game.showAttributes(personajePrincipal)
	}
}	

object salonDeLaCasa {

	method iniciar(){
		const puerta1 = new PuertaZombie (position = game.at(1,6))
		const puerta2 = new PuertaFantasma (position = game.at(6,6))
		const puerta3 = new PuertaArania (position = game.at(11,6))
		
		game.addVisual(visualSalon)
		game.addVisual(puerta1)
		game.addVisual(puerta2)
		game.addVisual(puerta3)
		game.addVisual(personajePrincipal)
		
		config.configuracionDeTeclas()
		config.configurarColisiones()
		config.posicionInicial(personajePrincipal,game.origin())
	}
}

object nivel1{ 
				// HABITACIÓN DE ZOMBIES
	method iniciar(){
		const zombie1 = new Zombie(position = game.at(2,4))
		const zombie2 = new Zombie(position = game.at(4,4)) 
		const zombie3 = new Zombie(position = game.at(7,4)) 
		const zombie4 = new Zombie(position = game.at(11,4))    
		const puerta  = new PuertaSalon (position = game.origin())

	    game.addVisual(visual1)
	    game.addVisual(puerta)
		game.addVisual(llaveFantasma)
		game.addVisual(zombie1)
		game.addVisual(zombie2)
		game.addVisual(zombie3)
		game.addVisual(zombie4)
		game.addVisual(personajePrincipal)
		game.showAttributes(personajePrincipal)
		
		config.configuracionDeTeclas()
		config.configurarColisiones()
		config.posicionInicial(personajePrincipal,game.at(1,0))
		config.configurarMovimiento(zombie1, 100)
		config.configurarMovimiento(zombie2, 200)
		config.configurarMovimiento(zombie3, 400)
		config.configurarMovimiento(zombie4, 700)
		self.agregarBonus(5000, bonusHp)
	}
	
	method agregarBonus(tiempo, bonus) {
		game.onTick(tiempo, "GenerarBonus" + bonus, { bonus.aparecer() })	
	}
}



object nivel2 {  
				// HABITACIÓN DE FANTASMAS
	method iniciar(){
		const fantasma1 = new Fantasma(position = game.at(4,3))
		const fantasma2 = new Fantasma(position = game.at(8,11))
		const fantasma3 = new Fantasma(position = game.at(12,7))
		const puerta    = new PuertaSalon (position = game.origin())
		
		game.addVisual(visual1)
		game.addVisual(fantasma1)
		game.addVisual(fantasma2)
		game.addVisual(fantasma3)
		game.addVisual(llaveArania)
		game.addVisual(puerta)
		game.addVisual(personajePrincipal)
		game.showAttributes(personajePrincipal)
		
		config.configuracionDeTeclas()
		config.configurarColisiones()
		config.posicionInicial(personajePrincipal,game.at(1,0))
		config.configurarMovimiento(fantasma1,200)
		config.configurarMovimiento(fantasma2,400)
		config.configurarMovimiento(fantasma3,300)
		self.agregarBonus(3000, bonusRegeneracion)
	}
	
	method agregarBonus(tiempo, bonus) {
		game.onTick(tiempo, "GenerarBonus" + bonus.toString(), { bonus.aparecer() })	
	}
}


object nivel3 {
				//HABITACIÓN DE ARAÑAS
	method iniciar(){
		const arana1 = new Arana
		const arana2 = new Arana (position = game.at(5,6))
		const arana3 = new Arana (position = game.at(0,3))
		const puerta = new PuertaSalon (position = game.origin())
		const puertaFinal = new Puerta(position = game.at(12,12), estaAbierta = true)
		
		game.addVisual(visualArania)
		game.addVisual(personajePrincipal)
		game.addVisual(arana1)
		game.addVisual(arana2)
		game.addVisual(arana3)
		game.addVisual(puerta)
		game.showAttributes(personajePrincipal)
		game.addVisual(puertaFinal)
		
		
		config.configuracionDeTeclas()
		config.configurarColisiones()
		config.posicionInicial(personajePrincipal,game.at(1,0))
		config.configurarMovimiento(arana1,700)
		config.configurarMovimiento(arana2,700)
		config.configurarMovimiento(arana3,700)
		self.agregarBonus(3000, bonusRegeneracion)
		self.agregarBonus(5000, bonusHp)
	}
	
	method agregarBonus(tiempo, bonus) {
		game.onTick(tiempo, "GenerarBonus" + bonus, { bonus.aparecer() })	
	}
}

/************* CONFIGURACIÓN ************/

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
	
		keyboard.z().onPressDo( { personajePrincipal.activarCapaProtectora() })
	}

	method configurarColisiones() {
		game.onCollideDo(personajePrincipal, { cosa => cosa.chocarCon(personajePrincipal)})
	}

	method configurarMovimiento(enemigo, tiempo){
		game.onTick(tiempo, "MOVIMIENTOS", { enemigo.movete() })
	}
	
	method posicionInicial(objeto,posicion){
		objeto.position(posicion)
	}
	
	method configuracionPresentacion(){
		keyboard.enter().onPressDo({ intro.iniciar() })
		keyboard.space().onPressDo({ visualPresentacion.reproducir() })
	}
}

/********* COLORES ********/

object colores {
	const property verde = "00FF00FF"
	const property rojo = "FF0000FF"
	const property cyan = "00FFFFFF"
}





