//
//  FontDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/12/24.
//

import SwiftUI

struct FontDemo: View {
    var body: some View {
        VStack(spacing: 18) {
            Text("font(...)")
                .font(.title)
            Text("largeTitle")
                .font(.largeTitle)
            Text("title")
                .font(.title)
            Text("title2")
                .font(.title2)
            Text("title3")
                .font(.title3)
            Text("headline")
                .font(.headline)
            Text("subheadline")
                .font(.subheadline)
            Text("Body")
                .font(.body)
            Text("callout")
                .font(.callout)
        }
    }
}

#Preview {
    FontDemo()
}
