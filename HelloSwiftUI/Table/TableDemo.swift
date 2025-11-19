//
//  TableDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/23/24.
//

import SwiftUI

struct TableDemo: View {

    nonisolated struct Person: Identifiable {
        var id = UUID()
        var name: String
        var age: Int
        var city: String
    }

    @State private var people = [
        Person(name: "John", age: 28, city: "New York"),
        Person(name: "Emma", age: 32, city: "San Francisco"),
        Person(name: "Michael", age: 40, city: "Chicago"),
        Person(name: "Baby", age: 7, city: "Seoul"),
    ]

    @State private var sortOrder = [KeyPathComparator(\Person.name)]

//    @State private var sortOrder: [KeyPathComparator<Person>] = [
//        .init(\.name, order: .forward)
//    ]

    @State private var selected: Set<UUID> = []

    var body: some View {
        Table(people, selection: $selected, sortOrder: $sortOrder) {
            TableColumn("Name", value: \.name)
            TableColumn("Age", value: \.age) { Text("\($0.age)") }
            TableColumn("City", value: \.city)
        }
        .onAppear {
            people.sort(using: sortOrder)
        }
        .onChange(of: sortOrder) { oldOrder, newOrder in
            people.sort(using: newOrder)
        }
    }
}

#Preview {
    TableDemo()
}
