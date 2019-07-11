//
//  ContentView.swift
//  SwiftUI Transforms and Animations
//
//  Created by Ben Scheirman on 7/9/19.
//  Copyright © 2019 Fickle Bits. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State var expanded: Bool = false
    
    var body: some View {
        ZStack {
            CardView(title: "Walmart", color: .blue)
                .offset(x: 0, y: expanded ? -400 : -40)
                .scaleEffect(expanded ? 1 : 0.90)
            CardView(title: "Target", color: .red)
                .offset(x: 0, y: expanded ? -200 : -20)
                .scaleEffect(expanded ? 1 : 0.95)
            CardView(title: " Card", color: .black)
                .tapAction {
                    self.expanded.toggle()
                }
        }
        .offset(x: 0, y: expanded ? 150 : 0)
        .animation(.spring(mass: 1.0, stiffness: 100, damping: 20, initialVelocity: 0))
    }
}

struct CardView : View {
    
    let title: String
    let color: Color
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(color)
                .cornerRadius(10)
                .frame(width: 320, height: 210)
            
            Text(title)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
        }.shadow(radius: 6)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
