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

        DemoWindowGroup { ButtonDemo() }
        DemoWindowGroup { LinkDemo() }

        DemoWindowGroup { ForEachDemo() }
        DemoWindowGroup { ListDemo() }
        DemoWindowGroup { ListEditDemo() }
        DemoWindowGroup { GridViewDemo() }
        DemoWindowGroup { GridViewDividerDemo() }

        DemoWindowGroup { NavigationViewDemo() }

        DemoWindowGroup { StateObjectDemo() }
        DemoWindowGroup { EnvironmentObjectDemo() }

        DemoWindowGroup { TaskDemo() }
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

            OpenDemoWindow("ButtonDemo")
            OpenDemoWindow("LinkDemo")
            Spacer()
            OpenDemoWindow("ForEachDemo")
            OpenDemoWindow("ListDemo")
            OpenDemoWindow("ListEditDemo")
            OpenDemoWindow("GridViewDemo")
            OpenDemoWindow("GridViewDividerDemo")
            Spacer()
            OpenDemoWindow("NavigationViewDemo")
            Spacer()
            OpenDemoWindow("StateObjectDemo")
            OpenDemoWindow("EnvironmentObjectDemo")
            Spacer()
            OpenDemoWindow("TaskDemo")
            OpenDemoWindow("OnThisDay")

        }
        .frame(minWidth: 200, alignment: .top)
        .padding()
    }
}

struct OpenDemoWindow: View {
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
