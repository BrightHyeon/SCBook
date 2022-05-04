//
//  PinkButton.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/05/02.
//

import SwiftUI

struct PinkButton: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    let text: String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        HStack {
            Text(text)
                .font(.title2).bold()
                .foregroundColor(.primary)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .frame(maxWidth: .infinity)
            Image(systemName: "chevron.right")
                .font(.title.bold())
                .foregroundColor(.secondary)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Theme.buttonColor(forScheme: colorScheme))
                .shadow(color: .white.opacity(0.7), radius: 10, x: -5, y: -5)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 10, y: 10)
        )
        .padding()
    }
}
