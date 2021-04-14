//
//  UIViewController + Al-Areef.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 09/04/21.
//

import UIKit

extension UIViewController : UIGestureRecognizerDelegate {
    
    
    
    var isModal: Bool {
        let presentingIsModal = presentingViewController != nil
        let presentingIsNavigation = navigationController?.presentingViewController?.presentedViewController == navigationController
        let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController
        return presentingIsModal || presentingIsNavigation || presentingIsTabBar
    }
    
    
    
    /**
     If current controller is present then that would dismiss other wise it pop to last controller.
     isAnimation: is Bool default is true. For to confirm animation at time of dismiss controller.
     */
    func dismissCurrentVC(isAnimated: Bool = true){
        if isModal {
            self.dismiss(animated: isAnimated, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    //MARK:- Dismiss Keyboard
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setNavigation(){
//        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    func setNavigationEnable(_ flag : Bool){
        if flag {
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
            self.navigationController?.interactivePopGestureRecognizer?.delegate = self
            //
        }else{
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
            self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
            //
        }
        
    }

    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        true
    }
    
   
}

extension UINavigationController {

    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        return true
        
    }
}
