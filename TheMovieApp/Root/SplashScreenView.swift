//
//  SplashScreenView.swift
//  TheMovieApp
//
//  Created by Mario Ban on 28.01.2025..
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var scaleEffect: CGFloat = 1
    
    var body: some View {
        if isActive {
            MainTabView() 
        } else {
            ZStack {
                Color.teal.ignoresSafeArea()
                LottieView(animationName: "lottie.json", loopMode: .playOnce)
                    .scaleEffect(scaleEffect)
                    .frame(width: 80)
                
            }
            .onAppear {
                // MARK: Shrink
                withAnimation(.easeIn(duration: 1)) {
                    scaleEffect = 0.2
                }
                
                // MARK: Enlarge
                withAnimation(.easeInOut(duration: 2).delay(1)) {
                    scaleEffect = 5
                }
                
                // MARK: Home screen navigation
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
