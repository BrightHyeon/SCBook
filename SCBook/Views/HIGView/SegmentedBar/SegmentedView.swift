//
//  SegmentedView.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/05/04.
//

import SwiftUI

struct SegmentedView: View {
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .systemMint
        UISegmentedControl.appearance()
    }
    
    @State private var selection: Int = 0
    var segments = ["A", "B", "C", "D"]
    @State private var selected: Int = 0
    @State private var selecting: Int = 0
    @State private var select: Int = 0
    
    var body: some View {
        VStack(spacing: 60) {
            
            VStack(alignment: .leading) {
                Text("Default Style").bold()
                
                Picker(selection: $selection) {
                    ForEach(0...segments.count-1, id: \.self) { index in
                        Text("\(segments[index])").tag(index)
                    }
                } label: {}
                    .pickerStyle(.segmented)
            }
            
            VStack(alignment: .leading) {
                Text("Custom Style").bold()
                CustomSegmented(selected: $selected)
                    .frame(height: 57)
            }
            
            VStack(alignment: .leading) {
                Text("Move Animation Style").bold()
                MovingSegmented(selected: $selecting)
                    .frame(height: 57)
            }
            
            VStack(alignment: .leading) {
                Text("Sticky Animation Style").bold()
                MountainSegmented(selected: $select)
                    .frame(height: 57)
            }
        }
        .padding()
    }
}

struct SegmentedView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedView()
    }
}

struct CustomSegmented: View {
    
    @Binding var selected: Int
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Button {
                    withAnimation {
                        self.selected = 0
                    }
                } label: {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(selected == 0 ? .pink : .secondary)
                        .padding(13)
                        .padding(.horizontal)
                        .background(
                            Capsule()
                                .fill(selected == 0 ? Color.offWhite : Color.clear)
                        )
                }
                Button {
                    withAnimation {
                        self.selected = 1
                    }
                } label: {
                    Image(systemName: "star.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(selected == 1 ? .yellow : .secondary)
                        .padding(13)
                        .padding(.horizontal)
                        .background(
                            Capsule()
                                .fill(selected == 1 ? Color.offWhite : Color.clear)
                        )
                }
                Button {
                    withAnimation {
                        self.selected = 2
                        print(selected)
                    }
                } label: {
                    Image(systemName: "moon.stars.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(selected == 2 ? .blue : .secondary)
                        .padding(13)
                        .padding(.horizontal)
                        .background(
                            Capsule()
                                .fill(selected == 2 ? Color.offWhite : Color.clear)
                        )
                }
                Button {
                    withAnimation {
                        self.selected = 3
                        print(selected)
                    }
                } label: {
                    Image(systemName: "leaf.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 20, height: 20)
                        .foregroundColor(selected == 3 ? .green : .secondary)
                        .padding(13)
                        .padding(.horizontal)
                        .background(
                            Capsule()
                                .fill(selected == 3 ? Color.offWhite : Color.clear)
                        )
                }
            }
            .padding(5)
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(Color.black)
            .clipShape(Capsule())
        }
    }
}

struct MovingSegmented: View {
    
    @Namespace var namespace
    @Binding var selected: Int
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                
                ZStack {
                    Button {
                        withAnimation {
                            self.selected = 0
                        }
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                            withAnimation {
//                                self.selected = 1
//                            }
//                        }
                    } label: {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(selected == 0 ? .pink : .secondary)
                            .padding(13)
                            .padding(.horizontal)
                    }
                    
                    if selected == 0 {
                        Capsule()
                            .fill(Color.offWhite.opacity(0.3))
                            .matchedGeometryEffect(id: "segment", in: namespace)
                    }
                }
                ZStack {
                    Button {
                        withAnimation {
                            self.selected = 1
                        }
                    } label: {
                        Image(systemName: "star.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(selected == 1 ? .yellow : .secondary)
                            .padding(13)
                            .padding(.horizontal)
                    }
                    
                    if selected == 1 {
                        Capsule()
                            .fill(Color.offWhite.opacity(0.3))
                            .matchedGeometryEffect(id: "segment", in: namespace)
                    }
                }
                
                ZStack {
                    Button {
                        withAnimation {
                            self.selected = 2
                            print(selected)
                        }
                    } label: {
                        Image(systemName: "moon.stars.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(selected == 2 ? .blue : .secondary)
                            .padding(13)
                            .padding(.horizontal)
                    }
                    
                    if selected == 2 {
                        Capsule()
                            .fill(Color.offWhite.opacity(0.3))
                            .matchedGeometryEffect(id: "segment", in: namespace)
                    }
                }
                
                ZStack {
                    Button {
                        withAnimation {
                            self.selected = 3
                            print(selected)
                        }
                    } label: {
                        Image(systemName: "leaf.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        //                        .frame(width: 20, height: 20)
                            .foregroundColor(selected == 3 ? .green : .secondary)
                            .padding(13)
                            .padding(.horizontal)
                            .tag(3)
                    }
                    
                    if selected == 3 {
                        Capsule()
                            .fill(Color.offWhite.opacity(0.3))
                            .matchedGeometryEffect(id: "segment", in: namespace)
                    }
                }
            }
            .animation(.linear(duration: 0.2), value: selected)
            .padding(5)
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(Color.black)
            .clipShape(Capsule())
        }
    }
}

struct MountainSegmented: View {
    
