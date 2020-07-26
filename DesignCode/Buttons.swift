//
//  Buttons.swift
//  DesignCode
//
//  Created by litingdong on 2020/7/26.
//  Copyright © 2020 litingdong. All rights reserved.
//

import SwiftUI

struct Buttons: View {
    
    var body: some View {
        VStack {
            RectangleButton()
            CircleButton()
        }
        .frame(maxWidth:. infinity, maxHeight: .infinity)
        .background(Color.yellow)
        .edgesIgnoringSafeArea(.all)
        .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0))
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}

struct RectangleButton: View {
    @State var tap = false
    @State var press = false
    var body: some View {
        Text("Button")
            .font(.system(size: 20, weight: .semibold, design: .rounded))
            .background(
                ZStack{
                    Color(.white)
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .foregroundColor(.white)
                        .blur(radius: 4)
                        .offset(x: -8, y: -8)
                    
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                        .padding(2)
                        .blur(radius: 2)
                }
        )
            .frame(width: 200, height: 60)
            .clipShape(Circle())
            .overlay(
                Circle().trim(from: self.tap ? 0.001 : 1, to: 1)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                    .frame(width: 88, height: 88)
                    .rotationEffect(Angle(degrees: 90))
                    .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                    .animation(.easeInOut)
        )
            
            .shadow(color: .blue, radius: 20, x: 20, y: 20)
            .shadow(color: .red, radius: 20, x: -20, y: -20)
            .scaleEffect(self.tap ? 1.2 : 1)
            
            .gesture(
                LongPressGesture().onChanged({ value in
                    self.tap = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.tap = false
                    }
                }).onEnded({ (value) in
                    self.press.toggle()
                })
        )
    }
}

struct CircleButton: View {
    @State var tap = false
    var body: some View {
        ZStack{
            Image(systemName: "play.circle")
                .font(.system(size: 44, weight: .light))
                .opacity(self.tap ? 0 : 1)
            Image(systemName: "play.circle.fill")
                .font(.system(size: 44, weight: .light))
                .opacity(self.tap ? 1 : 0)
            
        }
        .frame(width: 100, height: 100)
        .background(Color.white)
        .scaleEffect(self.tap ? 1.2 : 1)
        .clipShape(Circle())
        .shadow(color: .white, radius: 20, x: -20, y: -20)
        .gesture(
            LongPressGesture().onChanged({ (value) in
                self.tap = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.tap = false
                }
            })
        )
            .animation(.easeInOut)
    }
}
