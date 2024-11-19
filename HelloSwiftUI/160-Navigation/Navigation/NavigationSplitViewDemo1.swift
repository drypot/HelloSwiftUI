//
//  NavigationSplitViewDemo1.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/23/24.
//

import SwiftUI

struct NavigationSplitViewDemo1: View {

    typealias ItemID = UUID

    @Observable class Model {
        struct Item: Identifiable {
            let id = ItemID()
            let name: String
        }

        let items = [
            Item(name:"Item 1"),
            Item(name:"Item 2"),
            Item(name:"Item 3"),
        ]

        var dic: [ItemID: Item] = [:]

        init() {
            for item in items {
                dic[item.id] = item
            }
        }
    }

    @State var model = Model()
    @State var selectedIds: Set<ItemID> = []

    var body: some View {
        NavigationSplitView {
            List(model.items, selection: $selectedIds) { item in
                Text(item.name)
                //NavigationLink(item.name, value: item)
            }
            .navigationTitle("Items")
        } detail: {
            let selectedItems = selectedIds.compactMap { model.dic[$0] }
            ForEach(selectedItems) { item in
                Text(item.name)
            }
        }
    }

}

#Preview {
    NavigationSplitViewDemo1()
}
