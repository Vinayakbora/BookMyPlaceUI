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
            .onAppear(perform: {
                if let _ = UserDefaults.standard.value(forKey: "token") as? String {
                    appRootManager.currentRoot = .dashboard
                } else {
                    appRootManager.currentRoot = .login
                }
            })
            .environmentObject(appRootManager)
        }
    }
}
