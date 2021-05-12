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
    
} //class


