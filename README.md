# Weather88
# Description and Introduction
 
Weather88 is a Live weather App, that helps you to  discover the LIVE weather conditions, plan your day ahead before you go out.


Weather88 offers:

1) Top Notch security with Biometric Authentication <br/>
2)	Live weather updates <br/>
3)	Forecast daily and Hourly <br/>
4)	5 Days weather forecast <br/>
5)	Humidity , Pressure, Precipitation and wind direction <br/>
6)	Check the weather for different city before travelling . 


# External library used

1) TPKeyboard for scroll view <br/>
2)	Modified version of TweetextField  with a custom icon to the left of text field <br/>
3)	NVActivity Indicator <br/>



# Project Architecture/Design pattern <br/>
MVVM design pattern will be used to structure the code into different layers, allowing us to have testability in our codebase, separation of concern, and decouple the layer from each other.


Model: Hold the App data <br/>
View: UI Part/Presentation layer of the App <br/>
ViewModel: Intermediator be View and Model, This layer will contain the actual business logic code.<br/>


# Binding:
To bind the View with ViewModel following pattern will be used: <br/>
1)	Closure as a completion handlers <br/>
2)	Delegation<br/>




# List Of Features <br/>

# User Module
1.	Splash Screen<br/>
2.	Sign in using email and password<br/>
3.	Sign in using Gmail <br/>
4.	Sign in using Touch id<br/>

# Weather Module
1.	Fetch User’s Current Location<br/>
2. Select a city with Auto-Complete <br/>
3.	Show current weather status <br/>
4.	Show hourly whether forecast  for the current day<br/>
5.	Whether forecast for next 5 days<br/>
6.	 Show other details like: Humidity, Wind Speed, Min/Max temp<br/>




# Functionality <br/>
1) User can sign in using :   Gmail, Touch ID, Email/Password. <br/>
2) For First time User by Default Current GPS location is detected and weather info is fetched for that location. <br/>
3) User can also search for a city with autocomplete feature to look for weather infomation for that particular place.<br/>
4) User can see the current Weather infomation.<br/>
5) User can also see the next 24 hours forecast at an one hour interval.<br/>
6) User can alsl see the next 6 days weather forecast data. <br/>








# Data Flow diagram / Overall Architecture <br/>

https://drive.google.com/file/d/1KFbmujUM0xEvsDgUEIsWmyzauTIX6S2o/view?usp=sharing


  

