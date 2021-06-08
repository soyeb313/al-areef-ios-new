

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

    class func GetCounslingTopics() -> String {
        return WSRequest.GetBaseURL() +  "api/ws-get-packges"
    }
    
    class func GetCounslingTopicsDuration() -> String {
        return WSRequest.GetBaseURL() +  "api/ws-get-services-duration"
    }
    
    class func GetCounsultingPerson() -> String {
        return WSRequest.GetBaseURL() +  "api/ws-get-consultant-person-listing"
    }
    
    class func GetCounsultantDetails() -> String {
        return WSRequest.GetBaseURL() +  "api/ws-get-consultant-detail"
    }
    
    class func PlaceTextOrder() -> String {
        return WSRequest.GetBaseURL() +  "api/ws-place-text-service"
    }
    
    class func Gettrail() -> String {
        return WSRequest.GetBaseURL() +  "api/ws-get-trails"
    }
    
    class func CreateRegularWorkSchedule() -> String {
           return WSRequest.GetBaseURL() +  "api/ws-create-regular-work-schedule"
    }
    class func createOccasionalWorkSchedule() -> String {
           return WSRequest.GetBaseURL() +  "api/ws-create-occasional-work-schedule"
    }
    
    class func getWorkScheduleList() -> String {
           return WSRequest.GetBaseURL() +  "api/work-schedule-list"
    }
    
    class func getCountryList() -> String {
           return WSRequest.GetBaseURL() +  "api/ws-get-country"
    }
    
    class func getCityList() -> String {
           return WSRequest.GetBaseURL() +  "api/ws-get-city"
    }
    class func customerRegistrationStep2() -> String {
           return WSRequest.GetBaseURL() +  "api/ws-customer-register-step-2"
    }
}
//CorporatRegisteration
   

