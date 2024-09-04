#define ANALOG_IN 0  //PIN 0, il 'RX'. Ricevitore.

void setup() {
 Serial.begin(9600);

}

void loop() {
 int val=analogRead(ANALOG_IN);
 Serial.write(0xff); /*Invia serialmente il valore di 255: ovvero 8 bit ("11111111"). "0" E' il pin. "x" Mi sta ad indicare la rappresentazione in esadecimale. "ff" 255, in esadecimale:
 f*16^1+f*16^0; 'f' in esadecimale vale '15', l'ultimo valore. La funzione in se, invia un byte o una serie di bytes, appunto per questo ho 8 bit e un valore massimo, quindi di 255.*/

 
 Serial.write( (val >> 8) & 0xff );  //Effetuo il 'bitwise', spostando a destra e a sinistra i miei bit. Spostando a destra divido, a sinistra moltiplico. Moltiplico e divido per '2'.

 Serial.write( val & 0xff ); //La funzione AND, scritta '&', si usa per capire quali bit siano impostati a '1'. Insomma il valore letto viene confrontato con quello massimo, e stampato. Dato che è conveniente dare un valore MASSIMO!!!
 

}