    @Namespace var namespace
    @Binding var selected: Int
    @State private var mountainHeight: Double = 57
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                
                ZStack(alignment: .bottom) {
                    
                    if selected == 0 {
                        Mountain(height: $mountainHeight)
                            .foregroundColor(.purple)
                            .matchedGeometryEffect(id: "segment", in: namespace)
                            .offset(x: 0, y: 10)
                    }
                    
                    Button {
                        withAnimation {
                            self.selected = 0
                            self.mountainHeight = 10
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                            withAnimation {
                                self.mountainHeight = 57
                            }
                        }
                    } label: {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(selected == 0 ? .pink : .secondary)
                            .padding(13)
                            .padding(.horizontal)
                    }
                }
                .frame(width: geometry.size.width / 5)
                
                ZStack(alignment: .bottom) {
                    
                    if selected == 1 {
                        Mountain(height: $mountainHeight)
                            .foregroundColor(.purple)
                            .matchedGeometryEffect(id: "segment", in: namespace)
                            .offset(x: 0, y: 10)
                    }
                    
                    Button {
                        withAnimation {
                            self.selected = 1
                            self.mountainHeight = 10
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                            withAnimation {
                                self.mountainHeight = 57
                            }
                        }
                    } label: {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(selected == 1 ? .yellow : .secondary)
                            .padding(13)
                            .padding(.horizontal)
                    }
                }
                .frame(width: geometry.size.width / 5)
                
                ZStack(alignment: .bottom) {
                    
                    if selected == 2 {
                        Mountain(height: $mountainHeight)
                            .foregroundColor(.purple)
                            .matchedGeometryEffect(id: "segment", in: namespace)
                            .offset(x: 0, y: 10)
                    }
                    
                    Button {
                        withAnimation {
                            self.selected = 2
                            self.mountainHeight = 10
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                            withAnimation {
                                self.mountainHeight = 57
                            }
                        }
                    } label: {
                        Image(systemName: "moon.stars.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(selected == 2 ? .blue : .secondary)
                            .padding(13)
                            .padding(.horizontal)
                    }

                }
                .frame(width: geometry.size.width / 5)
                
                ZStack(alignment: .bottom) {
                    if selected == 3 {
                        Mountain(height: $mountainHeight)
                            .foregroundColor(.purple)
                            .matchedGeometryEffect(id: "segment", in: namespace)
                            .offset(x: 0, y: 10)
                    }
                    
                    Button {
                        withAnimation {
                            self.selected = 3
                            self.mountainHeight = 10
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                            withAnimation {
                                self.mountainHeight = 60
                            }
                        }
                    } label: {
                        Image(systemName: "leaf.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .aspectRatio(contentMode: .fit)
                        //                        .frame(width: 20, height: 20)
                            .foregroundColor(selected == 3 ? .green : .secondary)
                            .padding(13)
                            .padding(.horizontal)
                            .tag(3)
                    }
                }
                .frame(width: geometry.size.width / 5)
            }
            .animation(.linear(duration: 0.2), value: selected)
            .padding(5)
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(Color.black)
            .clipShape(Capsule())
        }
    }
}
