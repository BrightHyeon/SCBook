//
//  AppDelegate.swift
//  SCBook
//
//  Created by Hyeonsoo Kim on 2022/05/05.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    //앱의 공유 동작을 관리하는 메서드 집합.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        Thread.sleep(forTimeInterval: 1.0) //1.0초 멈춰라
        return true
    }
}
