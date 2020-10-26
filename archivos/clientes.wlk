class Cliente {

	method puedeSerAtendido(vendedor)

}

class ClienteInseguro inherits Cliente {

	override method puedeSerAtendido(vendedor){
		return vendedor.esVersatil() && vendedor.esFirme() 
	}
}

class ClienteDetallista inherits Cliente {

	override method puedeSerAtendido(vendedor){
		return vendedor.cantidadDeCertificacionesDeProductos() >= 3
	}
}

class ClienteHumanista inherits Cliente {

	override method puedeSerAtendido(vendedor){
		return vendedor.esPersonaFisica()
	}
}

