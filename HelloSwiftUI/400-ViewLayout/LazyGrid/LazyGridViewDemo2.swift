//
//  LazyGridViewDemo2.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/21/24.
//

import SwiftUI

// https://rohit-13.medium.com/exploring-the-swiftuis-grid-view-lazyvgrid-griditem-and-grid-gridrow-888fca958b0f

struct LazyGridViewDemo2: View {
    let data = Array(1...100)

    var columns: [GridItem] = [
        GridItem(.fixed(45)),
        GridItem(.fixed(80), alignment: .top),
        GridItem(.fixed(80), alignment: .center),
        GridItem(.fixed(80), alignment: .bottom),
        GridItem(.fixed(80), alignment: .topLeading),
        GridItem(.fixed(80), alignment: .bottomTrailing),
    ]

    var body: some View {
        HStack {
            ScrollView {
                LazyVGrid(columns: self.columns) {
                    ForEach(data, id: \.self) { number in
                        Text("Item \(number)")
                            .foregroundColor(Color.black)
                            .padding(8)
                            .background(Color.orange)
                            .border(.black)
                    }
                }
            }
            .padding()

        }
    }
}

#Preview {
    LazyGridViewDemo()
}
