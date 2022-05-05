//
//  TextRotationView.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/05/04.
//

import SwiftUI
import SwiftUIX

struct TextRotationView: View {
    var body: some View {
        ScrollView {
            Text("Hello, I’m Tamna. I developed the view inside the room. To tell you my impressions, First off, I liked the curriculum of this academy. We were developed after planning with a clear goal, so I think we were able to do it with more interest. As I followed this curriculum, I could see that my coding skills were improving. So I’m looking forward to the next process also. Thank you.")
                .font(.title, weight: .bold)
                .foregroundColor(.gray)
                .lineSpacing(10)
                .multilineTextAlignment(.center)
                .rotationEffect(.degrees(45))
                .padding()

            Text("Hello, I’m Tamna. I developed the view inside the room. To tell you my impressions, First off, I liked the curriculum of this academy. We were developed after planning with a clear goal, so I think we were able to do it with more interest. As I followed this curriculum, I could see that my coding skills were improving. So I’m looking forward to the next process also. Thank you.")
                .font(.title, weight: .bold)
                .foregroundColor(.gray)
                .lineSpacing(10)
                .multilineTextAlignment(.center)
                .rotationEffect(.degrees(-20), anchor: UnitPoint(x: 0, y: 0))
                .padding()
            
            Text("*Hello, I’m Tamna. I developed the view inside the room. To tell you my impressions, First off, I liked the curriculum of this academy. We were developed after planning with a clear goal, so I think we were able to do it with more interest. As I followed this curriculum, I could see that my coding skills were improving. So I’m looking forward to the next process also. Thank you.*")
                .font(.title, weight: .bold)
                .foregroundColor(.gray)
                .lineSpacing(10)
                .multilineTextAlignment(.center)
                .rotation3DEffect(.degrees(60), axis: (x: 1,y: 0,z: 0))
                .shadow(color: .gray, radius: 2, x: 0, y: 15)
                .padding()
            
            Text("*Hello, I’m Tamna. I developed the view inside the room. To tell you my impressions, First off, I liked the curriculum of this academy. We were developed after planning with a clear goal, so I think we were able to do it with more interest. As I followed this curriculum, I could see that my coding skills were improving. So I’m looking forward to the next process also. Thank you.*")
                .font(.title, weight: .bold)
                .foregroundColor(.gray)
                .lineSpacing(10)
                .multilineTextAlignment(.center)
                .rotation3DEffect(.degrees(45), axis: (x: 1,y: 1,z: 0))
                .shadow(color: .gray, radius: 2, x: -12, y: 12)
                .padding()
            
            Spacer().frame(height: 100)
        }
    }
}

struct TextRotationView_Previews: PreviewProvider {
    static var previews: some View {
        TextRotationView()
    }
}
