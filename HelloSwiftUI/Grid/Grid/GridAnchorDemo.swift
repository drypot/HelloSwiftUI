//
//  GridAnchorDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/21/24.
//

import SwiftUI

// https://rohit-13.medium.com/exploring-the-swiftuis-grid-view-lazyvgrid-griditem-and-grid-gridrow-888fca958b0f


struct GridAnchorDemo: View {
    var body: some View {
        VStack {
            Grid {
                GridRow {
                    Color.green
                        .frame(width: 100, height: 100)
                    Color.green
                        .frame(width: 100, height: 100)
                    Color.green
                        .frame(width: 100, height: 100)
                }
                GridRow {
                    Color.orange
                        .frame(width: 100, height: 100)
                    Color.orange
                        .frame(width: 20, height: 20)
                        .gridCellAnchor(.topTrailing)
                    Color.orange
                        .frame(width: 20, height: 20)
                        .gridCellAnchor(UnitPoint(x: 0.25, y: 0.75))
                }
            }
            .padding()
        }
    }
}

#Preview {
    GridDemo()
}
