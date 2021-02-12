/** First Wollok example */

const comediaSatirica = {persona => persona.aumentarFelicidad(persona.felicidad())}
const comedia = {persona => persona.aumentarFelicidad(10)}
const comediaAbsurda = {persona => persona.aumentarFelicidad(5)}
const comediaDramatica = {persona => persona}
const cienciaFiccion = {persona => persona.invertirNick()}
const terror = {persona => persona.regalarLibros()}

class Libro {
	
	const property genero
	const property titulo
	const property autor
	const property paginas 
	
	method afectar(persona){
		genero.apply(persona)
	}
	
	method tipo(){
		if(paginas < 100) return cuento
		if(paginas > 200) return novela
		return novelaCorta
	}
}

object cuento {}
object novelaCorta {}
object novela {}

class Persona {
	
	var property nick
	const property librosLeidos = []
	const property librosAdquiridos = []
	var property felicidad = 10
	
	method adquirir(libro){
		librosAdquiridos.add(libro)
	}
	method leer(libro) {
		libro.afectar(self)
		librosLeidos.add(libro)
	}
	
	method ponerseAlDia(){
		librosAdquiridos
			.filter{libro=>self.noLeyo(libro)}
			.forEach({libro=>self.leer(libro)})
	}
	method noLeyo(libro){
		return not librosLeidos.any{lib=>lib.titulo() == libro.titulo()}
		// return not librosLeidos.contains(libro)
	}
	
	method aumentarFelicidad(cant){
		felicidad += cant
	}
	method invertirNick() {
		nick = nick.reverse()
	}
	method regalarLibros(){
		librosAdquiridos.clear()
	}
	
	method titulosPorTipo(tipo){
		return librosLeidos
			.filter{libro => libro.tipo() == tipo}
			.map{libro => libro.titulo()}
	}
}