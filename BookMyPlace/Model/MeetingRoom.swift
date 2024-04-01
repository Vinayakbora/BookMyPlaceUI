//
//  MeetingRoom.swift
//  BookMyPlace
//
//  Created by Parag Deshpande2 on 31/03/24.
//

import Foundation
struct MeetingRoomRequest: Codable {
    
    
    let locationId : Int?
    
}

struct MeetingRoomResponse : Decodable  {
    
  
    
    let data : [MeetingRoom]?
    let message : String?
}

struct BookMeetingRoomResponse : Decodable  {
    
  
    
    let data : BookRoomTempResponse
    let message : String
}

struct BookRoomTempResponse : Decodable{
    let id : Int
    let meetingRoom : MeetingRoom
    
}

struct MeetingRoom : Identifiable, Decodable{
    let id : Int
    let name : String
    let location : Location
}


