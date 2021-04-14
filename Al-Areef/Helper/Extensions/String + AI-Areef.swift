//
//  String + AI-Areef.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 09/04/21.
//

import Foundation

extension String{
    
    var isNumeric: Bool {
        return CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: self))
    }
    
}
