// clase abstracta
class Plaga {
    var property poblacion

    method trasmiteEnfermedad(){
        return poblacion >= 10
    }

        
    method atacar(elemento) {
        elemento.recibirAtaqueDe(self)
        self.sufrirEfectoDeAtaque()
    }

    method sufrirEfectoDeAtaque() {
        poblacion += poblacion * 0.1
    }
}

class Cucarachas inherits Plaga{
    var property pesoPromedio 

    method nivelDeDanio() = poblacion / 2

    override method trasmiteEnfermedad () {
        return super() && pesoPromedio >= 10
    } 

     override method sufrirEfectoDeAtaque() {
        super() // Ejecuta el aumento de población del 10% de la clase madre
        pesoPromedio += 2 // Añade su comportamiento particular de peso
    }
}


class Pulgas inherits Plaga {

    method nivelDeDanio() {
      return poblacion * 2
    }

}

class Garapatas inherits Pulgas {
    override method sufrirEfectoDeAtaque() {
        // Las garrapatas aumentan un 20% en lugar del 10% de la madre, pisamos el método
        poblacion += poblacion * 0.2
    }
}

class Mosquitos inherits Plaga{
    method nivelDeDanio() {
        return poblacion
    }

    override method trasmiteEnfermedad(){
        return super() && poblacion % 3 == 0
    }
}
