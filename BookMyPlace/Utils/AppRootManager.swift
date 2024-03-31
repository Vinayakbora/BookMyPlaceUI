//
//  AppRootManager.swift
//  BookMyPlace
//
//  Created by Akash Gurnale2 on 31/03/24.
//

import Foundation

final class AppRootManager: ObservableObject {
    
    @Published var currentRoot: eAppRoots = .login
    
    enum eAppRoots {
        case login
        case dashboard
    }
}
