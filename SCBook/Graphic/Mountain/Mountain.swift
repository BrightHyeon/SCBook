//
//  Mountain.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/05/05.
//

import SwiftUI

struct Mountain: View {
    
    @Binding var height: Double
    
    var body: some View {
        MountainDraw()
            .frame(width: 120, height: height)
    }
}

struct Mountain_Previews: PreviewProvider {
    static var previews: some View {
        Mountain(height: .constant(100))
    }
}
