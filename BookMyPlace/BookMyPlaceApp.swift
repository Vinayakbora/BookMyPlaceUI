//
//  BookMyPlaceApp.swift
//  BookMyPlace
//
//  Created by Mallika Roy on 22/03/24.
//

import SwiftUI

@main
struct BookMyPlaceApp: App {
    var body: some Scene {
        WindowGroup {
            
            if let token = UserDefaults.standard.value(forKey: "token"){
                TabScreen()
            } else {
                SignIn()
            }
            
        }
    }
}
