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
import GoogleMaps
@main

class AppDelegate: UIResponder, UIApplicationDelegate {
    var defaultsData: UserDefaults!;
    lazy var window: UIWindow? = {
        return UIApplication.shared.windows.first
    }()
    let nav = UINavigationController()
    var switchLanguage = LanguageDetails()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        defaultsData = UserDefaults.standard;

        //IQKeyboardManager setup
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.previousNextDisplayMode = .alwaysHide
        
        UINavigationBar.appearance().barTintColor = UIColor.app_Green
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let is_login = UserDefaults.standard.bool(forKey: User_defaults_Constants.LOGGED_IN)
        
        if !is_login {
            let domain = Bundle.main.bundleIdentifier!
            UserDefaults.standard.removePersistentDomain(forName: domain)
            UserDefaults.standard.synchronize()
            print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
        }
        
        //set(language, forKey: LANGUAGE_KEY)
        
        //switchLanguage.changeLanguageTo(lang: "en")
        
//        UIApplication.shared.windows.forEach { $0.subviews.forEach { $0.removeFromSuperview(); UIApplication.shared.windows.first?.addSubview($0) }}
        setUpGoogleAPIs()
        SVProgressHUD.setDefaultMaskType(.gradient)
        setSplash()

        return true
    }
    
    private func setUpGoogleAPIs() {
        //Google Maps
        //GMSServices.provideAPIKey("AIzaSyBKLMwSgpyPLp9xNDjt4tELwNGkAdR5qTA")
        //
        GMSServices.provideAPIKey("AIzaSyA7Gg4Yi9EEjZ6KqpDQT1IN48Q6uyTh7dk")
        //GMSPlacesClient.provideAPIKey("AIzaSyA7Gg4Yi9EEjZ6KqpDQT1IN48Q6uyTh7dk")

    }
    
    func setSplash(){
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let mainView =  storyBoard.instantiateViewController(withIdentifier: "SplashVC") as! SplashVC
        let navigationController = UINavigationController(rootViewController: mainView)
        navigationController.navigationBar.isHidden = true
        if let keyWindow = UIApplication.shared.windows.first {
            keyWindow.rootViewController = navigationController
            keyWindow.makeKeyAndVisible()
        }else{
            UIApplication.shared.windows.first?.rootViewController = navigationController
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
    }
    
    func setLogin(){
        self.setAppearance()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            guard let vc = UIStoryboard.main.instantiateViewController(withIdentifier: String(describing: LoginStepOneVC.self)) as? LoginStepOneVC else { return }
            let navigationController = UINavigationController(rootViewController: vc)
            navigationController.navigationBar.isHidden = true
            if let keyWindow = UIApplication.shared.windows.first {
                keyWindow.rootViewController = navigationController
                keyWindow.makeKeyAndVisible()
            }else{
                UIApplication.shared.windows.first?.rootViewController = navigationController
                UIApplication.shared.windows.first?.makeKeyAndVisible()
            }
        }
        
    }
    
    func setDashBoard(){
        self.setAppearance()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            guard let vc = UIStoryboard.main.instantiateViewController(withIdentifier: String(describing: UtechTab_UTC.self)) as? UtechTab_UTC else { return }
            let navigationController = UINavigationController(rootViewController: vc)
            navigationController.navigationBar.isHidden = true
            if let keyWindow = UIApplication.shared.windows.first {
                keyWindow.rootViewController = navigationController
                keyWindow.makeKeyAndVisible()
            }else{
                UIApplication.shared.windows.first?.rootViewController = navigationController
                UIApplication.shared.windows.first?.makeKeyAndVisible()
            }
        }
        
    }
    
    func setAppearance(){
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
//            UINavigationBar.appearance().semanticContentAttribute = .forceRightToLeft
        }else
        {
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            
//            UINavigationBar.appearance().semanticContentAttribute = .forceLeftToRight

        }
    }

    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

let appDelegate = UIApplication.shared.delegate as! AppDelegate;

extension UITextField {
  open override func awakeFromNib() {
    super.awakeFromNib()
    if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
        self.textAlignment = .right
    }else{
        self.textAlignment = .left
    }
  }
}

extension UITextView{
  open override func awakeFromNib() {
    super.awakeFromNib()
    if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
        self.textAlignment = .right
    }else{
        self.textAlignment = .left
    }
  }
}

extension UILabel{
  open override func awakeFromNib() {
    super.awakeFromNib()
    if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
        if self.textAlignment == .left {
            self.textAlignment = .right
        }
    }
  }
}


//extension UINavigationBar {
//    open override func awakeFromNib() {
//        super.awakeFromNib()
//        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
//            self.semanticContentAttribute = .forceRightToLeft
//        }else{
//            self.semanticContentAttribute = .forceLeftToRight
//        }
//    }
//}
