//
//  ToolbarDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/22/24.
//

import SwiftUI

struct CustomToolbar: ToolbarContent {

    var body: some ToolbarContent {

        ToolbarItem(placement: .navigation) {
            Button(action: clicked) {
                Label("Menu", systemImage: "line.horizontal.3")
            }
            .help("Help 1")
        }

        ToolbarItem(placement: .principal) {
            Button(action: clicked) {
                Label("Write", systemImage: "square.and.pencil")
            }
            .help("Help 2")
        }

        ToolbarItem(placement: .status) {
            Button(action: clicked) {
                Label("iCloud", systemImage: "icloud")
            }
            .help("Help 2")
        }

        ToolbarItem(placement: .primaryAction) {
            Button(action: clicked) {
                Label("Download", systemImage: "square.and.arrow.down")
            }
            .help("Help 2")
        }

        ToolbarItem {
            Button(action: clicked) {
                Label("Add", systemImage: "plus")
            }
            .help("Help 2")
        }

        ToolbarItemGroup {
            Button(action: clicked) {
                Label("Action 1", systemImage: "star")
            }

            Button(action: clicked) {
                Label("Action 2", systemImage: "heart")
            }
        }

    }

    func clicked() {
        print("clicked")
    }

}
