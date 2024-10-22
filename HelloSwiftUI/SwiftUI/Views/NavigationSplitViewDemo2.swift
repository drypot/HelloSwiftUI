//
//  NavigationSplitViewDemo2.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/22/24.
//

import SwiftUI

struct NavigationSplitViewDemo2: View {

    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink("Category 1", value: "Category 1")
                NavigationLink("Category 2", value: "Category 2")
            }
            .listStyle(.sidebar)
            .navigationDestination(for: String.self) { category in
                CategoryView(category: category)
            }
            .navigationTitle("Sidebar")
        } content: {
            ContentUnavailableView("Select an element from the sidebar", systemImage: "doc.text.image.fill")
        } detail: {
            ContentUnavailableView("Select an element from the list", systemImage: "doc.text.image.fill")
        }
    }

    struct CategoryView: View {
        let category: String

        var body: some View {
            List {
                NavigationLink("\(category) Item 1", value: "\(category) Item 1")
                NavigationLink("\(category) Item 2", value: "\(category) Item 2")
            }
            .navigationDestination(for: String.self) { item in
                DetailView(item: item)
            }
            .navigationTitle("Content")
        }
    }

    struct DetailView: View {
        let item: String

        var body: some View {
            Text("Details for \(item)")
                .navigationTitle("Detail")
        }
    }
}

#Preview {
    NavigationSplitViewDemo2()
}
