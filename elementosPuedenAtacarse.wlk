import configuracionDeHuerta.*

class Hogar {
    var property mugre
    const confort

    method mugreActual() {
        return mugre
    }

    method confortActual() {
        return confort
    }

    method esBuena(){
        return (confort / 2) >= mugre
    }

    method recibirAtaqueDe(plaga) {
      mugre += plaga.nivelDeDanio()
    }

}

class Huerta{
    var property produccion  // medida en KG por mes
    const property configHuerta = configuracionDeHuerta // objeto que controla el nivel de la huerna

    method esBuena(){
        return produccion > configHuerta.nivel()
    }
    
    method recibirAtaqueDe(plaga) {
         // Calculamos el 10% del daño de la plaga
        const disminucionBase = plaga.nivelDeDanio() / 10
        
        // Si transmite enfermedades, sumamos los 10 puntos adicionales
        const adicionalEnfermedad = if (plaga.trasmiteEnfermedad()) 10 else 0
        
        produccion = (produccion - (disminucionBase + adicionalEnfermedad))
  }
}

class Mascota {
    var property salud // cuanto mas alto mas saludable

    method esBuena() {
      return  salud > 250
    }

    method recibirAtaqueDe(plaga) {
    if (plaga.trasmiteEnfermedad()) {
      // Restamos el daño completo y usamos .max(0) para que la salud no quede en negativo
      salud = (salud - plaga.nivelDeDanio()).max(0)
    }
  }
}

class Barrio {
    // A su vez, los elementos se agrupan en barrios; en cada barrio hay varios elementos.
    const huertas // lista de huertas
    const mascotas // lista de mascotas
    const hogares // lista de hogares

    method elementosDelBarrio () = huertas + mascotas + hogares

    method esCopado() {
        const elementos = self.elementosDelBarrio()
        const buenos = elementos.count({ elemento => elemento.esBuena() })
        const noBuenos = self.elementosDelBarrio().size() - buenos // nobuenos = self.elementosDelBarrio().count({elementos => not elementos.esBuena() })

        return buenos > noBuenos
    }
}