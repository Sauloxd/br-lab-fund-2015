/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package mvn.dispositivo;

/**
 *
 * @author mjunior
 */
public class Fibonacci implements Dispositivo {

  public Fibonacci (){
    //      Construtor: inicializa em 0 os atributos v0 e v1, os primeiros
    // números inteiros da sequência de Fibonacci
  }

  public void escrever(){
// - escrever: atualiza v1 para o valor passado, guardando o antigo valor
// de v1 no atributo v0
  }


  public int ler(){
  // atualizando v0 e v1 como se v0+v1 tivesse sido passado como
  // parâmetro para o método escrever.
  //: retorna o valor seguinte da sequência de Fibonacci, v0+v1,
  } 

  public boolean podeLer(){
    return true;
  } 
  public boolean podeEscrever(){
    return true;
  }
  public void reset(){
  // reinicializa v0 e v1 em 0
  } 
  public void skip(){
  // (n): salta n valores da sequência de Fibonacci, como se o
  // método ler fosse chamado n vezes; retorna então o valor seguinte
  // da sequência da mesma forma que seria feito com uma nova
  // chamada do método ler
  } 
  public void position(){
  //: retorna o valor de v0
  } 
  public void size(){
    //: retorna o valor de v1
  } 
}
