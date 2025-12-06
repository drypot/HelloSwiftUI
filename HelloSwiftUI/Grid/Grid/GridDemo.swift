//
//  GridDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/21/24.
//

import SwiftUI

// https://rohit-13.medium.com/exploring-the-swiftuis-grid-view-lazyvgrid-griditem-and-grid-gridrow-888fca958b0f

struct GridDemo: View {
    var body: some View {
        VStack {
            Grid(alignment: .center, horizontalSpacing: 8, verticalSpacing: 8) {
                GridRow {
                    Text("Row 1")
                        .font(.title2)
                    ForEach(0..<2) { _ in
                        Color.red
                    }
                }
                GridRow {
                    Text("Row 2")
                        .font(.title2)
                    ForEach(0..<5) { _ in
                        Color.green
                    }
                }
                GridRow {
                    Text("Row 3")
                        .font(.title2)
                    ForEach(0..<4) { _ in
                        Color.orange
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    GridDemo()
}
