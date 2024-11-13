//
//  ListWithLoop.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/14/24.
//

import SwiftUI

struct ListWithLoop: View {

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
