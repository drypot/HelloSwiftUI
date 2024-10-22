//
//  MenuDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/22/24.
//

import SwiftUI

struct MenuSample: Commands {
    var body: some Commands {
        EmptyCommands()
    }
}

struct MenuDemo: View {
    @State private var selectedItem: String?

    let items = ["Item 1", "Item 2", "Item 3"]

    var body: some View {
        NavigationSplitView {
            List(items, id:\.self, selection: $selectedItem) { item in
                Text(item)
            }
            .navigationTitle("Items")
        } detail: {
            if let selectedItem {
                Text("Detail for \(selectedItem)")
            } else {
                Text("Select an item")
            }
        }
    }
}

#Preview {
    MenuDemo()
}
