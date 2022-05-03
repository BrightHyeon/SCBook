//
//  OnboardingView.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/27.
//

import SwiftUI
import SwiftUIX

struct Onboarding: View {
    
    @StateObject var cd = ColorDict()
    @State var selection = 0
    @State var wave: Bool = false
    
    var body: some View {
        ZStack {
            background
            
            TabView(selection: $selection) {
                OnboardingView(cd: cd, selection: $selection).tag(0)
                OnboardingView2(cd: cd, selection: $selection).tag(1)
            }
            .tabViewStyle(PageTabViewStyle()) //Nice!
            //pageControl과 유사한 형태.x
            //default와 달리, View가 올라가지도 않는다.
            .background {
                Face(selection: $selection).opacity(0.8)
                FaceJeju(selection: $selection).opacity(0.8)
            }
        }
    }
    
    
    var background: some View { //이렇게 따로 뺀 후에 body에 추가가능.
        ZStack {
            cd.colors["onboardBackground"]
            .ignoresSafeArea()
            //아래와 같은 효과.
            //.edgesIgnoringSafeArea(.all)
            //            .overlay(
            //                ZStack {
            //                    Wave()
            //                    Wave2()
            //                }
            //            )
            
            //TODO: 이 ZStack, overlay의 동작차이 원인 알아보기.
            if wave {
                Wave()
                Wave2()
            } else {
                BlueWave()
                BlueWave2()
            }
            //            Wave()
            //                .blur(radius: 3)
            //ZStack안에 바로 넣게되면, 위의 body의 OnboardingView도 Wave의 frame을 follow하게되며, 늘어나버림. 그것을 방지하기위해, ZStack블록 안이 아닌 LinearGradient에 바로 overlay하는 식으로 할 것임.
            //MARK: Wave()를 정의한 곳에서 Shape frame말고, 자체 frame까지 조절했던 것을 주석처리하니 이렇게해도 문제없이 나타남. 강의에선 왜 frame처리를 둘 다 했는지 알고싶다...
            //일단 로딩시간은 둘 다 동일하게 김 ㅋㅋㅋ
            
            //            Wave2()
            //                .blur(radius: 3)
        }
        .onAppear { //WaveColor 바뀔때 Animation용~!
            if selection == 0 {
                withAnimation {
                    wave = true
                }
            } else {
                withAnimation {
                    wave = false
                }
            }
        }
        .onChange(of: selection) { value in
            if selection == 0 {
                withAnimation {
                    wave = true
                }
            } else {
                withAnimation {
                    wave = false
                }
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
            .environmentObject(StartOnboard())
    }
}

struct OnboardingView: View {
    
    @ObservedObject var cd: ColorDict
    @EnvironmentObject var startOnboard: StartOnboard
    @Binding var selection: Int
    
    var body: some View { //정렬 중요.
        ZStack {
            VStack(alignment: .leading, spacing: 16) {
                
                Text("NC1. SCBook - Tamna")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.white.opacity(0.7))
                
                cd.colors["onboardText"]
                .frame(height: 140) //frame지정해줘야함.
                .mask{
                    Text("SwiftUI \nCollection \nBook")
                        .font(.largeTitle)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    //maxWidth: .infinity로 설정함으로써 사용가능한 최대공간을 사용하도록~!
                }
                Text("SwiftUI Collection Book App provides variable design of components. You can see our code and design.")
                .font(.subheadline.weight(.semibold))
                .foregroundColor(.white.opacity(0.7))
            }
            .padding(30)
            //figma에서 만든 여러 Components를 SwiftUI Inspector를 이용하여 code추출할 수 있는데 아래 Linear도 그런방식으로 가져옴.
            .background(cd.colors["onboardingView"])
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            //둘은 받는 전달인자타입이 다름. mask는 ()->View 즉, View를 반환하는 모든 요소를 받고, clipShape는 Shape를 받음.
            //.clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            //RoundedRectangleStyle - .continuous: smooth하게 이어지도록 처리함. .circular: 딱 지정한 부분만 radius주는데 다소 확 꺾이는듯함. 취향 차이. 즉, 더부드러운건 continuous!
            //circular를 쓰고, stroke을 주면 선이 좀 일그러지는 느낌을 본적있을 것! continuous에는 그런것없음.
            //MARK: Stroke 오버레이하는 타이밍 주의. 순서에 따라 바뀌니!
            .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous)
                .stroke(
                    cd.colors["onboardStroke"]!, lineWidth: 1)
                    .blendMode(.overlay)
                    .overlay( //한번 더 오버레이하고,
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .stroke(cd.colors["onboardStroke"]!, lineWidth: 3)
                            .blur(radius: 10)
                        //이번엔 blur를 주면, 좀 더 glow적인 느낌연출됨.
                            )
            )
            .background( //BlurView이용해서 배경만 blur처리하고, 너무진해지니까, 투명값있는 gradient를 fill해서 조절해줌.
                VisualEffectBlurView(blurStyle:
                        .systemUltraThinMaterialDark)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(LinearGradient(colors: [Color.red, Color.blue.opacity(0.0)], startPoint: .top, endPoint: .bottom))
                )
            )
            .padding(20)
        }
        //Stroke도 투명도를 한쪽에 줘야 배경에 스며드는 듯한 효과연출됨.
        //blendMode(.overlay)를 사용하면, 하위 레이어에 따라 상위레이어의 색이 강조된다. 하위가 밝으면 더밝아지고, 어두우면 더 어두워지는.
    }
}

//TODO: 기본 .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))와의 차이가 뭐지?!

struct OnboardingView2: View {
    
    @ObservedObject var cd: ColorDict
    @EnvironmentObject var startOnboard: StartOnboard
    @Binding var selection: Int
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 16) {
                
                Text("Tamna - from Jeju")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.white.opacity(0.7))
                
                cd.colors["onboardText"]
                .frame(height: 140)
                .mask{
                    Text("SwiftUI \nCollection \nBook")
                        .font(.largeTitle)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                Text("These are designs that contain a very personal taste. Keep this in mind. So let's get started."
                )
                .font(.subheadline.weight(.semibold))
                .foregroundColor(.white.opacity(0.7))
            }
            .padding(30)
            .background(cd.colors["onboardingView"])
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous)
                .stroke(
                    cd.colors["onboardStroke"]!, lineWidth: 1)
                    .blendMode(.overlay)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .stroke(cd.colors["onboardStroke"]!, lineWidth: 3)
                            .blur(radius: 10)
                            )
            )
            .background(
                VisualEffectBlurView(blurStyle:
                        .systemUltraThinMaterialDark)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(LinearGradient(colors: [Color.red, Color.blue.opacity(0.0)], startPoint: .top, endPoint: .bottom))
                )
            )
            .padding(20)
            
            VStack {
                Spacer()
                
                Button {
                    withAnimation(.linear(duration: 1)) {
                        startOnboard.isCountinue = true
                    }
                    //I tried this because when I go back to onboarding, Jeju Face appear short time. But I cannot solve this though use dispatch.
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                        self.selection = 0
//                    }
                    //DispatchQueue.global().asyncAfter...
                } label: {
                    VStack {
                        Text("Continue")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(cd.colors["continueText"]!)
                            .padding()
                    }
                    .padding(10)
                    .background(cd.colors["continueBackground"]!, in: RoundedRectangle(cornerRadius: 12, style: .continuous)
                    )
                }
                Spacer().frame(height: 100)
            }
        }
    }
}
