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
                Text("background(...)")
                    .font(.title)
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
                Text("RoundedRectangle(cornerRadius:)")
                    .padding(4)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.yellow)
                    )
                Text("Rectangle().clipShape().shadow()")
                    .padding(4)
                    .background(
                        Rectangle()
                            .foregroundStyle(.yellow)
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                            .shadow(radius: 8)
                    )
            }
            .font(.title)
        }
    }
}

#Preview {
    BackgroundDemo()
}
