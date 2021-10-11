import wollok.game.*

object personajePrincipal {
    var property position = game.origin()
    var property vitalidad = 100
    var direccion = derecha
    
	method image() {
	return "personajePrincipal.png"
	}
	
	method mover(_direccion){	
		direccion = _direccion	
		self.irA(_direccion.siguiente(self.position()))
	}
	
	method irA(nuevaPosicion){
		position = nuevaPosicion
	}
}

object derecha {
	method siguiente(posicion) {
		return posicion.right(1)
	}
	
}

object arriba {
	method siguiente(posicion) {
		return posicion.up(1)
	}
		
}

object abajo {
	method siguiente(posicion) {
		return posicion.down(1)
	}
		
}

object izquierda{
	method siguiente(posicion) {
		return posicion.left(1)
	}
}

