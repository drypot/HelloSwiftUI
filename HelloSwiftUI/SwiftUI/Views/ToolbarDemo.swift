//
//  ToolbarDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/22/24.
//

import SwiftUI

// 툴바 편집 기능은 다음에 정말 필요하면.
// 다행이 그리 복잡해 보이진 않는다.

struct CustomToolbar: ToolbarContent {

    enum ViewMode: Int {
        case grid
        case table
    }

    @State private var viewMode: ViewMode = .grid

    var body: some ToolbarContent {

        ToolbarItem(placement: .navigation) {
            Button(action: clicked) {
                Label("Menu", systemImage: "line.horizontal.3")
            }
        }

        ToolbarItem(placement: .principal) {
            Button(action: clicked) {
                Label("Write", systemImage: "square.and.pencil")
            }
        }

        ToolbarItem(placement: .status) {
            Button(action: clicked) {
                Label("iCloud", systemImage: "icloud")
            }
        }

        ToolbarItem(id: "viewMode", placement: .status) {
            Picker("View Mode", selection: $viewMode) {
                Label("Grid", systemImage: "square.grid.3x2").tag(ViewMode.grid)
                Label("Table", systemImage: "tablecells").tag(ViewMode.table)
            }
            .pickerStyle(.segmented)
            .help("Switch between Grid and Table")
        }

        ToolbarItem(placement: .primaryAction) {
            Button(action: clicked) {
                Label("Download", systemImage: "square.and.arrow.down")
            }
        }

        ToolbarItem {
            Button(action: clicked) {
                Label("Add", systemImage: "plus")
            }
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
