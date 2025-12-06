//
//  GridAlignmentDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/21/24.
//

import SwiftUI

// https://rohit-13.medium.com/exploring-the-swiftuis-grid-view-lazyvgrid-griditem-and-grid-gridrow-888fca958b0f

struct GridAlignmentDemo: View {
    var body: some View {
        VStack {
            Grid {
                GridRow {
                    Color.green

                    Text("Align the entire column")
                        .font(.title2)
                        .gridColumnAlignment(.trailing)

                    Color.green
                }
                GridRow {
                    Text("***")
                        .font(.title2)
                        .frame(minHeight: 100)
                    Text("***")
                        .font(.title2)
                    Text("***")
                        .font(.title2)
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
    GridDemo()
}
