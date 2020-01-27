# Weather88
#Description and Introduction
 
Weather88 is a Live weather App, that helps you to  discover the LIVE weather conditions, plan your day ahead before you go out.


Weather88 offers:

1) Top Notch security with Biometric Authentication <br/>
2)	Live weather updates <br/>
3)	Forecast daily and Hourly <br/>
4)	5 Days weather forecast <br/>
5)	Humidity , Pressure, Precipitation and wind direction <br/>
6)	Check the weather for different city before travelling . 


#External library used

1) TPKeyboard for scroll view <br/>
2)	Modified version of TweetextField  with a custom icon to the left of text field <br/>
3)	NVActivity Indicator <br/>



#Project Architecture/Design pattern <br/>
MVVM design pattern will be used to structure the code into different layers, allowing us to have testability in our codebase, separation of concern, and decouple the layer from each other.


Model: Hold the App data <br/>
View: UI Part/Presentation layer of the App <br/>
ViewModel: Intermediator be View and Model, This layer will contain the actual business logic code.<br/>


#Binding:
To bind the View with ViewModel following pattern will be used: <br/>
1)	Closure as a completion handlers <br/>
2)	Delegation<br/>
