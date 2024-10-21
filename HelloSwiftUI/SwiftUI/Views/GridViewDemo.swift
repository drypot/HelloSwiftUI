//
//  GridViewDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/21/24.
//

import SwiftUI

// https://rohit-13.medium.com/exploring-the-swiftuis-grid-view-lazyvgrid-griditem-and-grid-gridrow-888fca958b0f


struct GridViewDemo: View {
    var body: some View {
        VStack {

            Grid(alignment: .bottom, horizontalSpacing: 20, verticalSpacing: 2) {
                GridRow {
                    Text("Row 1")
                    ForEach(0..<2) { _ in Color.red }
                }
                GridRow {
                    Text("Row 2")
                    ForEach(0..<5) { _ in Color.green }
                }
                GridRow {
                    Text("Row 3")
                    ForEach(0..<4) { _ in Color.orange }
                }
            }
            .padding()

            Grid {
                GridRow {
                    ForEach(0..<3) { _ in Rectangle().foregroundColor(.red) }
                }
                GridRow {
                    Rectangle().foregroundColor(.green)
                    Text("This text will span to two columns")
                        .gridCellColumns(2) // Span two columns.
                }
                GridRow {
                    ForEach(0..<3) { _ in Rectangle().foregroundColor(.orange) }
                }
            }
            .padding()

            Grid {
                GridRow {
                    Rectangle().foregroundColor(.green)

                    // Align the entire second column.
                    Text("Trailing text")
                        .gridColumnAlignment(.trailing)

                    Rectangle().foregroundColor(.green)
                }
                GridRow {
                    Text("Row 2, Col 1")
                    Text("Row 2, Col 2")
                    Text("Row 2, Col 3")
                }
                GridRow {
                    ForEach(0..<3) { _ in Rectangle().foregroundColor(.orange) }
                }
            }
            .padding()

            Grid {
                GridRow {
                    Rectangle().foregroundColor(.green).frame(width: 100, height: 100)
                    Rectangle().foregroundColor(.green).frame(width: 100, height: 100)
                    Rectangle().foregroundColor(.green).frame(width: 100, height: 100)
                }
                GridRow {
                    Rectangle().foregroundColor(.orange).frame(width: 100, height: 100)
                    Rectangle()
                        .foregroundColor(.orange)
                        .frame(width: 20, height: 20)
                        .gridCellAnchor(.topTrailing)
                    Rectangle()
                        .foregroundColor(.orange)
                        .frame(width: 20, height: 20)
                        .gridCellAnchor(UnitPoint(x: 0.25, y: 0.75))
                }
            }
            .padding()
        }
        .frame(minHeight: 900)
    }
}

#Preview {
    GridViewDemo()
}
