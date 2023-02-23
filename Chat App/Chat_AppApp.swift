//
//  Chat_AppApp.swift
//  Chat App
//
//  Created by Aakash  Bondwal  on 23/02/23.
//

import SwiftUI
import Firebase

@main
struct Chat_AppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
