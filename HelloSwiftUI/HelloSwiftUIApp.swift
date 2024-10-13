//
//  HelloSwiftUIApp.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 9/17/24.
//

import SwiftUI

@main
struct HelloSwiftUIApp: App {
    var body: some Scene {
        WindowGroup("SwiftUI Demo List") {
            DemoListView()
        }

        DemoWindowGroup { ButtonDemoView() }
        DemoWindowGroup { TaskDemoView() }
    }
}

struct DemoListView: View {
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(DemoWindowGroupList.typeNames.indices, id: \.self) { index in
                let typeName = DemoWindowGroupList.typeNames[index]

                Button(typeName) {
                    openWindow(id: typeName)
                }
            }
        }
        .frame(minWidth: 200, alignment: .topLeading)
        .padding()
    }
}

struct DemoWindowGroupList {
    static var typeNames: [String] = []
}

struct DemoWindowGroup<Content: View>: Scene {
    let content: Content
    var typeName: String { String(describing: Content.self) }

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
        DemoWindowGroupList.typeNames.append(typeName)
    }

    var body: some Scene {
        WindowGroup(typeName, id: typeName) {
            content
        }
    }
}
