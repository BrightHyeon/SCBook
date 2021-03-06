//
//  MorphismButtons.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/05/03.
//

import SwiftUI

struct MorphismButtons: View {
    
    @State private var cirToggle = false
    @State private var rectToggle = false
    @State private var rounToggle = false
    @State private var elliToggle = false
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        ZStack {
            
            
            if colorScheme == .light {
                Color.offWhite
                    .ignoresSafeArea()
            } else {
                LinearGradient(Color.darkStart, Color.darkEnd)
                    .ignoresSafeArea()
            }
            
            ScrollView {
                
                LazyVStack(spacing: 50) {
                    
                    Text("Neumorphism Style")
                        .font(.body.bold())
                        .foregroundColor(.primary)
                    
                    VStack(spacing: 20) {
                        HStack(spacing: 40) {
                            Button {} label: {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(colorScheme == .light ? .gray : .white)
                                    .padding()
                            }.buttonStyle(NeumorphismButtonStyle(scheme: colorScheme, shape: Circle(), isBordered: false))
                            
                            Button {} label: {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(colorScheme == .light ? .gray : .white)
                                    .padding()
                            }.buttonStyle(NeumorphismButtonStyle(scheme: colorScheme, shape: Rectangle(), isBordered: false))
                        }
                        
                        HStack(spacing: 40) {
                            Button {} label: {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(colorScheme == .light ? .gray : .white)
                                    .padding()
                            }.buttonStyle(NeumorphismButtonStyle(scheme: colorScheme, shape: RoundedRectangle(cornerRadius: 30), isBordered: false))
                            
                            Button {} label: {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(colorScheme == .light ? .gray : .white)
                                    .padding(.horizontal)
                            }.buttonStyle(NeumorphismButtonStyle(scheme: colorScheme, shape: Ellipse(), isBordered: false))
                        }
                    }
                    Divider().frame(width: UIScreen.main.bounds.width / 3 * 2)
                    
                    VStack(spacing: 20) {
                        
                        Text("Bordered Neumorphism Style")
                            .font(.body.bold())
                            .foregroundColor(.primary)
                        
                        HStack(spacing: 40) {
                            Button {} label: {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(colorScheme == .light ? .gray : .white)
                                    .padding()
                            }.buttonStyle(NeumorphismButtonStyle(scheme: colorScheme, shape: Circle(), isBordered: true))
                            
                            Button {} label: {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(colorScheme == .light ? .gray : .white)
                                    .padding()
                            }.buttonStyle(NeumorphismButtonStyle(scheme: colorScheme, shape: Rectangle(), isBordered: true))
                        }
                        
                        HStack(spacing: 40) {
                            Button {} label: {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(colorScheme == .light ? .gray : .white)
                                    .padding()
                            }.buttonStyle(NeumorphismButtonStyle(scheme: colorScheme, shape: RoundedRectangle(cornerRadius: 30), isBordered: true))
                            
                            Button {} label: {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(colorScheme == .light ? .gray : .white)
                                    .padding(.horizontal)
                            }.buttonStyle(NeumorphismButtonStyle(scheme: colorScheme, shape: Ellipse(), isBordered: true))
                        }
                    }
                    Divider().frame(width: UIScreen.main.bounds.width / 3 * 2)
                    
                    VStack(spacing: 20) {
                        
                        Text("Toggle Function")
                            .font(.body.bold())
                            .foregroundColor(.primary)
                        
                        HStack(spacing: 40) {
                            Toggle(isOn: $cirToggle) {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(colorScheme == .light ? .gray : .white)
                                    .padding()
                            }
                            .toggleStyle(MyToggleStyle(scheme: colorScheme, shape: Circle()))
                            //MARK: ????????? Custom??? ????????? ???????????????, ????????? ?????? ?????? ???????????? ?????????. ????????? Label(????????? ???????????????)??? ????????????, ????????? ????????? ?????? ??? ??????????????? ?????????.
                            
                            Toggle(isOn: $rectToggle) {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(colorScheme == .light ? .gray : .white)
                                    .padding()
                            }
                            .toggleStyle(MyToggleStyle(scheme: colorScheme, shape: Rectangle()))
                        }
                        
                        HStack(spacing: 40) {
                            Toggle(isOn: $rounToggle) {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(colorScheme == .light ? .gray : .white)
                                    .padding()
                            }
                            .toggleStyle(MyToggleStyle(scheme: colorScheme, shape: RoundedRectangle(cornerRadius: 30)))
                            
                            Toggle(isOn: $elliToggle) {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(colorScheme == .light ? .gray : .white)
                                    .padding(.horizontal)
                            }
                            .toggleStyle(MyToggleStyle(scheme: colorScheme, shape: Ellipse()))
                        }
                    }
                }
                
            }
            //MARK: ScrollView??? ?????????, ???????????? ???????????? ????????? ??????????????? ????????? ??????.
            //???????????? 1) ScrollView?????? ??????(??? ????????? ?????? ??? ???)?????? maxWidth??? .infinity??? ????????????.
            //      2) ?????? VStack??? LazyVStack?????? ?????????.
        }
        .navigationTitle("Advanced")
    }
}


