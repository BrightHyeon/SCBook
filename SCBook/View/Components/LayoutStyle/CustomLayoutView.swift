//
//  CustomLayoutView.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/05/01.
//

import SwiftUI

struct CustomLayoutView: View {
    
    @State var scale: CGFloat = 1.0
    
    var body: some View {
        ScrollView {
            //MARK: Custom View
            CustomLayout(items: 1...100, id: \.self) { item in
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .circular)
                        .fill(
                            item % 3 == 0 ? .red : (item % 3 == 1 ? .blue : .green)
                        )
                    
                    Text("\(item)")
                        .font(.title.bold())
                }
            }
            .padding(10)
        }
        .navigationTitle("Custom Layout")
    }
}

struct CustomLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        CustomLayoutView()
    }
}
