import processing.serial.*;  //Libreria per la comunicazione seriale, inclusa in ARDUINO

Serial port;  //Oggetto porta seriale

int val; //Dato ricevuto dalla porta seriale

int[] values; //Array per contenere i vari dati ricevuti dalla porta seriale.


void setup(){
  size(640,480);
  port = new Serial(this, Serial.list()[0], 9600); /* Classe per inviare e ricevere dati usando il protocollo della comunicazione seriale.
  Serial(parent, portName, baudRate), dove i parametri hanno la seguente funzione:
  parent=tipicamente si usa "this".
  baudRate=Velocità di trasferimento. Avendo impostato il mio Arduino a 9600 bps, dovrò fare la stessa cosa qui.
  portName=Nome della porta seriale da utilizzare. Con il comando "Serial.list()" , avrò una lista di tutte le porte seriali disponibili. Con "[]", vado ad indicare quale aprire, nel mio caso mettendo '0', aprirò sempre la prima (?).*/
}

void draw(){
  while(port.available()>=3) { //Se vengono trasmessi almeno 4 bytes sulla porta seriale
    
    if(port.read()==0xff){  //E se leggo il valore massimo che posso ottenere (255)
      
      val=(port.read()<<8)|(port.read()); //Salvo la differenza con il valore seriale (?)
    
   }
  }
   // Per ogni elemento dell'array...
  for (int i=0; i<width-1; i++)                                 //Mi da la larghezza del mio display. Ovviamente si fa meno uno, per avere 'tenersi piu larghi.
  {
    // ... sposto i valori salvati di una posizione
    values[i] = values[i+1];
  }
  // ... e aggiungo il valore appena letto
  values[width-1] = val;
  // Imposto il colore di sfondo a nero
  background(0);
  // Imposto il colore del disegno a bianco
  stroke(255);
  // Per ogni elemento dell'array...
  for (int x=1; x<width; x++) 
  {
    // ... disegno una linea:
    // dalle coordinate del punto precedente...
    line(width-x, height-1-getY(values[x-1]), 
    // ... alle coordinate del punto attuale
    width-x-1, height-1-getY(values[x]));
  }
}

int getY(int val) {
  // Restituisce l'altezza, in base al valore passato
  return (int)(val / 1023.0f * height) - 1;
}
  