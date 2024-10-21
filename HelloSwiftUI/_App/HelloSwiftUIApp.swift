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
        DemoWindowGroup { LinkDemoView() }

        DemoWindowGroup { ForEachDemoView() }
        DemoWindowGroup { ListDemoView() }
        DemoWindowGroup { ListEditDemoView() }
        DemoWindowGroup { GridViewDemoView() }
        DemoWindowGroup { GridViewDividerDemoView() }

        DemoWindowGroup { NavigationViewDemoView() }

        DemoWindowGroup { StateObjectDemoView() }
        DemoWindowGroup { EnvironmentObjectDemoView() }

        DemoWindowGroup { TaskDemoView() }
        DemoWindowGroup { OnThisDayView() }
    }
}

struct DemoListView: View {

    var body: some View {
        VStack(alignment: .leading) {
//            ForEach(DemoWindowGroupList.contentViewNames.indices, id: \.self) { index in
//                let typeName = DemoWindowGroupList.contentViewNames[index]
//                Button(typeName) {
//                    openWindow(id: typeName)
//                }
//            }
            OpenDemoButton("ButtonDemoView")
            OpenDemoButton("LinkDemoView")
            Spacer()
            OpenDemoButton("ForEachDemoView")
            OpenDemoButton("ListDemoView")
            OpenDemoButton("ListEditDemoView")
            OpenDemoButton("GridViewDemoView")
            OpenDemoButton("GridViewDividerDemoView")
            Spacer()
            OpenDemoButton("NavigationViewDemoView")
            Spacer()
            OpenDemoButton("StateObjectDemoView")
            OpenDemoButton("EnvironmentObjectDemoView")
            Spacer()
            OpenDemoButton("TaskDemoView")
            OpenDemoButton("OnThisDayView")
        }
        .frame(minWidth: 200, alignment: .top)
        .padding()
    }
}

struct OpenDemoButton: View {
    @Environment(\.openWindow) private var openWindow
//    @Environment(\.dismissWindow) private var dismissWindow

    let contentTypeName: String

    init(_ contentTypeName: String) {
        self.contentTypeName = contentTypeName
    }

    var body: some View {
        Button(contentTypeName) {
            openWindow(id: contentTypeName)
        }
    }
}
