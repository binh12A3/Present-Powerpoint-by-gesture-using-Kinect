//RX
//------------Processing --> Transmisser (above) --> Receiver (below) --> PC ------------//

#include <Keyboard.h>
/*
 Keyboard.write(char)
 Keyboard.press(byte)
 Keyboard.release(byte)
 
#define KEY_LEFT_CTRL  
#define KEY_LEFT_SHIFT 
#define KEY_LEFT_ALT   
#define KEY_LEFT_GUI   
#define KEY_RIGHT_CTRL 
#define KEY_RIGHT_SHIFT    
#define KEY_RIGHT_ALT  
#define KEY_RIGHT_GUI  

#define KEY_UP_ARROW   
#define KEY_DOWN_ARROW 
#define KEY_LEFT_ARROW 
#define KEY_RIGHT_ARROW    
#define KEY_BACKSPACE  
#define KEY_TAB        
#define KEY_RETURN 
#define KEY_ESC        
#define KEY_INSERT 
#define KEY_DELETE 
#define KEY_PAGE_UP   
#define KEY_PAGE_DOWN  
#define KEY_HOME   
#define KEY_END        
#define KEY_CAPS_LOCK  
#define KEY_F1     
#define KEY_F2     
#define KEY_F3     
#define KEY_F4     
#define KEY_F5     
#define KEY_F6     
#define KEY_F7     
#define KEY_F8    
#define KEY_F9     
#define KEY_F10       
#define KEY_F11        
#define KEY_F12        
 */

#define F5_button 3
#define ESC_button 4
#define NEXT_button 7
#define BACK_button 8


void setup()
{
  Serial.begin(9600);
  
  //F5
  pinMode(F5_button,INPUT);
  digitalWrite(F5_button,LOW);
  //ESC
  pinMode(ESC_button,INPUT);
  digitalWrite(ESC_button,LOW);
  //NEXT
  pinMode(NEXT_button,INPUT);
  digitalWrite(NEXT_button,LOW);
  //BACK
  pinMode(BACK_button,INPUT);
  digitalWrite(BACK_button,LOW);
}

void loop()
{
   //---------------------------------------F5 : Start
   if (digitalRead(F5_button)==HIGH)
   {
    delay(1000);
    Keyboard.write(KEY_F5 ); 
   }
   //---------------------------------------ESC : Exit powerpoint
   if (digitalRead(ESC_button)==HIGH)
   {
    delay(1000);
    Keyboard.write(KEY_ESC); 
   }
   //---------------------------------------Next slide
   if (digitalRead(NEXT_button)==HIGH)
   {
    delay(1000);
    Keyboard.write(KEY_RIGHT_ARROW); 
   }
   //---------------------------------------Back slide
   if (digitalRead(BACK_button)==HIGH)
   {
    delay(1000);
    Keyboard.write(KEY_LEFT_ARROW); 
   }
}//end void loop
