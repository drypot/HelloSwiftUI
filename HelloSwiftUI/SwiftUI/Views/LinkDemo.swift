//
//  LinkDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/17/24.
//

import SwiftUI

struct LinkDemo: View {

    let list = [
        ("Open Safari", "https://www.apple.com/safari/"),
        ("RaySoda", "http://raysoda.com/")
    ]

    var body: some View {
        VStack {
            ForEach(list, id: \.0) { tuple in
                let title = tuple.0
                let url = URL(string: tuple.1)!
                Link(title, destination: url)
                    .onHover { inside in
                        if inside {
                            NSCursor.pointingHand.push()
                        } else {
                            NSCursor.pop()
                        }
                    }
            }
        }

    }
}

#Preview {
    LinkDemo()
}
