import wollok.game.*

object regeneracion {
	
	method reproducir(){
		game.sound("bonus/regenerarVida.mp3").play()
	}
}

object otroSonido {
	method reproducir(){
		game.sound("").play()
	}
}

object otroSonidoMas {
	method reproducir(){
		game.sound("").play()
	}
}

object susto {
	
	method reproducir(){
		game.sound("Fantasma/sustoDeFantasma.mp3").play()
	}
}

object infeccion {
	
	method reproducir(){
		game.sound("Zombie/sustoDeZombie.mp3").play()
	}
}