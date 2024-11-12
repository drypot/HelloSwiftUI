//
//  NavigationSplitViewDemo2.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/22/24.
//

import SwiftUI

struct NavigationSplitViewDemo2: View {

    let items = ["Item 1", "Item 2", "Item 3"]
    let subItems = ["SubItem A", "SubItem B"]

    @State private var selectedItem: String?
    @State private var selectedSubItem: String?

    var body: some View {
        NavigationSplitView {
            List(items, id:\.self, selection: $selectedItem) { item in
                NavigationLink(item, value: item)
            }
            .navigationTitle("Main Items")
        } content: {
            List(subItems, id:\.self, selection: $selectedSubItem) { subItem in
                NavigationLink(subItem, value: subItem)
            }
            .navigationTitle("Sub Items")
        } detail: {
            if let selectedItem, let selectedSubItem {
                Text("Detail for \(selectedItem) + \(selectedSubItem)")
            } else {
                Text("...")
            }
        }
    }
}

#Preview {
    NavigationSplitViewDemo()
}
