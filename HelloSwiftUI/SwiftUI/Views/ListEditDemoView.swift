//
//  ListDemoView.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/17/24.
//

import SwiftUI

// List is a view that displays a scrollable list of items arranged in a single column.

struct ListEditDemoView: View {

    @State var fruits = ["Apple", "Banana", "Orange"]

    struct Item: Identifiable {
        let id = UUID()
        let name: String
    }

    @State var items = [
        Item(name: "Item 1"),
        Item(name: "Item 2"),
        Item(name: "Item 3")
    ]

    @State private var isEditing = false

    var body: some View {
        VStack {
            Text("iOS 처럼 간단히 되지 않는다. 다음에 하기로.")
        }
        .frame(minWidth: 800, minHeight: 600)
    }
}

#Preview {
    ListEditDemoView()
}
