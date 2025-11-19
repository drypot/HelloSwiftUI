//
//  BackgroundDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/19/25.
//

import SwiftUI

struct BackgroundDemo: View {
    var body: some View {
        HStack(alignment: .top, spacing: 36) {
            VStack(spacing: 18) {
                Text(".background(...)")
                Text("yellow")
                    .padding(4)
                    .background(.yellow)
                Text("yellow.gradient")
                    .padding(4)
                    .background(.yellow.gradient)
                Text("ultraThinMaterial")
                    .padding(4)
                    .background(.ultraThinMaterial)
                Text("in: Capsule()")
                    .padding(4)
                    .background(.yellow, in: Capsule())
            }
            .font(.title)
        }
    }
}

#Preview {
    BackgroundDemo()
}
