import pepita.*
import wollok.game.*

object fantasma {
	var property position = game.at(2,3)
	
	method image() { return "CharacterGhost.png"}
	
}

object zombie {
	var property position = game.at(1,8)
	
	method image() { return "CharacterZombi.png"}
}