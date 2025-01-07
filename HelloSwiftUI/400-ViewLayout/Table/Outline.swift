//
//  Outline.swift
//  HelloSwiftUI
//
//  Created by Thierry hentic on 05/01/2025.
//


import SwiftUI


struct OutlineItem: Identifiable {
    let id = UUID()
    var name: String
    var children: [OutlineItem]?
    var isLoading: Bool = false // Indique si les données sont en cours de chargement
}

struct OutlineView: View {
    @State private var selectedItem: OutlineItem?
    let items: [OutlineItem]

    var body: some View {
        List {
            ForEach(items) { item in
                OutlineRow(item: item, selectedItem: $selectedItem)
            }
        }
        .frame(minWidth: 300, minHeight: 400)
    }
}

struct OutlineRow: View {
    let item: OutlineItem
    @Binding var selectedItem: OutlineItem?

    var body: some View {
        if let children = item.children {
            DisclosureGroup(item.name) {
                ForEach(children) { child in
                    OutlineRow(item: child, selectedItem: $selectedItem)
                        .padding(.leading, 20)
                }
            }
        } else {
            Text(item.name)
                .background(item.id == selectedItem?.id ? Color.blue.opacity(0.2) : Color.clear)
                .onTapGesture {
                    selectedItem = item
                }
        }
    }
}

struct ContentView: View {
    var body: some View {
        OutlineView(items: sampleData)
            .padding()
    }
}

let sampleData: [OutlineItem] = [
    OutlineItem(name: "Folder 1", children: [
        OutlineItem(name: "File 1.1"),
        OutlineItem(name: "File 1.2")
    ]),
    OutlineItem(name: "Folder 2", children: [
        OutlineItem(name: "File 2.1"),
        OutlineItem(name: "Subfolder 2.1", children: [
            OutlineItem(name: "File 2.1.1"),
            OutlineItem(name: "File 2.1.2")
        ])
    ]),
    OutlineItem(name: "File 3")
]


struct OutlineViewDemo: View {
    var body: some View {
        OutlineView(items: sampleData)
            .frame(minWidth: 300, minHeight: 400) // Dimensions minimales
            .padding()
    }
}

