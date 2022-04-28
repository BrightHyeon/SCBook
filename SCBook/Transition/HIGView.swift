//
//  HIGView.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/28.
//

import SwiftUI

struct HIGView: View {
    
    var namespace: Namespace.ID
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            ScrollView {
                cover
                
                Text("The system offers a range of button styles that support extensive customization while providing built-in interaction states, accessibility support, and appearance adaptation. In addition, there are several system-defined button types — such as toggle, pop-up, and pull-down — that support a variety of specific use cases.")
                    .font(.body.weight(.semibold))
                    .padding()
            }
            .ignoresSafeArea()
            .background(
                AngularGradient(
                    gradient: Gradient(stops: [
                        .init(color: Color(#colorLiteral(red: 0.9541666507720947, green: 0.6599652767181396, blue: 0.6599652767181396, alpha: 1)), location: 0.14326532185077667),
                        .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), location: 0.4985717535018921),
                        .init(color: Color(#colorLiteral(red: 0.9541666507720947, green: 0.6599652767181396, blue: 0.6599652767181396, alpha: 1)), location: 0.8701561689376831),
                        .init(color: Color(#colorLiteral(red: 0.9041666388511658, green: 0.4596180319786072, blue: 0.4596180319786072, alpha: 1)), location: 0.9971840381622314)]),
                    center: UnitPoint(x: 0.4999999056591794, y: 0.5000000405261534),
                    angle: .init(degrees: 45)
                )
            )
            
            
            Button {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                    show.toggle()
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(15)
        }
        .navigationBarBackButtonHidden(true)
//        .navigationBarHidden(true) //이게 안먹힌다...
        .navigationTitle("")
        .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
    }
    
    var cover: some View {
        VStack {
            VStack {
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .foregroundStyle(.black)
            .background(
                Image("Button")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "image", in: namespace)
            )
            .mask(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .matchedGeometryEffect(id: "mask", in: namespace)
            )
            .overlay(
                VStack(alignment: .leading, spacing: 12) {
                    Text("Buttons")
                        .font(.largeTitle.weight(.bold))
                        .matchedGeometryEffect(id: "title", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Controls")
                        .font(.body.weight(.semibold))
                        .matchedGeometryEffect(id: "subtitle", in: namespace)
                }
                    .padding(20)
                    .background(
                        Rectangle()
                            .fill(Material.ultraThickMaterial)
                            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                            .blur(radius: 30)
                            .matchedGeometryEffect(id: "blur", in: namespace)
                    )
                    .offset(y: 100)
                    .padding(20)
        )
            
        }
    }
}

struct HIGView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        HIGView(namespace: namespace, show: .constant(true))
    }
}
