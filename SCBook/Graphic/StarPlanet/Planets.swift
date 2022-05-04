//
//  Planets.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/04/27.
//

import SwiftUI

struct Planet1: View {
    
    let w = UIScreen.main.bounds.width / 10 //대략 40
    let h = UIScreen.main.bounds.height / 10 //대략 85
    
    var body: some View {
        Circle()
            .fill(LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 1, green: 0.9554166793823242, blue: 0.5541666746139526, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.6708333492279053, green: 0.5049138069152832, blue: 0.07826387882232666, alpha: 0.3700000047683716)), location: 1)]),
                startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)))
            .frame(width: w*2, height: w*2)
            .overlay(
                Circle().stroke(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color(#colorLiteral(red: 1, green: 0.9554166793823242, blue: 0.5541666746139526, alpha: 1)), location: 0),
                            .init(color: Color(#colorLiteral(red: 0.6708333492279053, green: 0.5049138069152832, blue: 0.07826387882232666, alpha: 0.3700000047683716)), location: 1)]),
                        startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                        endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)), lineWidth: 2)
                .blur(radius: 2)
            )
            .opacity(0.8)
    }
}

struct Planet2: View {
    
    let w = UIScreen.main.bounds.width / 10 //대략 40
    let h = UIScreen.main.bounds.height / 10 //대략 85
    
    var body: some View {
        //Ellipse 2
        Circle()
            .fill(LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.9624999761581421, green: 0.6112676858901978, blue: 0.3569270968437195, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.9458333253860474, green: 0.769829511642456, blue: 0.6423784494400024, alpha: 1)), location: 0.2291666716337204),
                    .init(color: Color(#colorLiteral(red: 0.9791666865348816, green: 0.6194861531257629, blue: 0.35902780294418335, alpha: 1)), location: 0.484375),
                    .init(color: Color(#colorLiteral(red: 0.9750000238418579, green: 0.727593719959259, blue: 0.5484374761581421, alpha: 1)), location: 0.71875),
                    .init(color: Color(#colorLiteral(red: 1, green: 0.6085000038146973, blue: 0.32499998807907104, alpha: 1)), location: 1)]),
                startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)))
            .frame(width: w*2.5, height: w*2.5)
            .overlay(
                Circle().stroke(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color(#colorLiteral(red: 0.9624999761581421, green: 0.6112676858901978, blue: 0.3569270968437195, alpha: 1)), location: 0),
                            .init(color: Color(#colorLiteral(red: 0.9458333253860474, green: 0.769829511642456, blue: 0.6423784494400024, alpha: 1)), location: 0.2291666716337204),
                            .init(color: Color(#colorLiteral(red: 0.9791666865348816, green: 0.6194861531257629, blue: 0.35902780294418335, alpha: 1)), location: 0.484375),
                            .init(color: Color(#colorLiteral(red: 0.9750000238418579, green: 0.727593719959259, blue: 0.5484374761581421, alpha: 1)), location: 0.71875),
                            .init(color: Color(#colorLiteral(red: 1, green: 0.6085000038146973, blue: 0.32499998807907104, alpha: 1)), location: 1)]),
                        startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                        endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)), lineWidth: 2)
                .blur(radius: 2)
            )
            .opacity(0.8)
    }
}

struct Planet3: View {
    
    let w = UIScreen.main.bounds.width / 10 //대략 40
    let h = UIScreen.main.bounds.height / 10 //대략 85
    
    var body: some View {
        //Ellipse 3
        //Ellipse 3
        Circle()
            .fill(LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.20222216844558716, green: 0.5823999643325806, blue: 0.9333333373069763, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.5768576860427856, green: 0.7600583434104919, blue: 0.9291666746139526, alpha: 1)), location: 0.359375),
                    .init(color: Color(#colorLiteral(red: 0.05055558681488037, green: 0.509600043296814, blue: 0.9333333373069763, alpha: 0.9599999785423279)), location: 0.7135416865348816),
                    .init(color: Color(#colorLiteral(red: 0.33623263239860535, green: 0.553558349609375, blue: 0.7541666626930237, alpha: 1)), location: 1)]),
                startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)))
            .frame(width: w*2.2, height: w*2.2)
            .overlay(
                Circle().stroke(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color(#colorLiteral(red: 0.20222216844558716, green: 0.5823999643325806, blue: 0.9333333373069763, alpha: 1)), location: 0),
                            .init(color: Color(#colorLiteral(red: 0.5768576860427856, green: 0.7600583434104919, blue: 0.9291666746139526, alpha: 1)), location: 0.359375),
                            .init(color: Color(#colorLiteral(red: 0.05055558681488037, green: 0.509600043296814, blue: 0.9333333373069763, alpha: 0.9599999785423279)), location: 0.7135416865348816),
                            .init(color: Color(#colorLiteral(red: 0.33623263239860535, green: 0.553558349609375, blue: 0.7541666626930237, alpha: 1)), location: 1)]),
                        startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                        endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)), lineWidth: 2)
                .blur(radius: 2)
            )
            .opacity(0.8)
    }
}

struct Planet1_Previews: PreviewProvider {
    static var previews: some View {
        Planet3()
    }
}


