// Eventos
// load
// delete <= position 
// Los enum ya no funcionarán porque uno de los eventos necesitará que le pase un parámetro
// en este caso, el delete necesitará la posición de la noticia a ser eliminada.  

class NewsEvents {}

class LoadEvent extends NewsEvents { }

class DeleteEvent extends NewsEvents {
  final int position;

  DeleteEvent(this.position);
}