//
//  ToolbarDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/22/24.
//

import SwiftUI



struct CustomToolbar: ToolbarContent {

    var body: some ToolbarContent {

        ToolbarItem(placement: .automatic) {
            Button {
                print("Leading button tapped")
            } label: {
                Label("Menu", systemImage: "line.horizontal.3")
            }
            .help("Help 1")
        }

        ToolbarItem(placement: .automatic) {
            Button {
                print("Trailing button tapped")
            } label: {
                Label("Add", systemImage: "plus")
            }
            .help("Help 2")
        }
    }

}
