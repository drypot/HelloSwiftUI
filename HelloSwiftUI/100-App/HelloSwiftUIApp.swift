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

struct DemoNavigator: View {

    @State var searchText = ""

    var body: some View {
        NavigationSplitView {
            DemoList()
        } detail: {
            DefaultView()
        }
        .toolbar {
            CustomToolbar() // ToolbarDemo
        }
        .searchable(text: $searchText)
    }

    struct DemoList: View {
        var body: some View {
            List {
                Section {
                    NavigationLink("Default") { DefaultView() }
                }
                Section {
                    NavigationLink("Window") { WindowDemo() }
                }
                Section {
                    NavigationLink("NavigationSplitView") { NavigationSplitViewDemoPlaceholder() }
                }
                Section {
                    NavigationLink("StateObject") { StateObjectDemo() }
                    NavigationLink("StateLifeCylce") { StateLifeCylceDemo() }
                    NavigationLink("EnvironmentObject") { EnvironmentObjectDemo() }
                    NavigationLink("SceneObject") { SceneStorageDemo() }
                    NavigationLink("Observable") { ObservableDemo() }
                }
                Section {
                    NavigationLink("Text") { TextDemo() }
                    NavigationLink("TextField") { TextFieldDemo() }
                    NavigationLink("Button") { ButtonDemo() }
                    NavigationLink("Link") { LinkDemo() }
                    NavigationLink("Menu") { MenuDemo() }
                    NavigationLink("DatePicker") { DatePickerDemo() }
                }
                Section {
                    NavigationLink("Command") { CommandDemo() }
                    NavigationLink("Context Menu") { ContextMenuDemo() }
                }
                Section {
                    NavigationLink("ForEach") { ForEachDemo() }
                    NavigationLink("List") { ListDemo() }
                    NavigationLink("ListEdit") { ListEditDemo() }
                }
                Section {
                    NavigationLink("GridView") { GridViewDemo() }
                    NavigationLink("GridViewDivider") { GridViewDividerDemo() }
                    NavigationLink("LazyGridView") { LazyGridViewDemo() }
                    NavigationLink("LazyGridView 2") { LazyGridViewDemo2() }
                }
                Section {
                    NavigationLink("Table") { TableDemo() }
                }
                Section {
                    Text("Badge Sample")
                        .badge(123)
                }
                Section {
                    NavigationLink("Task") { TaskDemo() }
                }
            }
            .frame(minWidth: 180)
        }
    }

}
