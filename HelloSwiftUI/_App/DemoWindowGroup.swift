//
//  DemoWindowGroup.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/15/24.
//

import SwiftUI

struct DemoWindowGroupList {
    static var typeNames: [String] = []
}

struct DemoWindowGroup<ContentView: View>: Scene {
    let content: ContentView
    var typeName: String { String(describing: ContentView.self) }

    init(@ViewBuilder content: () -> ContentView) {
        self.content = content()
        DemoWindowGroupList.typeNames.append(typeName)
    }

    var body: some Scene {
        WindowGroup(typeName, id: typeName) {
            content
        }
    }
}
