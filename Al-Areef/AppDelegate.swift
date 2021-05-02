//
//  AppDelegate.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 09/04/21.
//

import UIKit
import IQKeyboardManagerSwift
import LanguageManager_iOS
import SVProgressHUD
@main

class AppDelegate: UIResponder, UIApplicationDelegate {
    var defaultsData: UserDefaults!;
    lazy var window: UIWindow? = {
        return UIApplication.shared.windows.first
    }()
    let nav = UINavigationController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        defaultsData = UserDefaults.standard;

        //IQKeyboardManager setup
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.previousNextDisplayMode = .alwaysHide
        
        UINavigationBar.appearance().barTintColor = UIColor.app_Green
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        LanguageManager.shared.defaultLanguage = .en
        SVProgressHUD.setDefaultMaskType(.gradient)
        let mainView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SplashVC") as! SplashVC
        nav.viewControllers = [mainView]

        return true
    }

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


}

let appDelegate = UIApplication.shared.delegate as! AppDelegate;
