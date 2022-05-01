//
//  CustomLayoutView.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/05/01.
//

import SwiftUI

struct CustomLayoutView: View {
    
    var body: some View {
        ScrollView {
            //MARK: Custom View
            CustomLayout(items: 1...100, id: \.self) { item in
                Image(systemName: "star.fill")
                    .resizable()
//                ZStack {
//                    RoundedRectangle(cornerRadius: 20, style: .circular)
//                        .fill(
//                            item % 3 == 0 ? .red : (item % 3 == 1 ? .blue : .green)
//                        )
//
//
//                    Text("\(item)")
//                        .font(.title.bold())
//                }
            }
            .padding(10)
        }
    }
}

struct CustomLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        CustomLayoutView()
    }
}
