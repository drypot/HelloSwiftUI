//
//  LinkDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/17/24.
//

import SwiftUI

struct LinkDemo: View {

    var body: some View {
        VStack(spacing: 25) {
            do {
                let title = "Open Safari"
                let url = URL(string: "https://www.apple.com/safari/")!
                Link(title, destination: url)
                    .onHover { inside in
                        if inside {
                            NSCursor.pointingHand.push()
                        } else {
                            NSCursor.pop()
                        }
                    }
            }
            Button("Open Safari") {
                guard let url = URL(string: "https://www.apple.com/safari/") else { return }
                NSWorkspace.shared.open(url)
            }
        }

    }
}

#Preview {
    LinkDemo()
}
