//
//  LazyGridDemo2.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/21/24.
//

import SwiftUI

// https://rohit-13.medium.com/exploring-the-swiftuis-grid-view-lazyvgrid-griditem-and-grid-gridrow-888fca958b0f

struct LazyGridDemo2: View {
    let data = Array(1...100)

    var columns: [GridItem] = [
        GridItem(.fixed(45), spacing: 1),
        GridItem(.fixed(80), spacing: 1, alignment: .top),
        GridItem(.fixed(80), spacing: 1, alignment: .center),
        GridItem(.fixed(80), spacing: 1, alignment: .bottom),
        GridItem(.fixed(80), spacing: 1, alignment: .topLeading),
        GridItem(.fixed(80), spacing: 1, alignment: .bottomTrailing),
    ]

    var body: some View {
        HStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 1) {
                    ForEach(data, id: \.self) { number in
                        Text("Item \(number)")
                            .foregroundStyle(.black)
                            .padding(8)
                            .background(Color.orange)
//                            .border(.black)
                    }
                }
                .padding(1)
                .background(Color.gray)
            }
            .padding()
            .background(Color.white)

        }
    }
}

#Preview {
    LazyGridDemo()
}
