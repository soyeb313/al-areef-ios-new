//
//  Alert.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 06/06/21.
//

import UIKit
final class Alert {
    
    /// Show Actionsheet  message string with btns as string
    class func show(_ title: String,_ message: String, _ btnTitles: [String],controller: UIViewController? = nil, _ handler: ((String)->())? = nil) {
        let alertController = UIAlertController.init(title: title.localiz(), message: message.localiz(), preferredStyle: .alert)
        btnTitles.forEach { (btnTitle) in
            let action = UIAlertAction.init(title: btnTitle.localiz(), style: .default, handler: { (_ ) in
                handler?(btnTitle)
            })
            alertController.addAction(action)
        }
        
        let cancelAlert = UIAlertAction.init(title: "Cancel".localiz(), style: .cancel, handler: { (_ ) in
            handler?("Cancel".localiz())
        })
        
        cancelAlert.setValue(UIColor.systemRed, forKey: "titleTextColor")
        
        alertController.addAction(cancelAlert)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            present(alertController, controller: controller ?? AppDelegate().topViewController())
        }
    }
    
    class private func present(_ alert: UIAlertController, controller: UIViewController) {
        guard !(controller.isKind(of: UIAlertController.self)) else { return }
        controller.present(alert, animated: true, completion: nil)
    }
    
} //class

// MARK:- Extension for - AppDelegate
extension AppDelegate {
    
    /// Get Top viewController on app
    func rootController()-> UIViewController? {
        return UIApplication.shared.keyWindow?.rootViewController
    }
    
    func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return self.rootController() ?? UIViewController()
    }
    
} //extension
