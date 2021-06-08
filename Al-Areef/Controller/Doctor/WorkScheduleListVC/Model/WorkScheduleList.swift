//
//  WorkScheduleList.swift
//  Al-Areef
//
//  Created by Amruta Warankar on 06/06/21.
//

import Foundation
// MARK: - WorkScheduleList
struct WorkScheduleList: Codable {
    var errorCode: Int?
    var message: String?
    var data: DataClass?

    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message, data
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    var regularWorkSchedule: [RegularWorkSchedule]?
    var occasionalWorkSchedule: [OccasionalWorkScheduleList]?

    enum CodingKeys: String, CodingKey {
        case regularWorkSchedule = "regular_work_schedule"
        case occasionalWorkSchedule = "occasional_work_schedule"
    }
}

// MARK: - OccasionalWorkSchedule
struct OccasionalWorkScheduleList: Codable {
    var id: Int?
    var startDate, endDate, startTime, endTime: String?
    var availabilityType, reason, userID, createdAt: String?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case startDate = "start_date"
        case endDate = "end_date"
        case startTime = "start_time"
        case endTime = "end_time"
        case availabilityType = "availability_type"
        case reason
        case userID = "user_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - RegularWorkSchedule
struct RegularWorkSchedule: Codable {
    var id: Int?
    var day, morningStartTime, morningEndTime, eveningStartTime: String?
    var eveningEndTime, createdAt, updatedAt, userID: String?

    enum CodingKeys: String, CodingKey {
        case id, day
        case morningStartTime = "morning_start_time"
        case morningEndTime = "morning_end_time"
        case eveningStartTime = "evening_start_time"
        case eveningEndTime = "evening_end_time"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case userID = "user_id"
    }
}
