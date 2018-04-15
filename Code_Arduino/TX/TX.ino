//TX
//------------Processing --> Transmisser (above) --> Receiver (below) --> PC ------------//
#define F5_button 3
#define ESC_button 4
#define NEXT_button 7
#define BACK_button 8


void setup()
{
  Serial.begin(9600);
  //F5
  pinMode(F5_button,OUTPUT);
  digitalWrite(F5_button,LOW);
  //ESC
  pinMode(ESC_button,OUTPUT);
  digitalWrite(ESC_button,LOW);
  //NEXT
  pinMode(NEXT_button,OUTPUT);
  digitalWrite(NEXT_button,LOW);
  //BACK
  pinMode(BACK_button,OUTPUT);
  digitalWrite(BACK_button,LOW);
}

void loop()
{
  if (Serial.available()>0) 
  {
     int data = Serial.read();    
     //--------------------------------------Do nothing
     if (data == 0)
     {
      digitalWrite(F5_button,LOW);
      digitalWrite(ESC_button,LOW);
      digitalWrite(NEXT_button,LOW);
      digitalWrite(BACK_button,LOW);
     }
     //---------------------------------------F5 : Start
     if (data == 1)
     {
      digitalWrite(F5_button,HIGH);
     }
     //---------------------------------------ESC : Exit powerpoint
     if (data == 2)
     {
      digitalWrite(ESC_button,HIGH);
     }
     //---------------------------------------Next slide
     if (data == 3)
     {
      digitalWrite(NEXT_button,HIGH);
     }
     //---------------------------------------Back slide
     if (data == 4)
     {
      digitalWrite(BACK_button,HIGH);
     } 
  }//end if
}//end void loop
