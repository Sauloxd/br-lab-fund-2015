/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Diego
 */
public class TrianguloEscaleno extends Triangulo {
    
    
    public TrianguloEscaleno(float ladoA, float ladoB, float ladoC){
        super(ladoA, ladoB, ladoC);
    }

    @Override
    public boolean validar() {
        // TODO: verificar se escaleno
		//Nao esquecer de chamar tambem a classe pai para fazer a validacao!
		
		float ladoA,ladoB,ladoC;
		if(super.validar()){
			ladoA = lados[0];
			ladoB = lados[1];
			ladoC = lados[2];
			boolean resultado;
			resultado = (ladoA != ladoB);
			resultado = resultado && (ladoB!= ladoC);
			resultado = resultado && (ladoA!= ladoC);
			return resultado;
		}
		return false;
			
    }
    
}
