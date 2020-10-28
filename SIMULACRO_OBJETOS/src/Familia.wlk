import Personas.*
import Armas.*
import Rangos.*

class Familia {
	var elDon
	const integrantes = #{}
	
	method nuevoIntegrante(unaPersona){
		if(unaPersona.tipoRango() == "don"){
			integrantes.remove(elDon)
			elDon = unaPersona
		}
		integrantes.add(unaPersona)
		unaPersona.nuevaFamilia(self)
	}
	method sacarIntegrante(unaPersona){
		integrantes.remove(unaPersona)
	}
	
	method integrantesVivos(){
		return integrantes.filter{unaPersona => !unaPersona.durmiendoConLosPeces()}
	}
	
	method peligroso(){
		return self.integrantesVivos().max({unaPersona => unaPersona.armas().size()})
	}
	
	method elQueQuieraEstarArmadoQueAndeArmado(){
		integrantes.forEach({unaPersona => unaPersona.agregarArma(new Revolver())})
	}
	
	method ataqueSorpresa(unaFamilia){
		if(!unaFamilia.todosMuertos()){
			const victima = unaFamilia.peligroso()
			self.integrantesVivos().forEach{unaPersona => unaPersona.hacerSuTrabajo(victima)}
		}
	}
	
	method todosMuertos(){
		return self.integrantesVivos().isEmpty()
	}
	
	method soldadosPromocionables(){
		return integrantes.filter{unaPersona => unaPersona.promocionable()}
	}
	
	method luto(){
		self.soldadosPromocionables().forEach{unSoldado => unSoldado.asignarRango(new Subjefe(usuario = unSoldado))}
		elDon = elDon.sucesor()
		self.integrantesVivos().forEach{unaPersona => unaPersona.multiplicarLealtad(1.1)}
	}
	method lealtadPromedio(){
		const lealtadTotal = self.integrantesVivos().sum{unaPersona => unaPersona.lealtad()}
		return lealtadTotal / self.integrantesVivos().size()
	}
	method resisteAtaque(traidor){
		return self.lealtadPromedio() > traidor.lealtad()*2
	}
	method ajusticiar(unaPersona){
		unaPersona.morir()
	}
}
