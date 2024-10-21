//
//  DemoWindowGroup.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/15/24.
//

import SwiftUI

struct DemoWindowGroupList {
    static var contentViewNames: [String] = []
}

struct DemoWindowGroup<ContentView: View>: Scene {
    let content: ContentView
    let contentViewName: String

    init(@ViewBuilder content: () -> ContentView) {
        self.content = content()
        self.contentViewName =  String(describing: ContentView.self)
        DemoWindowGroupList.contentViewNames.append(contentViewName)
    }

    var body: some Scene {
        WindowGroup(contentViewName, id: contentViewName) {
            content
        }
    }
}
