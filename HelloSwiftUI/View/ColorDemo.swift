//
//  ColorDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 7/18/25.
//

import SwiftUI

struct ColorDemo: View {
    var body: some View {
        VStack(spacing: 20) {
            Color(.blue)
            LinearGradient(colors: [.blue, .green, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
        .padding()
    }
}

#Preview {
    ColorDemo()
}
