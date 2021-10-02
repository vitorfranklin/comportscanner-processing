import java.io.IOException;
import processing.serial.*;

int numPorta=0; //Number of the COM Port
String portaID="Nenhuma"; //ID Com Port
Serial porta; //Serial Port
boolean estado=false; // state of the Port (busy or avaliable)
             
        void setup() {
          size(800, 600);
          smooth();
        }
        void draw() {
              fill(255);
              rect(10,0,780,75);  
              fill(255);
              rect(400,75,390,300);
              fill(255);
              rect(10,75,385,300);
              fill(255);
              rect(10,380,780,210);          
              fill(255);
              textSize(30);      
              fill(0,255,0);   
              fill(0);
          
            if(estado==true){
   
              fill(0,255,0);
              circle(420,120,30);
              fill(255,0,0);
              textSize(20);
              text("Desconectar ",650,350);
              textSize(20);
              text(portaID ,450,128);  
              if(mouseX>575&&mouseX<760&&mouseY>330&&mouseY<350){
              fill(0);
              text("Desconectar ",650,350);
                    if(mousePressed){
                        desconectaporta();
                        } 
                  }
              }       

          else{
            for (int i = 0; i<Serial.list().length;i++){
            fill(0);
            fill(255,0,0);
            circle(420,120+i*60,30); 
            textSize(20);
            text(Serial.list()[i],450,128+i*60); 
            if(mouseX>448&&mouseX<511&&mouseY>(108+i*60)&&mouseY<(130+i*60)){  
              fill(0);
              textSize(20);
              text(Serial.list()[i],450,128+i*60);
               if(mousePressed){
                 numPorta = i;
                 portaID = Serial.list()[i];
                 i=Serial.list().length+100;
                 conectaPortaCom();
                 estado = true; 
                 fill(0,255,0);  
               } 
             }     
           }
          } 
         }
         
         void conectaPortaCom(){
           
           try{
              porta = new Serial(this, portaID, 115200);
              porta.clear();
              estado=true;
              println("conectado ");
              }
              
             catch(Exception e){
             println(e);
           }
         }   
         
         void desconectaporta(){
           
          try{
            porta.stop();
            portaID="Nenhuma";
            println("desconectado");
            estado=false;
          }   
            
            catch(Exception e){
            println(e);
          } 
         }
         
         
         
         
        
          




 
