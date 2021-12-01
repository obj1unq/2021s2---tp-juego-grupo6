import personajePrincipal.*
import niveles.*
import extras.*
import wollok.game.*

class Llave {
	const property position
	const property image = "Llaves/Llave1.png"
	
	
	method chocarCon(personaje){personaje.agregarLlave(self)}
	
}

class Puerta{
	const property position
	var property estaAbierta = false
	var property image = if(!estaAbierta) { "Puertas/puertaCerrada1.png" } else { "Puertas/puertaAbierta.png" }
	
	method chocarCon(personaje) { personaje.terminar() }
	
}
class PuertaSalon inherits Puerta{

	override method image() { return if(!estaAbierta) { "Puertas/puertaCerrada2.png" } else { "Puertas/puertaAbierta.png" }}
	override method chocarCon(personaje){ self.irASalaPrincipal() }

	method irASalaPrincipal(){
		game.clear()
		salonDeLaCasa.iniciar()
	}
}
class PuertaZombie inherits Puerta{
	 
	 override method chocarCon(personaje){
	 	self.irANivel1()
	 }
	 
	 method irANivel1(){
	 	game.clear()
	 	nivel1.iniciar()
	 }	
}

class PuertaFantasma inherits Puerta{
	 const llaveQueLaAbre = llaveFantasma
	 
	 override method chocarCon(personaje){
	 personaje.tieneLaLlave(llaveQueLaAbre)
	 	self.irANivel2()
	 }
	 
	 method irANivel2(){
	 	game.clear()
	 	nivel2.iniciar()
	 }
}

class PuertaArania inherits Puerta{
	 const llaveQueLaAbre = llaveArania 
	 
	 override method chocarCon(personaje){
	    personaje.tieneLaLlave(llaveQueLaAbre)
	 	self.irANivel3()
	 }
	 
	 method irANivel3(){
	 	game.clear()
	 	nivel3.iniciar()
	 }
}
const llaveFantasma = new Llave(position = game.at(12,14))
const llaveArania = new Llave(position = game.at(11,9))