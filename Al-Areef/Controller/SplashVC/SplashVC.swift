//
//  ViewController.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 09/04/21.
//

import UIKit
import LanguageManager_iOS
class SplashVC: UIViewController {
    var switchLanguage = LanguageDetails()
    // MARK:- Outlets
    @IBOutlet weak var btnSelectLanguage          : UIButton!
    @IBOutlet weak var vwBackSelectLanguage       : UIView!
    @IBOutlet weak var lblLanguage: UILabel!
    @IBOutlet weak var btnLang: UIButton!
    var selectedLanguage: Languages = .ar
    @IBOutlet weak var btnContinue: UIButton!
    // MARK:- Variables
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // switchLanguage.changeLanguageTo(lang: "ar")
        UserData.saveData(.language, "ar")
        // set prefered languages for the app.
        UserDefaults.standard.set(["ar"], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
        
        let is_login = UserDefaults.standard.bool(forKey: User_defaults_Constants.LOGGED_IN)
        if is_login == true
        {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "UtechTab_UTC") as! UtechTab_UTC
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            setUpView()
        }
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        self.btnLang.isHidden = true
      //self.vwBackSelectLanguage.setCornerRadius(radius: btnSelectLanguage.frame.height / 2)
      //  self.vwBackSelectLanguage.setShadow(shadowColor: UIColor.lightGray, shadowOpacity: 1, shadowRadius: 2, offset: CGSize(width: 0, height: 1))
        self.vwBackSelectLanguage.layer.cornerRadius = 20.0
        self.vwBackSelectLanguage.layer.masksToBounds = true
      //  self.btnContinue.layer.cornerRadius = 20.0
     //   self.btnContinue.layer.masksToBounds = true
        self.btnLang.layer.cornerRadius = 5.0
        self.btnLang.layer.masksToBounds = true
        self.btnLang.layer.borderWidth = 1
        self.btnLang.layer.borderColor = UIColor.hexStringToUIColor(hex: "#32AC93").cgColor
        self.lblLanguage.text = "Arabic"
        self.btnLang.setTitle("English", for: .normal)
       // btnContinue.setTitle("CONTINUE".localiz(), for: .normal)

    }
    
    // MARK:- Button Actions
    @IBAction func btnSelectLanguageTapped(_ sender : UIButton){
     
            self.btnLang.isHidden = false
        
    }
    
    // MARK:- Push Methods
    private func pushLoginVC() {
        // change the language
        LanguageManager.shared.setLanguage(language: selectedLanguage)
//        appDelegate.setSplash()
//        appDelegate.setAppearance()
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            guard let vc = UIStoryboard.main.instantiateViewController(withIdentifier: String(describing: LoginStepOneVC.self)) as? LoginStepOneVC else { return }
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
        appDelegate.setLogin()
       
    }
    
    @IBAction func btnLang(_ sender: UIButton) {
        
       
        //  pushLoginVC()
        
            sender.tag = 0
            self.btnLang.isHidden = true
        if lblLanguage.text == "Arabic" {
            self.lblLanguage.text = "English"
            self.btnLang.setTitle("Arabic", for: .normal)
            switchLanguage.changeLanguageTo(lang: "en")
            
            UserData.saveData(.language, "en")
            // set prefered languages for the app.
//            UserDefaults.standard.set(["en"], forKey: "AppleLanguages")
//            UserDefaults.standard.synchronize()
       // switchLanguage.changeLanguageTo(lang: "ar")
                  //  self.navigationController?.navigationBar.semanticContentAttribute = .forceRightToLeft
            selectedLanguage = .en
        }else{
            self.lblLanguage.text = "Arabic"
            self.btnLang.setTitle("English", for: .normal)
            selectedLanguage = .ar
            
            switchLanguage.changeLanguageTo(lang: "ar")
            UserData.saveData(.language, "ar")
        
            // set prefered languages for the app.
//            UserDefaults.standard.set(["ar"], forKey: "AppleLanguages")
//            UserDefaults.standard.synchronize()

        }
   
 
           
          
        
    }
    // MARK:- Custom Methods
    
    // MARK:- ReceiveMemoryWarning
    override func didReceiveMemoryWarning() {
        debugPrint("⚠️🤦‍♂️⚠️ Receive Memory Warning on \(self) ⚠️🤦‍♂️⚠️")
    }
    
    // MARK:-
    deinit {
        debugPrint("🏹 Controller is removed from memory \(self) 🎯 🏆")
    }
    @IBAction func btnContinue(_ sender: Any) {
        pushLoginVC()
    }
    
} //class


