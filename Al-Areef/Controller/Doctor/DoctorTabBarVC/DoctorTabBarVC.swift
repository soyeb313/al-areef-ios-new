//
//  DoctorTabBarVC.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 26/05/21.
//

import UIKit

class DoctorTabBarVC: UITabBarController {

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
        if let items = tabBar.items {
            for item in items {
                item.title = ""
            }
        }
    }
    
    // MARK:- Push Methods
    func showSideMenuVC() {
        guard let vc = UIStoryboard.Doctor.instantiateViewController(withIdentifier: String(describing: SideMenuVC.self)) as? SideMenuVC else { return }
        vc.onDidSelect = { type in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                switch type {
                case .Profile:
                    print("Profile")
                   // self.pushUploadProfileVC()
                    break
                case .WorkSchedule:
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
                        guard let self = self else { return }
                        self.pushWorkScheduleVC()
                    }
                case .Logout:
                    print("Logout")
                    //self.logoutOption()
                default :
                    print("ddd")
                }
            }
        }
        vc.onLogoutPressed = { [weak self] in
            guard let self = self else { return }
            self.logoutOption()
        }
        self.present(vc, animated: false, completion: nil)
    }
    
    func logoutOption() {
        Alert.show("", "Are you sure you want to logout?".localiz(), ["Yes".localiz()]) { [weak self] strBtn in
            guard let self = self else { return }
            if strBtn == "Yes".localiz() {
                UserData.clearData()
                appDelegate.setSplash()
            } else {
                
            }
        }
    }
    
    func pushWorkScheduleVC() {
        guard let vc = UIStoryboard.Doctor.instantiateViewController(withIdentifier: String(describing: WorkScheduleListVC.self)) as? WorkScheduleListVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

