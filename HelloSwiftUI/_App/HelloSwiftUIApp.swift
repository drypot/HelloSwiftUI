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

    // 같은 @AppStorage 변수 선언은 여러 스트럭쳐에 나와도 상관이 없다.
    // 어차피 UserDefaults 가 소스라서.
    @AppStorage("showTotals") var showTotals: Bool = true

    @State private var searchText = ""

    var body: some View {
        NavigationSplitView {
            DemoList()
        } detail: {
            Spacer()

            OpenWindows()
            Spacer()

            Text("Show Totals: \(showTotals)")
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
                    NavigationLink("Open Windows") { OpenWindows() }
                }
                Section {
                    NavigationLink("Button") { ButtonDemo() }
                    NavigationLink("Link") { LinkDemo() }
                    NavigationLink("Menu") { MenuDemo() }
                    NavigationLink("Context Menu") { ContextMenuDemo() }
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

struct OpenWindows: View {

    @Environment(\.openWindow) private var openWindow

    var body: some View {
        VStack {
            Button("Open WindowGroup Scene") {
                openWindow(id: "WindowGroup Demo")
            }
            Button("Open Window Scene") {
                openWindow(id: "Window Demo")
            }
            Button("Open NavigationSplitView Demo") {
                openWindow(id: "NavigationSplitView Demo")
            }
            Button("Open NavigationSplitView Demo 2") {
                openWindow(id: "NavigationSplitView Demo 2")
            }
            Button("Open NavigationSplitView Demo 3") {
                openWindow(id: "NavigationSplitView Demo 3")
            }
            Button("Open SceneStorage Demo") {
                openWindow(id: "SceneStorage Demo")
            }
        }
    }
}
