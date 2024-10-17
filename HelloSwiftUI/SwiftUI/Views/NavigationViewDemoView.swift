//
//  NavigationViewDemoView.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/17/24.
//

import SwiftUI

struct NavigationViewDemoView: View {

    let fruits = ["Apple", "Banana", "Orange"]

    var body: some View {
        NavigationView {
            List(fruits, id: \.self) { fruit in
                NavigationLink(destination: DetailView(item: fruit)) {
                    Text(fruit)
                }
            }
            .listStyle(.sidebar)
            .frame(minWidth: 150)

            DetailView(item: nil)
        }
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: toggleSidebar) {
                    Image(systemName: "sidebar.left")
                }
            }
        }
    }

    private func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }

    struct DetailView: View {
        let item: String?
        var body: some View {
            Group {
                if let item {
                    VStack {
                        Text("Details about \(item)")
                    }
                } else {
                    Text("Select an item")
                }
            }
            .frame(minWidth: 600, maxHeight: 600)
        }
    }
}

#Preview {
    NavigationViewDemoView()
}
