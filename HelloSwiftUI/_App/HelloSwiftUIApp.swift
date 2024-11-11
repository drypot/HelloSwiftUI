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

    @State private var searchText = ""

    var body: some View {
        NavigationSplitView {
            DemoList()
        } detail: {
            Spacer()
            Text("Select demo")
            Spacer().frame(height: 20)
            Text("Search Text: \(searchText)")
            Spacer()
        }
        .toolbar {
            CustomToolbar()
        }
        .searchable(text: $searchText)
    }

    struct DemoList: View {
        var body: some View {
            List {
                Section {
                    NavigationLink("Window") { WindowDemoLauncher() }
                }
                Section {
                    NavigationLink("NavigationSplitView") { NavigationSplitViewDemoLauncher() }
                }
                Section {
                    NavigationLink("Button") { ButtonDemo() }
                    NavigationLink("Link") { LinkDemo() }
                    NavigationLink("Menu") { MenuDemo() }
                    NavigationLink("Context Menu") { ContextMenuDemo() }
                    NavigationLink("Command") { CommandDemo() }
                    NavigationLink("DatePicker") { DatePickerDemo() }
                }
                Section {
                    Text("Badge Sample")
                        .badge(123)
                }
                Section {
                    NavigationLink("ForEach") { ForEachDemo() }
                    NavigationLink("List") { ListDemo() }
                    NavigationLink("ListEdit") { ListEditDemo() }
                    NavigationLink("GridView") { GridViewDemo() }
                    NavigationLink("GridViewDivider") { GridViewDividerDemo() }
                    NavigationLink("LazyGridView") { LazyGridViewDemo() }
                    NavigationLink("LazyGridView 2") { LazyGridViewDemo2() }
                    NavigationLink("Table") { TableDemo() }
                }
                Section {
                    NavigationLink("StateObject") { StateObjectDemo() }
                    NavigationLink("EnvironmentObject") { EnvironmentObjectDemo() }
                    NavigationLink("SceneObject") { SceneStorageDemoLauncher() }
                }
                Section {
                    NavigationLink("Task") { TaskDemo() }
                    NavigationLink("OnThisDay") { OnThisDayView() }
                }
            }
            .frame(minWidth: 180)
        }
    }
}
