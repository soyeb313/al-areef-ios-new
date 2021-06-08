//
//  UserData.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 07/05/21.
//

import Foundation

final class UserData {

    enum userDataKeys : String {
        case language           = "LANGUAGE_KEY"
        case UserProfileData            = "UserProfileData"
        case LoggedInUserType           = "LoggedInUserType"
    }
    
    // MARK:- init Methods
    private init() {}
    private static let userdefault = UserDefaults.standard
    
    // MARK:- Save Data
    class func saveData(_ type: userDataKeys, _ value: Any) {
        userdefault.set(value, forKey: type.rawValue)
    }
    
    // MARK:- Get Data
    class func returnValue(_ type: userDataKeys)->Any? {
        return userdefault.value(forKey: type.rawValue)
    }
    
    // MARK:- Synchronize
    class func synchronize() {
        userdefault.synchronize()
    }
    
    // MARK:- Clear Data
    class func clearData() {
        let domain = Bundle.main.bundleIdentifier!
        userdefault.removePersistentDomain(forName: domain)
        userdefault.synchronize()
    }
    
    class func saveCodableData<T: Codable>(for type: userDataKeys, value: T) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(value) {
            userdefault.set(encoded, forKey: type.rawValue)
        }
    }
    
    class func returnCodableData<T: Codable>(for type: userDataKeys, valueType : T.Type)->T? {
        let decoder = JSONDecoder()
        if let user_data = userdefault.object(forKey: type.rawValue) as? Data{
            if let decoded = try? decoder.decode(valueType, from: user_data){
                return decoded
            }else{
                return nil
            }
        }else{
            return nil
        }
    }
} //class


