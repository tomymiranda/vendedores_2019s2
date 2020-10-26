import certificaciones.*

class CentroDeDistribucion {

	var property ciudadDondeEsta
	const property vendedores = []

	method agregarUnVendedor(vendedor) {
		if (not vendedores.contains(vendedor)) {
			vendedores.add(vendedor)
		} else {
			self.error("ya esta registrado")
		}
	}

	method vendedorEstrella() {
		return vendedores.max({ i => i.puntosPorCertificaciones() })
	}

	method puedeCubrirLaCiudad_(ciudad){
		return vendedores.any({i => i.puedeTrabajar(ciudad)})
	}

	method vendedoresGenerico(){
		return vendedores.filter({i=>i.tieneAlmenosUnaCertificacionQueNoEsSobreProductos()})
	}
	
	method esRobusto(){
		return vendedores.count({i => i.esFirme()}) >= 3
	}

	
	
	method repartirCertificaciones(esDeProducto){
		vendedores.forEach({i => i.lograrCertificacion(new Certificacion(esSobreProducto = esDeProducto))})
	}

	

}

