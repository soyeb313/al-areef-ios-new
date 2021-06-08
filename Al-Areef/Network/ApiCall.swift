//
//  ApiCall.swift
//  Al-Areef
//
//  Created by Soyeb Sayyad on 29/04/21.
//

import UIKit
import Alamofire
import Foundation
import Loaf
import SVProgressHUD
class WebServiceHandler: NSObject {
    
    static var sharedInstance = WebServiceHandler()
    
    func postWebService(URL:String, paramDict: [String:Any], Header: HTTPHeaders?, viewController:UIViewController, complete:@escaping (_ response: [String:Any],_ RenewToken:Bool) -> Void) {
        if(Reachability.isConnectedToNetwork())
        {
            
           
            Alamofire.request(URL, method: .post, parameters: paramDict, encoding: JSONEncoding.default, headers: Header)
                
                .responseJSON { [self] response in
                    
                    switch response.result {
                    case .success:
                        let result = response.value
                        let JSON = result as! NSDictionary
                        let status = "\(String(describing:JSON["message"]!))"
                        
                        if status == "success"
                        {
                            if let refreshtoken = response.response?.allHeaderFields["refreshtoken"] as? String {
                                // use contentType here
                                Utility.Save_Value_Userdefauts(Key: User_defaults_Constants.refreshtoken, Value: refreshtoken)
                            }
                            if let access_token = response.response?.allHeaderFields["access_token"] as? String {
                                // use contentType here
                                Utility.Save_Value_Userdefauts(Key: User_defaults_Constants.access_token, Value: access_token)
                            }
                            
                            complete(response.result.value! as! [String : Any], false)
                        }
                        else if let exception = JSON["message"] as? String
                        {
                            DispatchQueue.main.async {
                            SVProgressHUD.dismiss()
                            }
                            let error = JSON as? Dictionary<String, AnyObject>
                            let message = "\(String(describing:exception))"
                            let code = "\(String(describing:error!["error_code"]!))"
                            if code == "1"
                            {
                                complete(JSON as! [String : Any], true)
                                
                            }
                            else{
                                Loaf(message, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "D11E4C"), icon: UIImage(named: "close"))), location: .top, sender: viewController).show()
                                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "otp_invalid"), object: nil)
                            }
                            
                        }
                        
                    case .failure(let error):
                        print(error)
                        SVProgressHUD.dismiss()
                        Utility.ShowAlertWithTitleAndMessage(vc: viewController, titleStr: "", messageStr: Utility.GetFailedMessage())
                        
                    }
                }
        }
        else
        {
            
            Utility.ShowAlertWithTitleAndMessage(vc: viewController, titleStr: "", messageStr: Utility.GetNoInternetMessage())
            
        }
    }
    
    
    
    func getWebService(URL:String, Header: HTTPHeaders?, viewController:UIViewController, complete:@escaping (_ response: [String:Any],_ RenewToken:Bool) -> Void) {
        if(Reachability.isConnectedToNetwork())
        {
            
            SVProgressHUD.show()
            
            Alamofire.request(URL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: Header)
                
                .responseJSON { response in
                    
                    switch response.result {
                    case .success:
                        let result = response.value
                        let JSON = result as! NSDictionary
                        print(JSON)
                        let status = "\(String(describing:JSON["status"]!))"
                        
                        if status == "success"
                        {
                            if let refreshtoken = response.response?.allHeaderFields["refreshtoken"] as? String {
                                // use contentType here
                                Utility.Save_Value_Userdefauts(Key: User_defaults_Constants.refreshtoken, Value: refreshtoken)
                            }
                            if let access_token = response.response?.allHeaderFields["access_token"] as? String {
                                // use contentType here
                                Utility.Save_Value_Userdefauts(Key: User_defaults_Constants.access_token, Value: access_token)
                            }
                            
                            complete(response.result.value! as! [String : Any], false)
                        }
                        else if let exception = JSON["exception"] as? Dictionary<String, AnyObject>
                        {
                            SVProgressHUD.dismiss()
                            let error = exception["error"] as? Dictionary<String, AnyObject>
                            let message = "\(String(describing:error!["message"]!))"
                            let code = "\(String(describing:error!["code"]!))"
                            if code == "E401"
                            {
                                complete(exception, true)
                            }
                            else
                            {
                                complete(exception,true)
                                Loaf(message, state: .custom(.init(backgroundColor: hexStringToUIColor(hex: "D11E4C"), icon: UIImage(named: "close"))), location: .top, sender: viewController).show()
                            }
                        }
                        
                    case .failure(let error):
                        print(error)
                        SVProgressHUD.dismiss()

                        Utility.ShowAlertWithTitleAndMessage(vc: viewController, titleStr: "", messageStr: Utility.GetFailedMessage())
                        
                    }
                }
        }
        else
        {
            SVProgressHUD.dismiss()

            Utility.ShowAlertWithTitleAndMessage(vc: viewController, titleStr: "", messageStr: Utility.GetNoInternetMessage())
            
        }
        
    }
    