struct MorphismButtons_Previews: PreviewProvider {
    static var previews: some View {
        MorphismButtons()
    }
}

//MARK: ????????? ?????? ???????????? ??????
//NeumorphismButtonStyle??? ??????????????? colorScheme??? ????????? ?????????shape??? ????????????, ?????????-???????????? ????????? ????????? ?????? ???????????? ??????????????????.
struct NeumorphismButtonStyle<S: Shape>: ButtonStyle {
    
    var scheme: ColorScheme
    var shape: S
    var isBordered: Bool
    
    init(scheme: ColorScheme, shape: S, isBordered: Bool) {
        self.scheme = scheme
        self.shape = shape
        self.isBordered = isBordered
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(shape)
            .background(
                scheme == .light ? //AnyView??? ???????????????.
                AnyView(LightBackground(isHighlighted: configuration.isPressed, shape: shape, isBordered: isBordered)) :
                    AnyView(DarkBackground(isHighlighted: configuration.isPressed, shape: shape, isBordered: isBordered))
            )
            .animation(nil, value: configuration.isPressed) //?????? ???????????? ?????? ??????????????? ???????????????.
    }
}

struct DarkBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    var isBordered: Bool
    
    var body: some View {
        if isHighlighted {
            if isBordered {
                shape
                    .fill(LinearGradient(Color.darkEnd, Color.darkStart))
                    .overlay(
                        shape
                            .stroke(Color.white, lineWidth: 4)
                            .shadow(color: Color.white, radius: 7, x: 0, y: 0)
                    )
//                    .blur(radius: 1.0)
            } else {
                shape
                    .fill(LinearGradient(Color.darkEnd, Color.darkStart))
                    .overlay(shape
                        .stroke(Color.darkEnd, lineWidth: 4)
                        .blur(radius: 4)
                        .offset(x: 2, y: 2)
                        .mask(shape.fill(LinearGradient(.black, .clear))))
                    .overlay(shape
                        .stroke(Color.darkStart, lineWidth: 8)
                        .blur(radius: 4)
                        .offset(x: -2, y: -2)
                        .mask(shape.fill(LinearGradient(.clear, .black))))
            }
        } else {
            if isBordered {
                shape
                    .fill(LinearGradient(Color.darkStart, Color.darkEnd)) //???????????? ???, ?????????
                    .shadow(color: Color.darkStart, radius: 10, x: -5, y: -5)
                    .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
                    .overlay(shape.stroke(Color.darkEnd, lineWidth: 4))
            } else {
                shape
                    .fill(LinearGradient(Color.darkStart, Color.darkEnd)) //???????????? ???, ?????????
                    .shadow(color: Color.darkStart, radius: 10, x: -5, y: -5)
                    .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
            }
        }
    }
}

struct LightBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    var isBordered: Bool
    
    var body: some View {
        if isHighlighted {
            if isBordered {
                shape
                    .fill(Color.offWhite)
                    .overlay(
                        shape
                            .stroke(.white, lineWidth: 4)
                            .shadow(color: .white, radius: 7, x: 0, y: 0)
                    )
//                    .blur(radius: 1.0)
            } else {
                shape
                    .fill(Color.offWhite)
                    .overlay(shape
                        .stroke(.gray, lineWidth: 4)
                        .blur(radius: 4)
                        .offset(x: 2, y: 2)
                        .mask(shape.fill(LinearGradient(.black, .clear))))
                    .overlay(shape
                        .stroke(.white, lineWidth: 8)
                        .blur(radius: 4)
                        .offset(x: -2, y: -2)
                        .mask(shape.fill(LinearGradient(.clear, .black))))
            }
        } else {
            if isBordered {
                shape
                    .fill(Color.offWhite)
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: .white.opacity(0.7), radius: 10, x: -5, y: -5)
                    .overlay(shape.stroke(Color.white.opacity(0.3), lineWidth: 4))
            } else {
                shape
                    .fill(Color.offWhite)
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: .white.opacity(0.7), radius: 10, x: -5, y: -5)
            }
        }
    }
}

