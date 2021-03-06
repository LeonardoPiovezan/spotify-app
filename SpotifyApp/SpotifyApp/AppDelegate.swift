//
//  AppDelegate.swift
//  SpotifyApp
//
//  Created by Leonardo Piovezan on 30/05/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var auth = SPTAuth()
    var appCoordinator: Coordinator?
    var defaultContainer: DefaultContainer!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        auth.redirectURL = URL(string:"SpotifyApp://returnAfterLogin.")
        auth.sessionUserDefaultsKey = "current session"
        self.defaultContainer = DefaultContainer()

        let currentWindow = UIWindow(frame: UIScreen.main.bounds)
        self.appCoordinator = AppCoordinator(window: currentWindow, container: defaultContainer.container)
        self.appCoordinator?.start()
        self.window = currentWindow
        self.window?.makeKeyAndVisible()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

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

    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {

        if auth.canHandle(auth.redirectURL) {
            auth.handleAuthCallback(withTriggeredAuthURL: url) { (error, session) in
                if error != nil {
                    print(error?.localizedDescription)
                }
                let userDefaults = UserDefaults.standard
                let sessionData = NSKeyedArchiver.archivedData(withRootObject: session)
                userDefaults.set(sessionData, forKey: "SpotifySession")
                userDefaults.synchronize()

                NotificationCenter.default.post(name: Notification.Name(rawValue: "loginSuccessfull"), object: nil)

            }
            return true
        }
        return false
    }
}