//    func CallWebservice_RenewToken(viewController:UIViewController, complete:@escaping (_ response: Bool) -> Void) {
//        if(Reachability.isConnectedToNetwork())
//        {
//
//            SVProgressHUD.show()
//
//
//            let headers = [
//                "refreshToken": GetUserdefault(Key: User_defaults_Constants.refreshtoken),
//            ]
//            let url = WSRequest.updateLanguage()
//
//            Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers)
//
//                .responseJSON { response in
//
//                    switch response.result {
//                    case .success:
//                        let result = response.value
//                        let JSON = result as! NSDictionary
//                        print(JSON)
//                        let status = "\(String(describing:JSON["status"]!))"
//
//                        if status == "success"
//                        {
//                            if let refreshtoken = response.response?.allHeaderFields["refreshtoken"] as? String {
//                                // use contentType here
//                                Utility.Save_Value_Userdefauts(Key: User_defaults_Constants.refreshtoken, Value: refreshtoken)
//                            }
//                            if let access_token = response.response?.allHeaderFields["access_token"] as? String {
//                                // use contentType here
//                                Utility.Save_Value_Userdefauts(Key: User_defaults_Constants.access_token, Value: access_token)
//                            }
//                            Utility.Save_Value_Userdefauts(Key: User_defaults_Constants.RefreshTokenCount, Value: "0")
//                            complete(true)
//
//                            SVProgressHUD.dismiss()
//
//                        }
//                        else
//                        {
//                            SVProgressHUD.dismiss()
//                            let count = GetUserdefault(Key: User_defaults_Constants.RefreshTokenCount)
//                            if count == "3"
//                            {
//                                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LogoutUser"), object: nil)
//                            }
//                            else
//                            {
//                                Utility.Save_Value_Userdefauts(Key: User_defaults_Constants.RefreshTokenCount, Value: (Int(count)! + 1).description)
//
//                                complete(false)
//                            }
//
//                        }
//                    case .failure(let error):
//                        print(error)
//                        SVProgressHUD.dismiss()
//                        Utility.ShowAlertWithTitleAndMessage(vc: viewController, titleStr: "", messageStr: Utility.GetFailedMessage())
//
//                    }
//                }
//        }
//        else
//        {
//            SVProgressHUD.dismiss()
//
//            Utility.ShowAlertWithTitleAndMessage(vc: viewController, titleStr: "", messageStr: Utility.GetNoInternetMessage())
//
//        }
//
//    }
//
//
    
    
    
    
    
    
    
    
    
}
class AlamofireManager{
    
    // Update - SessionManager has been renamed to Session in Alamofire 5.0
    static let sharedSession: Alamofire.SessionManager = {
        
        let configuration = URLSessionConfiguration.default
        
        // Timeout in 180s
        configuration.timeoutIntervalForRequest = 180
        
        return Alamofire.SessionManager(configuration: configuration)
    }()
    
}
