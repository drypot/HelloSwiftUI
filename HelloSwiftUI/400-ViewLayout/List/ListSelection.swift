//
//  ListSelection.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/14/24.
//

import SwiftUI

struct ListSelection: View {

    struct Item: Identifiable {
        let id = UUID()
        let name: String
    }

    let items = [
        Item(name: "Item 1"),
        Item(name: "Item 2"),
        Item(name: "Item 3")
    ]

    @State private var selection = Set<Item.ID>()

    var body: some View {
        HStack {
            List(items, selection: $selection) { item in
                Text(item.name)
            }
            
            List {
                ForEach(items) { item in
                    if selection.contains(item.id) {
                        Text(item.name)
                    }
                }
            }
        }
    }
}
