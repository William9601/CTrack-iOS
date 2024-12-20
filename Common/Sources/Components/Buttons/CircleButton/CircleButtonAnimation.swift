//
//  CircleButtonAnimation.swift
//  
//
//  Created by William von Arend on 18/05/2024.
//

import SwiftUI

public struct CircleButtonAnimation: View {
    
    @Binding var animate: Bool
    
    public init(animate: Binding<Bool>) {
        _animate = animate
    }
    
    public var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1.0) : .none)
    }
}

struct CircleButtonAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimation(animate: .constant(false))
            .foregroundColor(.red)
            .frame(width: 100, height: 100)
    }
}
