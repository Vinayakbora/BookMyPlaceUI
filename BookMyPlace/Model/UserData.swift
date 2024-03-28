//
//  UserData.swift
//  BookMyPlace
//
//  Created by Mallika Roy on 28/03/24.
//

import Foundation

struct UserRequest: Codable {
    let email : String?
    let name : String?
    let username : String?
    let password : String?
}


struct UserResponse: Codable {
    let id : Int?
    let name : String?
    let email : String?
    let username : String?
}
