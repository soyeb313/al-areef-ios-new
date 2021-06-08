//
//  UserDetails.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 06/06/21.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let members = try? newJSONDecoder().decode(Members.self, from: jsonData)

import Foundation

// MARK: - UserDetails
struct UserDetails: Codable {
    var id: Int?
    var username, fullName, firstName, lastName: String?
    var age, streetAddress, area, country: String?
    var prefferedLang, mobileNumber, gender, idNumber: String?
    var email, city, lat, long: String?
    var otp, userType, companyName, conatctName: String?
    var companyStaff, conatctNo, companyLicense, companyIndustry: String?
    var companySummary, companySite, facebookURL, linkedInURL: String?
    var isVerified, isActive, roleID, createdAt: String?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, username
        case fullName = "full_name"
        case firstName = "first_name"
        case lastName = "last_name"
        case age
        case streetAddress = "street_address"
        case area, country
        case prefferedLang = "preffered_lang"
        case mobileNumber = "mobile_number"
        case gender
        case idNumber = "id_number"
        case email, city, lat, long, otp
        case userType = "user_type"
        case companyName = "company_name"
        case conatctName = "conatct_name"
        case companyStaff = "company_staff"
        case conatctNo = "conatct_no"
        case companyLicense = "company_license"
        case companyIndustry = "company_industry"
        case companySummary = "company_summary"
        case companySite = "company_site"
        case facebookURL = "facebook_url"
        case linkedInURL = "linkedIn_url"
        case isVerified = "is_verified"
        case isActive = "is_active"
        case roleID = "role_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
