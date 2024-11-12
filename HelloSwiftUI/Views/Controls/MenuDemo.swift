//
//  MenuDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/22/24.
//

import SwiftUI

struct MenuDemo: View {

    var body: some View {
        HStack {
            Menu("Options") {
                Button("Option 1", action: clicked)

                Button(action: clicked) {
                    Label("Option 2", systemImage: "2.circle")
                }

                Menu("More Options") {
                    Button("Option 3", action: clicked)
                    Button("Option 4", action: clicked)
                }
            }
            .frame(minWidth: 150, maxWidth: 200)

            Divider()

            Menu {
                Button("Option 1", action: clicked)

                Button(action: clicked) {
                    Label("Option 2", systemImage: "2.circle")
                }

                Menu("More Options") {
                    Button("Option 3", action: clicked)
                    Button("Option 4", action: clicked)
                }
            } label: {
                Label("Options 2", systemImage: "ellipsis.circle")
            }
            .frame(minWidth: 150, maxWidth: 200)

        }
    }

    func clicked() {
        print("menu clicked")
    }

}

#Preview {
    MenuDemo()
}
