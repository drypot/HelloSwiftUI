//
//  LazyGridViewDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/21/24.
//

import SwiftUI

// https://rohit-13.medium.com/exploring-the-swiftuis-grid-view-lazyvgrid-griditem-and-grid-gridrow-888fca958b0f

struct LazyGridViewDemo: View {
    let data = Array(1...100)

    var columns: [GridItem] = [
        GridItem(.fixed(50), spacing: 0),
        GridItem(.fixed(50), spacing: 10),
        GridItem(.fixed(50), spacing: 20),
        GridItem(.fixed(50), spacing: 30),
        GridItem(.fixed(50), spacing: 40),
    ]

    var columns2: [GridItem] = [
        GridItem(.adaptive(minimum: 50)),
    ]

    var columns3: [GridItem] = [
        GridItem(.flexible(minimum: 50, maximum: 100)),
        GridItem(.flexible(minimum: 50, maximum: 100)),
        GridItem(.flexible(minimum: 50, maximum: 100)),
    ]

    var body: some View {
        HStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(data, id: \.self) { number in
                        Text("\(number)")
                            .frame(width: 50, height: 50)
                            .background(Color.orange)
                            .foregroundColor(Color.black)
                            .cornerRadius(25)
                    }
                }
            }
            .padding()

            ScrollView {
                LazyVGrid(columns: columns2) {
                    ForEach(data, id: \.self) { number in
                        Text("\(number)")
                            .frame(width: 50, height: 50)
                            .background(Color.orange)
                            .foregroundColor(Color.black)
                            .cornerRadius(25)
                    }
                }
            }
            .padding()

            ScrollView {
                LazyVGrid(columns: columns3) {
                    ForEach(data, id: \.self) { number in
                        Text("\(number)")
                            .frame(width: 50, height: 50)
                            .background(Color.orange)
                            .foregroundColor(Color.black)
                            .cornerRadius(25)
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
