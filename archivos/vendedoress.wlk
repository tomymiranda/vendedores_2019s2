import lugares.*
import certificaciones.*
import centro.*

class Venta {

	var property certificaciones = []

	method lograrCertificacion(certificacion) {
		certificaciones.add(certificacion)
	}

	method tieneAlmenosUnaCertificacionDeProductos() {
		return certificaciones.any({ i => i.esSobreProducto() })
	}
	

	method tieneAlmenosUnaCertificacionQueNoEsSobreProductos() {
		return certificaciones.any({ i => not i.esSobreProducto() })
	}

	method esVersatil() {
		return self.tieneAlmenosUnaCertificacionDeProductos() && self.tieneAlmenosUnaCertificacionQueNoEsSobreProductos() && certificaciones.size() >= 3
	}

	method esFirme() {
		return certificaciones.sum({ i => i.puntos() }) >= 30
	}

	method puntosPorCertificaciones() {
		return certificaciones.sum({ i => i.puntos() })
	}

	method tieneAfinidadConCentro_(centro) {
		return self.puedeTrabajar(centro.ciudadDondeEsta())
	}

	method cantidadDeCertificacionesDeProductos(){
		return certificaciones.count({i => i.esSobreProducto()})
	}
	
	method esCandidato(centro){
		return self.esVersatil() && self.tieneAfinidadConCentro_(centro)
	}
	
	method esInfluyente()

	method puedeTrabajar(ciudad)

	method esPersonaFisica()

}

class VendedorFijo inherits Venta {

	var property ciudadDondeVive

	override method puedeTrabajar(ciudad) {
		return self.ciudadDondeVive().equals(ciudad)
	}

	override method esInfluyente() {
		return false
	}
	
	override method esPersonaFisica(){
		return true
	}

}

class VendedorViajante inherits Venta {

	const property provinciasDondeEstaHabilitado

	override method puedeTrabajar(ciudad) {
		return provinciasDondeEstaHabilitado.contains(ciudad.provinciaDondeEsta())
	}

	override method esInfluyente() {
		return provinciasDondeEstaHabilitado.sum({ i => i.poblacion() }) >= 10000000
	}
	
	override method esPersonaFisica(){
		return true
	}
}

class ComercioCorresponsal inherits Venta {

	const property ciudadesDondeTieneSucursales

	override method puedeTrabajar(ciudad) {
		return ciudadesDondeTieneSucursales.contains(ciudad)
	}

	override method esInfluyente() {
		return ciudadesDondeTieneSucursales.size() >= 5 || self.provinciasDeLaCiudadesDondeTieneSucursales().size() >= 3
	}

	method provinciasDeLaCiudadesDondeTieneSucursales() {
		return ciudadesDondeTieneSucursales.map({ i => i.provinciaDondeEsta() }).asSet()
	}

	// no quedo muy clara la consigna
	override method tieneAfinidadConCentro_(centro) {
		return super(centro) && self.ciudadesDondeTieneSucursales().size() >= 1 && ciudadesDondeTieneSucursales.any({ i => not centro.puedeCubrirLaCiudad_(i) })
	}

	override method esPersonaFisica(){
		return false
	}
}

