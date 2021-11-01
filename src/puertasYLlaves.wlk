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
	
	method chocarCon(personaje) { personaje.abrirPuerta(self) }
	
	method fueAbierta() { estaAbierta = true }
	
}
class PuertaSalon inherits Puerta{

	override method image() { return if(!estaAbierta) { "Puertas/puertaCerrada2.png" } else { "Puertas/puertaAbierta.png" }}
	override method chocarCon(personaje){ self.irASalaPrincipal() }

	method irASalaPrincipal(){
		game.clear()
		salonDeLaCasa.iniciar()
	}
}
class PuertaNivel1 inherits Puerta{
	 
	 override method chocarCon(personaje){
	// 	personaje.validarLlave(self)
	 	self.irANivel1()
	 }
	 
	 method irANivel1(){
	 	game.clear()
	 	nivel1.iniciar()
	 }	
}

class PuertaNivel2 inherits Puerta{
	 
	 override method chocarCon(personaje){
	 //	personaje.validarLlave(self)
	 	self.irANivel2()
	 }
	 
	 method irANivel2(){
	 	game.clear()
	 	nivel2.iniciar()
	 }
}

class PuertaNivel3 inherits Puerta{
	 
	 override method chocarCon(personaje){
	 //	personaje.validarLlave(self)
	 	self.irANivel3()
	 }
	 
	 method irANivel3(){
	 	game.clear()
	 	nivel3.iniciar()
	 }
}