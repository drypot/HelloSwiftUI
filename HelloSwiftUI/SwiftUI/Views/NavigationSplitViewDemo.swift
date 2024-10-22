//
//  NavigationSplitViewDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/22/24.
//

import SwiftUI

struct NavigationSplitViewDemo: View {

    @State private var selectedItem: String? = "Item 1"
    @State private var selectedSubItem: String?

    let items = ["Item 1", "Item 2", "Item 3"]
    let subItems = ["SubItem A", "SubItem B"]

    var body: some View {
        NavigationSplitView {
            List(items, id:\.self, selection: $selectedItem) { item in
                Text(item)
            }
            .navigationTitle("Main Items")
        } content: {
            if let selectedItem {
                List(subItems, id:\.self, selection: $selectedSubItem) { subItem in
                    Text(selectedItem + " + " + subItem)
                }
                .listStyle(.sidebar)
                .navigationTitle("Sub Items")
            } else {
                Text("Select an item")
            }
        } detail: {
            if let selectedSubItem {
                Text("Detail for \(selectedSubItem)")
            } else {
                Text("Select a sub item")
            }
        }
    }
}

#Preview {
    MenuDemo()
}
