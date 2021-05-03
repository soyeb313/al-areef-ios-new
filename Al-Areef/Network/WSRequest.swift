

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
    class func ConsultantRegisterStep1() -> String {
        return WSRequest.GetBaseURL() +  "api/ws-consultant-register-step-1"
    }
    class func ConsultantAddAcadmic() -> String {
        return WSRequest.GetBaseURL() +  "api/ws-consultant-register-add-academic"
    }
    class func ConsultantAddAcadmic2() -> String {
        return WSRequest.GetBaseURL() +  "api/ws-consultant-register-add-certificate"
    }
    class func ConsultantAddWorkExp() -> String {
        return WSRequest.GetBaseURL() +  "api/ws-consultant-register-add-work-experience"
    }
    class func ConsultantAddProfileDesc() -> String {
        return WSRequest.GetBaseURL() +  "api/ws-consultant-register-add-profile"
    }
    class func CorporatRegisteration() -> String {
        return WSRequest.GetBaseURL() +  "api/ws-corporate-register"
    }

}
//CorporatRegisteration
   

