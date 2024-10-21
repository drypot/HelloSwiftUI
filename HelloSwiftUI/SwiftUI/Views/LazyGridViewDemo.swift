//
//  LazyGridViewDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/21/24.
//

import SwiftUI

struct LazyGridViewDemo: View {
    let data = Array(1...50)

    var columns: [GridItem] = [
        GridItem(.fixed(50)),
        GridItem(.fixed(50)),
        GridItem(.fixed(50))
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: self.columns) {
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

#Preview {
    LazyGridViewDemo()
}
