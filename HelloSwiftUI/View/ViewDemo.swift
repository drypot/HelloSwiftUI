//
//  ViewDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 7/18/25.
//

import SwiftUI

struct ViewDemo: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, SwiftUI!")
                .font(.title)
                .padding(EdgeInsets(top: 40, leading: 40, bottom: 40, trailing: 40))
        }
        .padding()
    }
}

#Preview {
    ViewDemo()
}
