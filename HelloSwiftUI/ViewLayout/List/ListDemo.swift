//
//  ListDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/17/24.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/lists
// List displays a one-dimensional vertical collection of views.

// ForEach 는 루프 하나로 끝나지만,
// List 안에는 ForEach 여러 개를 넣을 수도 있고 비 루프 콤포넌트도 넣을 수 있어서 서로 다르다.

struct ListDemo: View {

    let demoList = [
        "List 1", "List 2", "List 3",
        "List 8", "List 9",
    ]

    @State var currentDemo = "List 1"

    var body: some View {
        HStack {
            List(demoList, id:\.self, selection: $currentDemo) { demo in
                Text(demo)
            }
            .frame(maxWidth: 200)

            switch currentDemo {
            case "List 1": ListDemo1()
            case "List 2": ListDemo2()
            case "List 3": ListDemo3()
            case "List 8": ListDemo8()
            case "List 9": ListDemo9()
            default: Text("Invalid Selection")
            }
        }
    }

}

// https://developer.apple.com/documentation/swiftui/list

struct ListDemo1: View {
    var body: some View {
        List {
            Text("first")
            Text("second")
            Text("third")
        }
    }
}

struct ListDemo2: View {

    struct Ocean: Identifiable {
        let name: String
        let id = UUID()
    }

    let oceans = [
        Ocean(name: "Pacific"),
        Ocean(name: "Atlantic"),
        Ocean(name: "Indian"),
        Ocean(name: "Southern"),
        Ocean(name: "Arctic")
    ]

    var body: some View {
        List(oceans) {
            Text($0.name)
        }
    }
    
}

struct ListDemo3: View {

    struct Ocean: Identifiable, Hashable {
        let name: String
        let id = UUID()
    }

    private var oceans = [
        Ocean(name: "Pacific"),
        Ocean(name: "Atlantic"),
        Ocean(name: "Indian"),
        Ocean(name: "Southern"),
        Ocean(name: "Arctic")
    ]

    @State private var multiSelection = Set<UUID>()

    var body: some View {
        List(oceans, selection: $multiSelection) {
            Text($0.name)
        }

        List {
            ForEach(oceans) { ocean in
                if multiSelection.contains(ocean.id) {
                    Text(ocean.name)
                }
            }
        }
    }
}

// https://developer.apple.com/documentation/swiftui/displaying-data-in-lists

struct ListDemo8: View {

    struct Person: Identifiable {
        let id = UUID()
        var name: String
        var phoneNumber: String
    }

    struct Department: Identifiable {
        let id = UUID()
        var name: String
        var staff: [Person]
    }

    struct Company {
        var departments: [Department]
    }

    var company = Company(departments: [
        Department(name: "Sales", staff: [
            Person(name: "Juan Chavez", phoneNumber: "(408) 555-4301"),
            Person(name: "Mei Chen", phoneNumber: "(919) 555-2481"),
            // ...
        ]),
        Department(name: "Engineering", staff: [
            Person(name: "Bill James", phoneNumber: "(408) 555-4450"),
            Person(name: "Anne Johnson", phoneNumber: "(417) 555-9311"),
            // ...
        ]),
        // ...
    ])

    var body: some View {
        List {
            ForEach(company.departments) { department in
                Section(header: Text(department.name)) {
                    ForEach(department.staff) { person in
                        PersonRowView(person: person)
                    }
                }
            }
        }
    }

    struct PersonRowView: View {
        var person: Person

        var body: some View {
            VStack(alignment: .leading, spacing: 3) {
                Text(person.name)
                    .foregroundColor(.primary)
                    .font(.headline)
                HStack(spacing: 3) {
                    Label(person.phoneNumber, systemImage: "phone")
                }
                .foregroundColor(.secondary)
                .font(.subheadline)
            }
        }
    }
}

struct ListDemo9: View {

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

