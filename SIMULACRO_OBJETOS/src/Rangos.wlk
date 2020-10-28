import Armas.*

class Rango{
	
	method asignarseA(unaPersona){
	}
	
	method rango()	
	method esElegante()
}

class Don inherits Rango{
	const subordinados = #{}
	
	method nuevoSubordinado(unaPersona){
		subordinados.add(unaPersona)
	}
	
	method atacarA(unaPersona){
		const atacante = subordinados.anyOne()
		atacante.atacarA(unaPersona)
		atacante.atacarA(unaPersona)
	}
	
	override method rango(){
		return "don"
	}
	
	override method esElegante(){
		return true
	}
	
	method subordinadosElegantes(){
		return subordinados.filter{unSubordinado => unSubordinado.esElegante()}
	}
	method sucesor(){
		return self.subordinadosElegantes().max{unSubordinado => unSubordinado.lealtad()}
	}
}

class Subjefe inherits Rango{
	const usuario
	const subordinados = #{}
	
	method atacarA(unaPersona){
		const unArma = usuario.armas().head()
		usuario.removerArma(unArma)
		unArma.atacarA(unaPersona)
		usuario.agregarArma(unArma)
	}
	
	method nuevoSubordinado(unaPersona){
		subordinados.add(unaPersona)
	}
	
	override method esElegante(){
		subordinados.any{unaPersona => unaPersona.tieneArmaSutil()}
	}
	
	override method rango(){
		return "subjefe"
	}
}

class Soldado inherits Rango{
	const usuario
	
	method atacarA(unaPersona){
		const primerArma = (usuario.armas()).head()
		primerArma.atacarA(unaPersona)
	}
	
	override method asignarseA(unaPersona){
		unaPersona.agregarArma(new Escopeta())
		super(unaPersona)
	}
	
	override method esElegante(){
		return usuario.tieneArmaSutil()
	}
	
	override method rango(){
		return "soldado"
	}
}