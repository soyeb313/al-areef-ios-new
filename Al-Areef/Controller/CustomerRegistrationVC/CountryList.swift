//
//  CountryList.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 07/06/21.
//

import Foundation
// MARK: - CountryList
struct CountryList: Codable {
    var errorCode: Int?
    var message: String?
    var data: [Country]?

    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message, data
    }
}

// MARK: - Datum
struct Country: Codable {
    var id: Int?
    var name, lang, createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, name, lang
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
