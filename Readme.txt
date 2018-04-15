Project : "Present powerpoint using gesture" - KINECT & Processing
Demo : https://www.youtube.com/watch?v=GYWSLkKE07M&t=0s&index=7&list=PLt_1MQ7OBDxYsXAp0R0eX-2Xj1odvyl7v

Description :
- When the right hand is above the head	: Start Slide Show.
- When the left hand is above the head : Escape Slide Show.
- When the left hand is in right of the right hip : Next slide.
- When the right hand is in the left of the left hip : Previous slide.


1. Hardware
	In this project, I used 2 boards "arduino pro micro". (image is attached)
	The first board (located above)is used for reading data from processing and send data to the second board.
	The second board (located below) is used for reading data from the first board and then send send the keyboard emulation signal to computer.
	
	Why I used "arduino pro micro" for this project ??? Because it supports for simulating keyboard signal.
	
2. Code
	2.1 TX (Upload to 1st arduino pro micro(located above))
	2.2 RX (Upload to 2nd arduino pro micro(located below))
	2.3 Processing
