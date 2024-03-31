//
//  BookMyPlaceApp.swift
//  BookMyPlace
//
//  Created by Mallika Roy on 22/03/24.
//

import SwiftUI

@main
struct BookMyPlaceApp: App {
    
    @StateObject private var appRootManager = AppRootManager()
    
    var body: some Scene {
        WindowGroup {
            Group {
                switch appRootManager.currentRoot {
                case .login:
                    SignIn()
                case .dashboard:
                    TabScreen()
                }
            }
            .environmentObject(appRootManager)
        }
    }
}
