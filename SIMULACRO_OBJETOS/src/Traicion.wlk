class Traicion {
	const familiaObjetivo
	const nuevaFamilia
	const victimas = #{}
	var fechaEstimada
	
	method agregarVictima(unaVictima){
		victimas.add(unaVictima)
	}
	method adelantar(otraVictima, unosDias){
		self.agregarVictima(otraVictima)
		fechaEstimada.minusDays(unosDias)
	}
	method ejecutar(traidor){
		if(familiaObjetivo.resisteAtaque(traidor)){
			familiaObjetivo.ajusticiar(traidor)
		}else{
			familiaObjetivo.sacarIntegrante(traidor)
			victimas.forEach{unaVictima => traidor.hacerSuTrabajo(unaVictima)}
			nuevaFamilia.nuevoIntegrante(traidor)
		}
	}
}
