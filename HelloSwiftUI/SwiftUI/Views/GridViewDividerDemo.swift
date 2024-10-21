//
//  GridViewDividerDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/21/24.
//

import SwiftUI

// https://rohit-13.medium.com/exploring-the-swiftuis-grid-view-lazyvgrid-griditem-and-grid-gridrow-888fca958b0f


struct GridViewDividerDemo: View {
    var body: some View {
        VStack {
            Grid {
                GridRow {
                    Text("Hello")
                    Image(systemName: "globe")
                }
                GridRow {
                    Image(systemName: "hand.wave")
                    Text("World")
                }
            }
            .padding()

            Grid {
                GridRow {
                    Text("Hello")
                    Image(systemName: "globe")
                }

                // This Divider will takes as much space as its parent offers
                Divider()

                GridRow {
                    Image(systemName: "hand.wave")
                    Text("World")
                }
            }
            .padding()

            Grid {
                GridRow {
                    Text("Hello")
                    Image(systemName: "globe")
                }
                Divider()
                    .gridCellUnsizedAxes(.horizontal) // ***
                GridRow {
                    Image(systemName: "hand.wave")
                    Text("World")
                }
            }
            .padding()
        }
    }
}

#Preview {
    GridViewDemo()
}
