//
//  LoginResponse.swift
//  BookMyPlace
//
//  Created by Mallika Roy on 28/03/24.
//

import Foundation

struct LoginRequest: Codable {
    let username : String
    let password : String
}

struct LoginResponse : Codable {
    let token : String?
    let username : String?
    let email : String?
    let errorModel : String?
}


