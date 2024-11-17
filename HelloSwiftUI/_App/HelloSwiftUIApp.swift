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
        WindowGroup("SwiftUI Demo") {
            DemoNavigator()
                .useDisplayMode()
        }
        .commands {
            CustomCommands()
        }

        WindowGroup("WindowGroup Demo", id: "WindowGroup Demo") {
            Text("WindowGroup Demo")
        }

        Window("Window Demo", id: "Window Demo") {
            Text("Window Demo")
        }

        WindowGroup("NavigationSplitView Demo", id: "NavigationSplitView Demo") {
            NavigationSplitViewDemo()
        }

        WindowGroup("NavigationSplitView Demo 2", id: "NavigationSplitView Demo 2") {
            NavigationSplitViewDemo2()
        }

        WindowGroup("NavigationSplitView Demo 3", id: "NavigationSplitView Demo 3") {
            NavigationSplitViewDemo3()
        }

        WindowGroup("SceneStorage Demo", id: "SceneStorage Demo") {
            SceneStorageDemo()
        }

    }
}

struct DemoNavigator: View {

    @State var searchText = ""

    var body: some View {
        NavigationSplitView {
            DemoList()
        } detail: {
            TestingView()
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
                    NavigationLink("Testing") { TestingView() }
                }
                Section {
                    NavigationLink("Window") { WindowDemoLauncher() }
                }
                Section {
                    NavigationLink("NavigationSplitView") { NavigationSplitViewDemoLauncher() }
                }
                Section {
                    NavigationLink("StateObject") { StateObjectDemo() }
                    NavigationLink("StateLifeCylce") { StateLifeCylceDemo() }
                    NavigationLink("EnvironmentObject") { EnvironmentObjectDemo() }
                    NavigationLink("SceneObject") { SceneStorageDemoLauncher() }
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
