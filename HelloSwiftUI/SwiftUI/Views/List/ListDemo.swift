//
//  ListDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/17/24.
//

import SwiftUI

// List is a view that displays a scrollable list of items arranged in a single column.

struct ListDemo: View {

    let fruits = ["Apple", "Banana", "Orange"]

    struct Item: Identifiable {
        let id = UUID()
        let name: String
    }

    let items = [
        Item(name: "Item 1"),
        Item(name: "Item 2"),
        Item(name: "Item 3")
    ]

    var body: some View {
        VStack {
            Group1
            Group2
            Group3
        }
        .frame(minWidth: 800, minHeight: 600)
    }

    var Group1: some View {
        HStack(alignment: .top) {
            List {
                Text("Row 1")
                Text("Row 2")
                Text("Row 3")
            }

            List {
                Text("Row 1")
                Text("Row 2")
                Text("Row 3")
            }
            .listStyle(.plain)

            List {
                Text("Row 1")
                    .listRowSeparator(.hidden)
                Text("Row 2")
                    .listRowSeparator(.hidden)
                Text("Row 3")
            }

            ScrollView {
                VStack {
                    ForEach(0..<3) { index in
                        Text("Row \(index)")
                            .padding()
                    }
                }
            }
        }
    }

    var Group2: some View {
        HStack(alignment: .top) {
            List {
                ForEach(fruits, id: \.self) { fruit in
                    Text(fruit)
                }
            }

            List(fruits, id: \.self) { fruit in
                Text(fruit)
            }

            List(items) { item in
                Text(item.name)
            }
        }
    }

    var Group3: some View {
        HStack(alignment: .top) {
            List {
                Section(header: Text("Fruits")) {
                    Text("Apple")
                    Text("Banana")
                }
                Section(header: Text("Vegetables")) {
                    Text("Carrot")
                    Text("Tomato")
                }
            }
            List {
                Section("Fruits") {
                    Text("Apple")
                    Text("Banana")
                }
                Section("Vegetables") {
                    Text("Carrot")
                    Text("Tomato")
                }
            }
        }
    }

}

#Preview {
    ListDemo()
}

