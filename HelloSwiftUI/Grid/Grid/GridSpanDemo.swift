//
//  GridSpanDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/21/24.
//

import SwiftUI

// https://rohit-13.medium.com/exploring-the-swiftuis-grid-view-lazyvgrid-griditem-and-grid-gridrow-888fca958b0f

struct GridSpanDemo: View {
    var body: some View {
        VStack {
            Grid {
                GridRow {
                    ForEach(0..<3) { _ in
                        Color.red
                    }
                }
                GridRow {
                    Color.green
                    Text("This text will span to two columns")
                        .font(.title2)
                        .gridCellColumns(2) // Span two columns.
                }
                GridRow {
                    ForEach(0..<3) { _ in
                        Color.orange
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    GridSpanDemo()
}
