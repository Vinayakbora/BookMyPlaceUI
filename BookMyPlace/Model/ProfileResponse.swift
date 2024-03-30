//
//  ProfileResponse.swift
//  BookMyPlace
//
//  Created by Mallika Roy on 30/03/24.
//

import Foundation

struct ProfileResponse: Codable {
    let data: Profile?
    let message: String?
}

struct Profile: Codable {
    let id: Int?
    let name, username, email, password: String?
    let timestamp: String?

}

