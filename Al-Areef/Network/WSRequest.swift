

import Foundation

public class WSRequest {
    
    class func GetBaseURL() -> String {
        let baseURL = "http://alarif.itindiatechnology.in/"
        return baseURL
    }
    class func VerifyOtp() -> String {
        return WSRequest.GetBaseURL() + "api/ws-verify-otp"
    }
    class func SendOtp() -> String {
        return WSRequest.GetBaseURL() + "api/ws-send-otp"
    }
    class func CustomerRegister() -> String {
        return WSRequest.GetBaseURL() +  "api/ws-customer-register"
    }
    class func LoginUser() -> String {
        return WSRequest.GetBaseURL() +  "api/ws-login-user"
    }
   
    }
   
   

