//
//  SCBookApp.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/26.
//

import SwiftUI

@main
struct SCBookApp: App {
    
    let startOnboard = StartOnboard()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(startOnboard)
        }
    }
}
