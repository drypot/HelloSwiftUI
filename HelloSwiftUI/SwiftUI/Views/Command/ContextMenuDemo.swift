//
//  ContextMenuDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/22/24.
//

import SwiftUI

struct ContextMenuDemo: View {

    var body: some View {
        Color.green
            .contextMenu {
                Button("Option 1", action: clicked)

                Button(action: clicked) {
                    Label("Option 2", systemImage: "2.circle")
                }

                Menu("More Options") {
                    Button("Option 3", action: clicked)
                    Button("Option 4", action: clicked)
                }
            }
    }

    func clicked() {
        print("menu clicked")
    }
    
}

#Preview {
    ContextMenuDemo()
}
