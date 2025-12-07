//
//  LazyGridIconsDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/06/25.
//

import SwiftUI

struct LazyGridIconsDemo: View {
    let data = Array(1...100)

    var columns: [GridItem] = [
        GridItem(.fixed(120)),
        GridItem(.fixed(120)),
        GridItem(.fixed(120)),
        GridItem(.fixed(120)),
        GridItem(.fixed(120)),
    ]

    var body: some View {
        HStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(data, id: \.self) { number in
                        VStack {
                            GridItemView(imageName: "car.fill", title: "\(number)")
                        }
                    }
                }
            }
            .padding()
        }
    }
}

fileprivate struct GridItemView: View {
    let imageName: String
    let title: String

    var body: some View {
        Image(systemName: "car.fill")
            .symbolRenderingMode(.multicolor)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
        Text("\(title)")
            .font(.title2)
            .fontWeight(.semibold)
            .scaledToFit()
            .minimumScaleFactor(0.6)
    }

}

#Preview {
    LazyGridIconsDemo()
}
