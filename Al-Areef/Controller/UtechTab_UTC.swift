//
//  UtechTab_UTC.swift
//  Utec Partner
//
// Created by Kushal Dixit on 16/03/21.

//

import UIKit

class UtechTab_UTC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let lang = UserData.returnValue(.language) as? String,lang == "ar" {
            self.tabBar.semanticContentAttribute = .forceRightToLeft
            self.navigationController?.navigationBar.semanticContentAttribute = .forceRightToLeft
        }else{
            self.tabBar.semanticContentAttribute = .forceLeftToRight
            self.navigationController?.navigationBar.semanticContentAttribute = .forceLeftToRight
        }
        
        UITabBar.appearance().tintColor = .blue
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.hexStringToUIColor(hex: "#303030")], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .normal)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let items = tabBar.items else { return }

//        items[0].title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "h_home", comment: "")
//        items[1].title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "hm_learn", comment: "")
//        items[2].title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "hm_my_projects", comment: "")
//        items[3].title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "h_support", comment: "")
    }
    
}
