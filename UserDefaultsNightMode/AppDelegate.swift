//
//  AppDelegate.swift
//  UserDefaultsNightMode
//
//  Created by mairo on 01/01/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?
    
    // 05:00 So I have made this method called checkIfFirstLaunch(), which does a similar thing to what our code in our viewDidLoad() method did.
    // Except for that primary focus is not whether the theme has been set or not, but in a more general sense whether the app had ever been launched before.
    // 05:15 So similar to the code in our viewDidLoad() method,
    
    // /*
    func checkIfFirstLaunch() {
        // we have Bool forKey "hasLaunchedBefore" to check if the app has ever launched,
        if UserDefaults.standard.bool(forKey: "hasLaunchedBefore") {
            print("App had already launched before")
        } else {
            // and if it hasn't we know that "This is the first that app does launch"
            print("This is the first that app does launch")
            // and in this else section, we can set the Bool for "hasLaunchedBefore" to true.
            UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
            // 05:33 Here we'll also set the default value for "midnightThemeOn", so that we know it's taking care for the rest of the app.
            UserDefaults.standard.set(false, forKey: "midnightThemeOn")
            // 05:37 Then we can go back to ViewController ... move thre 
        }
    }
    // */
    
    // As per Q&A mentor help: The purpose of the code with user defaults is to show that it can tell if the app has launched for the first time or if it has launched before. This is done in the method `checkIfFirstLaunch()`
    // However, this method is not called in the project at all. So, it's not possible to check if the variable "hasLaunchedBefore" is in the device or not. You'll have to call the method in some way. I recommend calling the method in the `didFinishLaunchingWithOptions` method of the app delegate:
/*
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // calling the method 'checkIfFirstLaunch()' in the `didFinishLaunchingWithOptions` method of the AppDelegate:
        // /*
        checkIfFirstLaunch()
        //  */
        return true
    }
*/
    func applicationDidFinishLaunching(_ application: UIApplication) {
        checkIfFirstLaunch()
        // return true
    }
    
}

