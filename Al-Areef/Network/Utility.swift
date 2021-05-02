

import UIKit
import Foundation


public class Utility {
    class func SetUserData(data: NSDictionary)
    {
        appDelegate.defaultsData.setValuesForKeys(data as! [String : AnyObject]);
        appDelegate.defaultsData.synchronize();
    }
    class func Save_Value_Userdefauts(Key: String,Value:String)
    {
        UserDefaults.standard.set(Value, forKey: Key)
        UserDefaults.standard.synchronize()
    }
    class func AcceptNumbersOnly() -> String
    {
        return "0123456789"
        
    }
    class func token() -> String
    {
        return "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsInRva2VuVHlwZSI6ImFjY2Vzcy10b2tlbiJ9.eyJ1c2VySWQiOjExMTAwLCJtb2JpbGVOdW1iZXIiOiIxMTExMTExMTExIiwicm9sZSI6IklIQiIsImlzQWRtaW4iOmZhbHNlLCJpYXQiOjE2MTY1NjY2MzksImV4cCI6MTYxNjY1MzAzOX0.MVXIxkshGAlaP64LRjfq-99CveQF7EYwrH3uKoxmpl77fN8AUOopApQfVKpEAn-DPazMK9nX-D7LQOJ78KdyUA"
    }
    class func Google_Key() -> String
    {
       // return "AIzaSyBg7_4UnWDxGO-1YrcZgkEOE4567X-9JZs" //utech api
        //return "AIzaSyACk97OoztAe87cSp8jRwdUoIQXTEl88gY"
        return "AIzaSyDcbYS8DGwZF7erPOyrmdNKhKfDBTs4WE0"
    }
    class func FCM() -> String
    {
        return UserDefaults.standard.string(forKey: User_defaults_Constants.fcm_token)!
        
    }
    class func StatusBarHeight() -> CGFloat
    {
        var height = CGFloat()
        
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            height = (window?.windowScene?.statusBarManager?.statusBarFrame.height)! + 50
        } else {
            height = UIApplication.shared.statusBarFrame.height + 50
        }

        return height
    }
    
//    class func Autherization() -> String
//    {
//        return UserDefaults.standard.string(forKey: User_defaults_Constants.Authentication_code)!
//
//    }

    static func ShowAlertWithTitleAndMessage(vc: UIViewController, titleStr:String, messageStr:String) -> Void {
        let alert = UIAlertController(title: titleStr, message: messageStr, preferredStyle: UIAlertController.Style.alert);
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        vc.present(alert, animated: true, completion: nil)
    }
    
     func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    static func isValidMobile(testStr:String) -> Bool {
        let PHONE_REGEX = "^[7-9][0-9]{9}$";
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: testStr)
        return result
    }
    static func isValidPassword(testStr:String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$&*])(?=.*\\d)[a-zA-Z\\d\\W]{6,}$"
        let password = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        return password.evaluate(with: testStr)
    }
    
    
    class func GetAlertWithTitleAndMessage(title: String, message: String, buttonTitle: String) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alertController.addAction(action)
        return alertController
    }
    
    class func GetNoInternetMessage() -> String {
        return "Internet connection not available"
    }
    class func GetFailedMessage() -> String {
        return "Failed\nPlease try again"
    }
    static func hexStringToUIColor (hex:String) -> UIColor {
        
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        
        
        if (cString.hasPrefix("#")) {
            
            cString.remove(at: cString.startIndex)
            
        }
        
        
        
        if ((cString.count) != 6) {
            
            return UIColor.gray
            
        }
        
        
        
        var rgbValue:UInt32 = 0
        
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        
        
        return UIColor(
            
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            
            alpha: CGFloat(1.0)
            
        )
        
    }
    
    
}
