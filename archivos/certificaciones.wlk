class Certificacion {
	
	var property esSobreProducto	
	
	method puntos(){
		if(self.esSobreProducto()){
			return 10
		}else{
			return 6
		}
	}
}
