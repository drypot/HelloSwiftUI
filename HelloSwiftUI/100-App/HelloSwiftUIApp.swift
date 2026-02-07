//
//  HelloSwiftUIApp.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 9/17/24.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/app

// App 프로토콜을 구현하는 스트럭쳐가 app 실행의 진입점이 된다.

@main
struct HelloSwiftUIApp: App {

    // Scene 의 라이프 사이클과 관계없이 계속 보존해야 하는 state 들은 App 에 정의한다.

    @NSApplicationDelegateAdaptor var appDelegate: AppDelegate
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {

        // 각종 Scene 들은 View 트리의 루트가 된다.

        Window("SwiftUI Demo", id: "SwiftUI Demo") {
            DemoNavigatorView()
                .useDisplayMode()
        }
        .commands {
            CustomCommands()
        }
        .onChange(of: scenePhase) { oldScenePhase, newScenePhase in
            print("scenePhase: \(scenePhase)")
        }

        #if os(macOS)
        Settings {
            SettingsView()
        }
        #endif

        WindowGroup("WindowGroup Demo", id: "WindowGroup Demo") {
            Text("WindowGroup Demo")
        }

        WindowGroup("Message Demo", id: "Message Demo", for: SimpleMessage.ID.self) { $id in
            let message = SimpleMessage.messageById(id!)!
            SimpleMessageView(message: message)
        }

        
        Window("Window Demo", id: "Window Demo") {
            Text("Window Demo")
        }
        .windowStyle(.automatic)

        Window("Window Demo", id: "TitleBar Window Demo") {
            Text("Window Demo")
        }
        .windowStyle(.titleBar)

        Window("Window Demo", id: "HiddenTitleBar Window Demo") {
            Text("Window Demo")
        }
        .windowStyle(.hiddenTitleBar)


        Window("Window Demo", id: "DefaultSize Window Demo") {
            Text("Window Demo")
        }
        .defaultSize(width: 400, height: 400)

        Window("Window Demo", id: "ContentSize Window Demo") {
            Text("Window Demo")
                .frame(
                    minWidth: 200, maxWidth: 400,
                    minHeight: 200, maxHeight: 400
                )
        }
        .windowResizability(.contentSize)

        Window("Window Demo", id: "ContentMinSize Window Demo") {
            Text("Window Demo")
                .frame(
                    minWidth: 200, maxWidth: 400,
                    minHeight: 200, maxHeight: 400
                )
        }
        .windowResizability(.contentMinSize)

        Window("Window Demo", id: "BottomTrailing Window Demo") {
            Text("Window Demo")
        }
        .defaultPosition(.bottomTrailing)

        // https://developer.apple.com/documentation/swiftui/documentgroup
        // https://developer.apple.com/documentation/swiftui/filedocumentconfiguration

        DocumentGroup(newDocument: SimpleFileDocument()) { configuration in
            SimpleFileDocumentView(document: configuration.$document)
        }

        DocumentGroup(newDocument: { JsonDocument() }) { configuration in
            JsonDocumentView(document: configuration.document)
        }

        WindowGroup("NavigationSplit Demo", id: "NavigationSplit by ID Demo") {
            NavigationSplitByIDDemo()
        }

        WindowGroup("NavigationSplit Demo", id: "NavigationSplit by Value Demo") {
            NavigationSplitByValueDemo()
        }

        WindowGroup("NavigationSplit Demo", id: "NavigationSplit by Block Demo") {
            NavigationSplitByBlockDemo()
        }

        WindowGroup("NavigationSplit Demo", id: "NavigationSplit by AnyTypeID Demo") {
            NavigationSplitByAnyTypeIDDemo()
        }

        WindowGroup("NavigationSplit Demo", id: "NavigationSplit by AnyTypeValue Demo") {
            NavigationSplitByAnyTypeValueDemo()
        }

        WindowGroup("SceneStorage Demo", id: "SceneStorage Demo") {
            SceneStorageDemoContent()
        }

    }
}

