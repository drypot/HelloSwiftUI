//
//  NavigationSplitViewDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/23/24.
//

import SwiftUI

struct NavigationSplitViewDemo: View {

    let items = ["Item 1", "Item 2", "Item 3"]

    @State private var selectedItem: String?

    var body: some View {
        NavigationSplitView {
            List(items, id:\.self, selection: $selectedItem) { item in
                NavigationLink(item, value: item)
            }
            .navigationTitle("Items")
        } detail: {
            if let selectedItem {
                Text("Detail for \(selectedItem)")
            } else {
                Text("...")
            }
        }
    }

}

#Preview {
    NavigationSplitViewDemo()
}
