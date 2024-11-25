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
    @StateObject var appState = AppState()
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {

        // 각종 Scene 들은 View 트리의 루트가 된다.

        WindowGroup("SwiftUI Demo") {
            DemoNavigator()
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

        WindowGroup("NavigationSplitViewDemo", id: "NavigationSplitViewDemo") {
            NavigationSplitViewDemo()
        }

        WindowGroup("SceneStorage Demo", id: "SceneStorage Demo") {
            SceneStorageDemoContent()
        }

    }
}

