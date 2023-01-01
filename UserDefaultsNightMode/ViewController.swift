//
//  ViewController.swift
//  UserDefaultsNightMode
//
//  Created by mairo on 01/01/2023.
//

import UIKit

// MARK: 5. Example Before We Dive into the Code
// 00:00 say there's part of your app that presents users with the preferences page and allows them to choose between the app themes daytime and midnight.
// 00:15 If you set your preference to the midnight theme, you'd probably want the app to remember that, so you don't have to reset it every time upon app launch. So this would be a good place to use user defaults.
// 00:22 your device has a default databasae whre it stoers everyuthing from:
    // 1. system-wide defaults
    // 2. language defaults
    // 3. app-specific defaults (will be focuting on app0specific defautls)
    // 4. more ...

// 00:33 To access the values from this database, we'll need to call .standart from its user defaults object, which will return the shared defaults object that we need. Notice I said shared object, .standart will return a reference to the same user defaults object, regardless of where we invoke it in our program. This is called the "SINGLETON DESIGN PATTERN".
// 00:50 Once we have the shared user defaults object, we can then use keys to get values for this default's object just like a dictionary. In this example, we'll use the method value for key, but there are other methods available as well such as String for key, Bool for key, Float for key, and others.

class ViewController: UIViewController {
    
    @IBOutlet weak var themeSwitch: UISwitch!
    @IBOutlet weak var midnightThemeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 01:07 In this examaple, we want to keep a value that lets us know whether the midnight theme is off or on. So it makes sense to use a boolean here. So we'll first check to see if a boolean value already exists for the String midnightThemeOn using the if let syntax in case it doesn't.
        // 01:23 So, let's first supose the app has no idea what we're talking about. It has never heard of midnight theme on and this is our first time launching the app. So, here's where we'll set it.
        // 01:31 Setting a value and UserDefaults is very similar to checking for value and the syntax is: "set with a value and then the key String we will want to use to retrieve it. So in our case, this will be a Bool. So we'll say false, because no one has flipped the midnight theme on yet. And for key we'll put in that midnightThemeOn String. Move to "// 01:55 So we know that if this else statement is being executed" in else statement.
        if let weWantMidnight = UserDefaults.standard.value(forKey: "midnightThemeOn") {
            // 02:24 that is the case where value for key midnightThemeOn returns a value. So we know that since we're using value for key, it's returning any object. So the 1st thing we need to do is cast this to a Bool.
            if weWantMidnight as! Bool {
                // 02:34 Then we can check its value, if it is true we'll call a method called switchToMidnight, which makes all the UI changes necessary to show the midnight theme.
                switchToMidnight()
                print("we like midnight mode")
            } else {
                // 02:44 If its false, we do not really need to do anything because the UI is set to loadWithDaytime theme in general/by default.
                print("we like daylight mode")
            } /*
        } else {
            // 01:55 So we know that if this else statement is being executed, it's because our called value for key up here return nil. Maning no value had been set for that key String. So this also shows us that the app has never been lauched before, because if it had, it would have value for midnightThemeOn.
            UserDefaults.standard.set(false, forKey: "midnightThemeOn")
            // 02:12 So let's just add a print that shows us that this is the apps very first launch, and we know that after this first launch we will now have a value as your default for that midnightThemeOn key.
            // 02:19 So, let's go back up to "if let" statement and deal with this case, ... move up to time 02:24 that is the case where value ...
            print("This is the first time that the app does launch")
            // 05:37 Then from AppDelegate we move here and delete some of this section, as commented out above via /* ... */. And can see that the app still works.
            // 05:44 We no longer need to check if there's a value for weWantMidnight, because we know that there is, because we set it in the AppDelegate which launches first.
            // 05:52 And you can see how this would be preferred, because then you can make sure things are set up at app launch rather thatn at view load. And let's run it one more time. But first let's reset the contents and setting for Simulator Device. And launch and switch to midnight, let's close our app. Relaunch and we see that our preference is saved. Awesome.
               */
        }
    }

    // 02:52 Okay, so now I just need to set up an action for when switch gets flipped. Let me do that now. So when this action gets executed, I check my switch otulet to see whether it's truned off or on "if themeSwitch.isOn"..., and then I call the appropriate UI configuration method.
    @IBAction func switchFlipped(sender: Any) {
        if themeSwitch.isOn {
            switchToMidnight()
            // 03:06 It's here that I want to update my new preference in my user defaults. So I'll add in a set value here to true for midnightThemeOn.
            UserDefaults.standard.set(true, forKey: "midnightThemeOn")
        } else {
            switchToDaytime()
            // 03:16 And if the !themeSwitch.isOn (i.e. is off) I'll put in a set value here to false for midnightThemeOn. So this should work to save our preferences.
            // 03:20 Let's try it out via running the simulator ... continue under all code down ...
            UserDefaults.standard.set(false, forKey: "midnightThemeOn")
        }
    }
    
    // MARK: switchToMidnight()
    func switchToMidnight() {
        view.backgroundColor = .black
        midnightThemeLabel.textColor = UIColor.white
        themeSwitch.isOn = true 
        
    }

    // MARK: switchToDaytime()
    func switchToDaytime() {
        view.backgroundColor = .white
        midnightThemeLabel.textColor = UIColor.black
    }

}

// 03:20 Let's try it out via running the simulator, when initial screen shows try to switch switcher to midnight theme. And let's see what happens when we close the app.
// 03:31 On a device you can view all your open apps by pressing your hope button twice in rapic succession, andthen you can close an app from there. We can simulate this action on your simulator by holding Command + Shift and rapidly pressing H key twice. And just like on a device I can swipe up to close it.
// 03:51 Now let's relaunch our app, and great we see that our preference is saved. Let's switch back to daylight and close it again. Awesome, it save our daylight preference.
// 04:06 But how come it didn't print "This is the first time that the app does launch" when we first ran it?  Well, because I had run this app with user defaults, already implemented when I showed you the demo.

/// *for me the "This is the first time that the app does launch" is printed when run first time, also in case as per 1st version of code, i.e. part of code in else block is kept here (not commented out and relocated to AppDelegate)
/// UserDefaults.standard.set(false, forKey: "midnightThemeOn")
/// print("This is the first time that the app does launch")

// 04:13 So, how do we simulate running this app as if it was the first time it's ever been launched on our device?
// What we need to do is reset the content settings of our simulator. We'll end up  doing this a lot throughout the course, so we've included the directions for this step in the accompanying text as well. It's pretty simple though:
    // 04:28 Click on Simulator/Device/Erase All Content and Settings.. that's it
    // now we can launch the ap as if it's the first time it's on our device, and now we get this output that says "This is the first time that the app does launch"
// 04:43 So, let's switch the midnight theme on, let's close the app, let's relaunch, ans we see our preference is saved.
// 04:53 So awesome, but there's actually an ever better place to put all this code, and that's in our AppDelegate. Move there 05:00 ...


// MARK: text under the video
// Note: If you're wondering why we used value(forKey:) as opposed to what seems like the more apt bool(forKey:), the reason has to do with the purpose of this variable. We're using the weWantMidnight variable to give us two important pieces of information: 1) whether the variable is set at all, and if so, 2) what the variable is set to.
// When you use a Bool, a default value of false is given to it right away, and there is no point at which the variable can be optional. Since we're counting on the variable possibly being optional to give us that first piece of information, it's more useful here for us to use value(forKey:).
