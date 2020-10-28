class Arma{
	
	method atacarA(unaPersona){
		if(self.condicion()){
			self.consecuenciaAtaque(unaPersona)
		}
	}
	
	method condicion()
	method consecuenciaAtaque(unaPersona){
		unaPersona.morir()
		}
}

class Revolver inherits Arma{
	var balas = 6
	
	method balas(){
		return balas
	}
	
	method recargar(){
		balas = 6
	}
	
	override method condicion(){
		return self.balas() > 0
	}
	
	override method consecuenciaAtaque(unaPersona){
		super(unaPersona)
		balas = self.balas() - 1
	}
	
	method esSutil(){
		return balas == 1
	}
}

class Escopeta{
	
	method atacarA(unaPersona){
		if(unaPersona.herida()){
			unaPersona.morir()
		}else{
			unaPersona.herir()
		}
	}
	
	method esSutil(){
		return false
	}
}

class CuerdaDePiano inherits Arma{
	const buenaCalidad
	
	override method condicion(){
		return buenaCalidad
	}
	
	method esSutil(){
		return true
	}
}
