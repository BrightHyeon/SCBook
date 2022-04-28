//
//  MyVStack.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/27.
//

import SwiftUI

struct MyVStack<Content: View>: View {
    
    @ViewBuilder let content: () -> Content
    
    var body: some View {
        VStack {
        VStack(alignment: .leading, spacing: 10) {
            content()
        }
            Spacer()
        }
    }
}
