//
//  ContentView.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/26.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var startOnboard: StartOnboard
    
    var body: some View {
        if startOnboard.isCountinue {
            MainListView()
        } else {
            Onboarding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(StartOnboard())
    }
}