struct MyToggleStyle<S: Shape>: ToggleStyle {
    
    var scheme: ColorScheme
    var shape: S
    var isBordered: Bool = true
    
    init(scheme: ColorScheme, shape: S) {
        self.scheme = scheme
        self.shape = shape
    }
    
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            configuration.label
                .padding(30)
                .contentShape(shape)
//                .background(
//                    scheme == .light ? //AnyView??? ???????????????.
//                    AnyView(LightBackground(isHighlighted: configuration.isOn, shape: shape, isBordered: isBordered)) :
//                        AnyView(DarkBackground(isHighlighted: configuration.isOn, shape: shape, isBordered: isBordered))
//                )
        } //MARK: .background() ????????? ?????? No ??????~! ??? ?????? ??????.
        .background(
            scheme == .light ? //AnyView??? ???????????????.
            AnyView(LightBackground(isHighlighted: configuration.isOn, shape: shape, isBordered: isBordered)) :
                AnyView(DarkBackground(isHighlighted: configuration.isOn, shape: shape, isBordered: isBordered))
        )
    }
}


//MARK: ?????? ????????? ?????? ????????????????????? ????????????.
//struct DarkButtonStyle: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .padding(60)
//            .contentShape(Circle())
//            .background(
//                DarkBackground(isHighlighted: configuration.isPressed, shape: Circle())
//            )
//            .animation(nil, value: configuration.isPressed) //?????????????????? ?????? ??????????????? ????????????????????????~
//    }
//}

//??? ????????? ????????? ??????: ??????, ???????????? ???????????? ?????? ??????: ???
//struct LightButtonStyle: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .padding(60)
//            .contentShape(Circle()) //Defines the content shape for hit testing. ?????? ????????? ?????? ??????...
//            .background( //TODO: ?????? ????????? ??? ????????? if?????? ???????????? ????????????????????? ????????? Group?????? ????????? ????????????. ???????!
//                Group {
//                    if configuration.isPressed {
//                        Circle()
//                            .fill(Color.offWhite)
//                            .overlay(
//                                Circle()
//                                    .stroke(.gray, lineWidth: 4)
//                                    .blur(radius: 4)
//                                    .offset(x: 2, y: 2)
//                                    .mask( //mask??? ?????? View??? ?????????????????? ???????????? ?????????.
//                                        Circle() //?????? ????????? Opacity???????????? ????????????.
//                                            .fill(LinearGradient(.black, .clear))
//                                            //????????? ?????? ???????????? ?????? ??????. red????????? ??????.
//                                    )
//                            )
//                            .overlay(
//                                Circle()
//                                    .stroke(.white, lineWidth: 8)
//                                    .blur(radius: 4)
//                                    .offset(x: -2, y: -2)
//                                    .mask(
//                                        Circle()
//                                            .fill(LinearGradient(.clear, .black))
//                                    )
//                            )
//                    } else {
//                        Circle()
//                            .fill(Color.offWhite)
//                            .shadow(color: .black.opacity(0.2), radius: 10, x: 10, y: 10)
//                            .shadow(color: .white.opacity(0.7), radius: 10, x: -5, y: -5)
//                    }
//                }
//            )
//    }
//}

//struct MyNeumorphismStyle: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .padding(30)
//            .contentShape(Circle()) //Defines the content shape for hit testing. ?????? ????????? ?????? ??????...
//            .background( //TODO: ?????? ????????? ??? ????????? if?????? ???????????? ????????????????????? ????????? Group?????? ????????? ????????????. ???????!
//                Group {
//                    if configuration.isPressed {
//                        Circle()
//                            .fill(Color.offWhite)
//                            .overlay(
//                                Circle()
//                                    .stroke(LinearGradient(.gray, .white), lineWidth: 8)
//                                    .blur(radius: 4)
//                                    .mask(
//                                        Circle()
//                                            .fill(LinearGradient(.black, .clear))
//                                    )
//                            )
//
//                    } else {
//                        Circle()
//                            .fill(Color.offWhite)
//                            .shadow(color: .black.opacity(0.2), radius: 10, x: 10, y: 10)
//                            .shadow(color: .white.opacity(0.7), radius: 10, x: -5, y: -5)
//                    }
//                }
//            )
//    }
//}
