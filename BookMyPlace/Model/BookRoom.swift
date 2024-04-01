//
//  BookRoom.swift
//  BookMyPlace
//
//  Created by Parag Deshpande2 on 01/04/24.
//

import Foundation

struct BookRoomRequest : Codable {
   let meetingRoom : MeetingRoomTemp?
    let userEmail :String?
    let startTime : String?
     let endTime : String?
    let bookingDate : String?
}

struct BookRoomResponse : Decodable{
    let data : MeetingRoom
}

struct MeetingRoomTemp : Codable{
    let id : Int
}

