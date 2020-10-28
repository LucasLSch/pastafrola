import Armas.*
import Rangos.*
import Traicion.*

class Persona {
	var familia
	var lealtad
	const armas = [new Revolver()]
	var herido = false
	var estaVivo = true
	var rango
	var traicion
	
	method nuevaFamilia(nuevaFamilia){
		familia = nuevaFamilia
	}
	method lealtad(){
		return lealtad
	}
	method multiplicarLealtad(unValor){
		lealtad = (self.lealtad() * unValor).min(100)
	}
	method restarLealtad(unValor){
		lealtad = (self.lealtad() - unValor).max(0)
	}
	method armas(){
		return armas
	}
	method agregarArma(unArma){
		armas.add(unArma)
	}
	method removerArma(unArma){
		armas.remove(unArma)
	}
	method hacerSuTrabajo(unaPersona){
		rango.atacarA(unaPersona)
	}
	method herir(){
		herido = true
	}
	method curarse(){
		herido = false
	}
	method herida(){
		return herido
	}
	method morir(){
		estaVivo = false
	}
	method durmiendoConLosPeces(){
		return !estaVivo
	}
	method asignarRango(unRango){
		rango = unRango
		rango.asignarseA(self)
	}
	method tipoRango(){
		return rango.rango()
	}
	method elegancia(){
		return rango.esElegante()
	}
	method tieneArmaSutil(){
		return armas.any{unArma => unArma.esSutil()}
	}
	method promocionable(){
		return self.tipoRango() == "solado" and armas.size() >= 5
	}
	method sucesor(){
		return rango.sucesor()
	}
	method iniciarTraicion(proximaFamilia, victimaInicial, fechaTentativa){
		traicion = new Traicion(familiaObjetivo = familia, 
								nuevaFamilia = proximaFamilia, 
								fechaEstimada = fechaTentativa
		)
		traicion.agregarVictima(victimaInicial)
	}
	method adelantarTraicion(otraVictima,unosDias){
		traicion.adelantar(otraVictima,unosDias)
	}
	method ejecutarTraicion(){
		traicion.ejecutar(self)
	}
}
