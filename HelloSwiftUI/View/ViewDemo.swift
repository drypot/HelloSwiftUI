//
//  ViewDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 7/18/25.
//

import SwiftUI

struct ViewDemo: View {
    @State private var message = "Hello, SwiftUI!"

    var body: some View {
        VStack(spacing: 20) {
            Text(message)
                .font(.title)

            Button("Change Message") {
                message = "You tapped the button!"
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ViewDemo()
}
