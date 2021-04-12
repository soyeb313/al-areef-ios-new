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

        UITabBar.appearance().tintColor = .white
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: hexStringToUIColor(hex: "503796")], for: .selected)
                UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: hexStringToUIColor(hex: "A19EAB")], for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let items = tabBar.items else { return }

        items[0].title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "h_home", comment: "")
        items[1].title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "hm_learn", comment: "")
        items[2].title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "hm_my_projects", comment: "")
        items[3].title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "h_support", comment: "")
    }
    
}
