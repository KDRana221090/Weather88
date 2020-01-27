//
//  AppDelegate.swift
//  Weather88
//
//  Created by Apple on 24/01/20.
//  Copyright © 2020 assetvault. All rights reserved.
//

import UIKit
import GoogleSignIn
import GooglePlaces
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {
    
    
   var locationManager: CLLocationManager = CLLocationManager()
    var window: UIWindow?
    var locManager = CLLocationManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
         GMSPlacesClient.provideAPIKey(AppDataKey.GOOGLE_API_Key.rawValue)
         GIDSignIn.sharedInstance().clientID = "240435074854-50k4uknoda9vs9a177ks35k7e9402hsr.apps.googleusercontent.com"
        self.getCurrentLocation()
        self.preSetUserCredentials()
        locManager.requestWhenInUseAuthorization()
        self.checkForPrelogin()
        return true
    }

    func getCurrentLocation() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLocation: CLLocation = locations[locations.count - 1]
      
        
        if let lat = AppConfigManager.shared.getData(dataKey: AppConfigManagerConst.LATTITUDE.rawValue){
            
         }
         else {
         AppConfigManager.shared.setData(data: String(lastLocation.coordinate.latitude), dataKey: AppConfigManagerConst.LATTITUDE.rawValue)
         AppConfigManager.shared.setData(data: String(lastLocation.coordinate.longitude), dataKey: AppConfigManagerConst.LONGITUDE.rawValue)
        }
        
      }
    func preSetUserCredentials() {
         AppConfigManager.shared.setData(data: "tester@gmail.com", dataKey: AppConfigManagerConst.EMAIL_ADDESS.rawValue)
         AppConfigManager.shared.setData(data: "Test@123", dataKey: AppConfigManagerConst.PASSWORD.rawValue)
      }
    
    func checkForPrelogin() {
        let val = AppConfigManager.shared.getData(dataKey: AppConfigManagerConst.HAS_USER_LOGGED_IN.rawValue)
        if let data = val {
            if(data == "YES") {
                self.moveToUserOnboardScreen("WeatherViewController", "WeatherViewControllerID")
            }
        } else {
            self.moveToUserOnboardScreen("LoginView", "LoginViewID")
        }
        
    }
    
    
    func moveToUserOnboardScreen(_ storyBoard: String, _ StoryboardId: String) {
        let mainStoryboard = UIStoryboard(name: storyBoard, bundle: nil)
        let rootViewController = mainStoryboard.instantiateViewController(withIdentifier: StoryboardId)
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.isNavigationBarHidden = true
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.rootViewController = navigationController
        self.window!.makeKeyAndVisible()
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


//
//
//extension UserDefaults {
//
//    func set(location:CLLocation, forKey key: String){
//        let locationLat = NSNumber(value:location.coordinate.latitude)
//        let locationLon = NSNumber(value:location.coordinate.longitude)
//        self.set(["lat": locationLat, "lon": locationLon], forKey:key)
//    }
//
//    func location(forKey key: String) -> CLLocation?
//    {
//        if let locationDictionary = self.object(forKey: key) as? Dictionary<String,NSNumber> {
//            let locationLat = locationDictionary["lat"]!.doubleValue
//            let locationLon = locationDictionary["lon"]!.doubleValue
//            return CLLocation(latitude: locationLat, longitude: locationLon)
//        }
//        return nil
//    }
//}
