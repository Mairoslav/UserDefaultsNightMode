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
            print("App has launched before")
        } else {
            // and if it hasn't we know that "This is the first launch ever!"
            print("This is the first launch ever!")
            // and in this other section, we can set the Bool for has launched before to true.
            UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
            // 05:33 Here we'll also set the default value for midnight theme on, so that we know it's taking care for the rest of the app.
            UserDefaults.standard.set(false, forKey: "midnightThemeOn")
            UserDefaults.standard.synchronize()
            // 05:37 Then we can go back to ViewController ... move thre 
        }
    }
    // */

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
/*
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
*/

}

