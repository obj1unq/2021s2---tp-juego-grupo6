import pepita.*
import extras.*
import wollok.game.*

object nivel1{
	
	
	method iniciar(){
		game.addVisual(personajePrincipal)
		game.addVisual(fantasma)
		game.addVisual(zombie)
		config.configuracionDeTeclas()
		config.configurarColisiones()
		config.configurarMovimientosEnemigos()
		letrero.text("HOLA")//{game.onTick(1000, "LETRERO", {(self.contador()-1)})})
	}
	

	method contador() {
		return "" // agregar contador con letrero numerico
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

object letrero {
	var contador = "X"
	var property position = game.at(5,5)
	var property text = ""
	
	method textColor() { 
		return "00ffffff"
	}
	
	method seAcaboElTiempo () {
		return contador == 0
	}
		
	method contador() {
		return contador // agregar contador con letrero numerico
	}
}