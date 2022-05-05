//
//  TextFieldView.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/05/04.
//

import SwiftUI

struct TextFieldView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @State private var text1: String = ""
    @State private var text2: String = ""
    @State private var text3: String = ""
    @State private var text4: String = ""
    
    var body: some View {
        ZStack {
            
            Color.offWhite
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Group {
                        Text("TextField Style")
                            .font(.title, weight: .bold)
                        
                        Text("Default(Plain) Style")
                            .font(.subheadline, weight: .semibold)
                            .foregroundColor(.gray)
                        TextField(" @pos.idserve.net", text: $text1)
                            .modifier(ClearButton(text: $text1))
                        
                        Text("Underline Style")
                            .font(.subheadline, weight: .semibold)
                            .foregroundColor(.gray)
                        TextField(" @pos.idserve.net", text: $text1)
                            .modifier(ClearButton(text: $text1))
                            .underlineTextField()
                        
                        
                        Text("RoundedBorder Style")
                            .font(.subheadline, weight: .semibold)
                            .foregroundColor(.gray)
                        TextField(" @pos.idserve.net", text: $text2)
                            .modifier(ClearButton(text: $text2))
                            .textFieldStyle(.roundedBorder)
                        
                        Text("LinearGradient Style")
                            .font(.subheadline, weight: .semibold)
                            .foregroundColor(.gray)
                        TextField(" @pos.idserve.net", text: $text1)
                            .extensionTextFieldView(roundedCornes: 10, startColor: .pink.opacity(0.5), endColor: .white)
                            .modifier(ClearButton(text: $text1))
                    }
                    Group {
                        Text("Neumorphism Style")
                            .font(.subheadline, weight: .semibold)
                            .foregroundColor(.gray)
                        TextField(" @pos.idserve.net", text: $text3)
                            .modifier(ClearButton(text: $text3))
                            .modifier(NeumorphismTextField())
                        
                        Text("Neumorphism Style2")
                            .font(.subheadline, weight: .semibold)
                            .foregroundColor(.gray)
                        NeumorphicStyleTextField(textField: TextField("@pos.idserve.net", text: $text4), imageName: "star.fill")
                    }
                }
                .padding()
            }
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}

struct ClearButton: ViewModifier {
    
    @Binding var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            
            content
                .disableAutocorrection(true) //MARK: 자동완성 없애주는 친구.
                .autocapitalization(.none) //MARK: 첫 글자 대문자 안나오게.
            
            if !text.isEmpty {
                Button {
                    self.text = ""
                } label: {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(Color(UIColor.opaqueSeparator))
                    
                }
                .padding(.trailing, 10)
            }
        }
    }
}

struct NeumorphismTextField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 7, leading: 5, bottom: 7, trailing: 5))
            .contentShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color.offWhite)
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: .white.opacity(0.7), radius: 10, x: -5, y: -5)
            )
    }
}

struct CustomViewModifier: ViewModifier {
    var roundedCorners: CGFloat
    var startColor: Color
    var endColor: Color
    var textColor: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(roundedCorners)
            .padding(3)
            .foregroundColor(textColor)
            .overlay(RoundedRectangle(cornerRadius: roundedCorners)
                .stroke(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5))
            .font(.custom("Open Sans", size: 18))
        
            .shadow(radius: 10)
    }
}

//MARK: TextField만드는 새로운 방법을 정의. Oh...
extension TextField {
    
    func extensionTextFieldView(roundedCornes: CGFloat, startColor: Color,  endColor: Color) -> some View {
        self
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(roundedCornes)
            .shadow(color: .purple, radius: 5)
    }
}

//MARK: TextField이외에도 Rectangle이란 View적 요소가 더해지는 것이니 View를 extension
extension View {
    func underlineTextField() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(Rectangle().frame(height: 2).padding(.top, 35))
            .foregroundColor(.darkPink)
    }
}

extension Color {
    static let darkPink = Color(red: 208 / 255, green: 45 / 255, blue: 208 / 255)
    static let lightShadow = Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
    static let darkShadow = Color(red: 163 / 255, green: 177 / 255, blue: 198 / 255)
    static let background = Color(red: 224 / 255, green: 229 / 255, blue: 236 / 255)
}

//TODO: TextField자체를 타입으로 저렇게 받아온거 신기방기.
struct NeumorphicStyleTextField: View {
    var textField: TextField<Text>
    var imageName: String
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(.darkShadow)
            textField
        }
        .padding()
        .foregroundColor(.offWhite)
        .background(Color.background)
        .cornerRadius(6)
        .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
        .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
    }
}
