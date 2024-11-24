//
//  ListWithSelection.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/14/24.
//

import SwiftUI

struct ListWithSelection: View {

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
