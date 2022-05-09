//
//  StepperView.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/05/04.
//

import SwiftUI

struct StepperView: View {
    
    @State private var basicStepper: Int = 0
    @State private var limitStepper: Int = 2
    @State private var stepStepper: Int = 0
    
    //MARK: 서근 블로그 참고.
    @State private var value = 0
    let colors: [Color] = [.orange, .red, .gray, .blue,
                           .green, .purple, .pink]
    
    //증가값 함수
    func incrementStep() {
        //클릭마다 +1씩 증가
        value += 1
        if value >= colors.count { value = 0 }
    }
    //감소값 함수
    func decrementStep() {
        //클릭마다 -1씩 증가
        value -= 1
        if value < 0 { value = colors.count - 1 }
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Stepper(value: $basicStepper) {
                Text("\(basicStepper) 명")
            }
            
            Stepper(value: $limitStepper, in: 2...5) {
                Text("\(limitStepper) 명")
            }
            
            Stepper(value: $stepStepper, step: 5) {
                Text("\(stepStepper) 명")
            }
            
            Stepper {
                Image(systemName: "heart.fill")
                    .foregroundColor(colors[value])
            } onIncrement: {
                incrementStep()
            } onDecrement: {
                decrementStep()
            }
            
        }
        .padding()
    }
}

struct StepperView_Previews: PreviewProvider {
    static var previews: some View {
        StepperView()
    }
}
