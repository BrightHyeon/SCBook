//
//  HIGView.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/28.
//

import SwiftUI

struct HIGView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var hig: ListModel.HIG
//    @ObservedObject var cd: ColorDict
    var namespace: Namespace.ID
    @Binding var show: Bool
    
    var body: some View {
        //MARK: 여기부터하면돼
        let decription = partialColorString(all: hig.description, allColor: .primary, partial: "of", partialColor: .red)
        
        //        ZStack {
        ScrollView {
            ZStack {
                cover
                
                Button {
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.6)) {
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
            
            Text(decription) //AttributedString도 StringProtocol을 준수하기에 할당가능.
                .font(.body)
                .padding()
        }
        .ignoresSafeArea()
        .background(
            Theme.backgroundStyle(forScheme: colorScheme)
        )
        
        //MARK: 버튼을 여기 넣는 것보다 위 코드 ScrollView에 묶어야 함께 움직임~!
        //            Button {
        //                withAnimation(.spring(response: 0.6, dampingFraction: 0.6)) {
        //                    show.toggle()
        //                }
        //            } label: {
        //                Image(systemName: "xmark")
        //                    .font(.body.weight(.bold))
        //                    .foregroundColor(.secondary)
        //                    .padding(8)
        //                    .background(.ultraThinMaterial, in: Circle())
        //            }
        //            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        //            .padding(15)
        //        }
        
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
                Image(hig.imageName)
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
                    Text(hig.title)
                        .font(.largeTitle.weight(.bold))
                        .matchedGeometryEffect(id: "title", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(hig.subtitle)
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
        HIGView(hig: ListViewModel().list[0].hig!, namespace: namespace, show: .constant(true))
    }
}
