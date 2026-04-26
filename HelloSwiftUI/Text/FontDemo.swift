//
//  FontDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/12/24.
//

import SwiftUI

struct FontDemo: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 48) {
                fontList
            }
//            .font(.title)
            .padding(32)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }

    var fontList: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("font(...)")
                .font(.title)
            Text("system 32 bold default")
                .font(.system(size: 32, weight: .bold, design: .default))
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
