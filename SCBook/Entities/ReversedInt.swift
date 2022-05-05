//
//  fsdfdsafadsf.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/05/04.
//

import SwiftUI

struct ReversedInt: View {
    var body: some View {
        VStack {
            ForEach((0...10).reversed(), id: \.self) {
                Text("\($0)")
            }
        }
    }
}

struct fsdfdsafadsf_Previews: PreviewProvider {
    static var previews: some View {
        ReversedInt()
    }
}
