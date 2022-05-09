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
                            //MARK: 이렇게 Custom한 토글을 달지않으면, 우리가 흔히 아는 토글처럼 나온다. 좌측에 Label(여기선 하트이미지)이 들어가고, 우측에 우리가 아는 그 토글모양이 나온다.
                            
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
            //MARK: ScrollView를 씌울때, 스크롤뷰 사이즈가 화면에 꽉차지않을 경우가 있다.
            //이럴경우 1) ScrollView바로 하위(그 안에선 가장 큰 뷰)뷰의 maxWidth를 .infinity로 설정한다.
            //      2) 혹은 VStack을 LazyVStack으로 바꾼다.
        }
        .navigationTitle("Advanced")
    }
}


struct MorphismButtons_Previews: PreviewProvider {
    static var previews: some View {
        MorphismButtons()
    }
}

//MARK: 사용성 좋은 방식으로 변경
//NeumorphismButtonStyle을 채택하면서 colorScheme과 원하는 테두리shape을 전달하면, 라이트-다크모드 그리고 형태에 따라 유연하게 나타나게된다.
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
                scheme == .light ? //AnyView로 타입숨기기.
                AnyView(LightBackground(isHighlighted: configuration.isPressed, shape: shape, isBordered: isBordered)) :
                    AnyView(DarkBackground(isHighlighted: configuration.isPressed, shape: shape, isBordered: isBordered))
            )
            .animation(nil, value: configuration.isPressed) //이거 안해주면 자동 애니메이션 들어가버림.
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
                    .fill(LinearGradient(Color.darkStart, Color.darkEnd)) //안눌렸을 땐, 순방향
                    .shadow(color: Color.darkStart, radius: 10, x: -5, y: -5)
                    .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
                    .overlay(shape.stroke(Color.darkEnd, lineWidth: 4))
            } else {
                shape
                    .fill(LinearGradient(Color.darkStart, Color.darkEnd)) //안눌렸을 땐, 순방향
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
//                    scheme == .light ? //AnyView로 타입숨기기.
//                    AnyView(LightBackground(isHighlighted: configuration.isOn, shape: shape, isBordered: isBordered)) :
//                        AnyView(DarkBackground(isHighlighted: configuration.isOn, shape: shape, isBordered: isBordered))
//                )
        } //MARK: .background() 어디에 달든 No 상관~! 위 아래 동일.
        .background(
            scheme == .light ? //AnyView로 타입숨기기.
            AnyView(LightBackground(isHighlighted: configuration.isOn, shape: shape, isBordered: isBordered)) :
                AnyView(DarkBackground(isHighlighted: configuration.isOn, shape: shape, isBordered: isBordered))
        )
    }
}


//MARK: 어떤 변화를 거쳐 최적화시켰는지 살펴보기.
//struct DarkButtonStyle: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .padding(60)
//            .contentShape(Circle())
//            .background(
//                DarkBackground(isHighlighted: configuration.isPressed, shape: Circle())
//            )
//            .animation(nil, value: configuration.isPressed) //이거안해주면 자동 애니메이션 들어가버리더라공~
//    }
//}

//한 코드에 관리한 방식: 아래, 분리해서 재사용성 늘린 코드: 위
//struct LightButtonStyle: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .padding(60)
//            .contentShape(Circle()) //Defines the content shape for hit testing. 아직 정확한 일은 모름...
//            .background( //TODO: 흔히 우리가 이 안에는 if문이 에러떠서 삼항연산썼는데 이렇게 Group으로 묶으면 해결된다. 원인?!
//                Group {
//                    if configuration.isPressed {
//                        Circle()
//                            .fill(Color.offWhite)
//                            .overlay(
//                                Circle()
//                                    .stroke(.gray, lineWidth: 4)
//                                    .blur(radius: 4)
//                                    .offset(x: 2, y: 2)
//                                    .mask( //mask는 실제 View를 그려내기보단 잘라내는 용이다.
//                                        Circle() //헌데 여기서 Opacity핸들링은 가능하다.
//                                            .fill(LinearGradient(.black, .clear))
//                                            //실제로 색이 반영되는 것은 아님. red넣어도 같음.
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
//            .contentShape(Circle()) //Defines the content shape for hit testing. 아직 정확한 일은 모름...
//            .background( //TODO: 흔히 우리가 이 안에는 if문이 에러떠서 삼항연산썼는데 이렇게 Group으로 묶으면 해결된다. 원인?!
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
