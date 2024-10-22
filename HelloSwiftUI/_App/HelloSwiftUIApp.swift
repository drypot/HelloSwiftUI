//
//  HelloSwiftUIApp.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 9/17/24.
//

import SwiftUI

@main
struct HelloSwiftUIApp: App {

    static var demoBuilders = [AnyView]()

    var body: some Scene {
        WindowGroup("SwiftUI Demo") {
            DemoList()
        }

        WindowGroup("WindowGroup Demo", id: "WindowGroup Demo") {
            Text("WindowGroup Demo")
        }

        Window("Window Demo", id: "Window Demo") {
            Text("Window Demo")
        }

        WindowGroup("Menu Demo", id: "Menu Demo") {
            MenuDemo()
        }
        .commands {
            MenuSample()
        }

        WindowGroup("NavigationSplitView Demo", id: "NavigationSplitView Demo") {
            NavigationSplitViewDemo()
        }

        WindowGroup("NavigationSplitView Demo 2", id: "NavigationSplitView Demo 2") {
            NavigationSplitViewDemo2()
        }
    }
}

struct OpenOtherWindows: View {

    @Environment(\.openWindow) private var openWindow
    //    @Environment(\.dismissWindow) private var dismissWindow

    var body: some View {
        Button("Open WindowGroup Scene") {
            openWindow(id: "WindowGroup Demo")
        }
        Button("Open Window Scene") {
            openWindow(id: "Window Demo")
        }
        Button("Open Menu Demo") {
            openWindow(id: "Menu Demo")
        }
        Button("Open NavigationSplitView Demo") {
            openWindow(id: "NavigationSplitView Demo")
        }
        Button("Open NavigationSplitView Demo 2") {
            openWindow(id: "NavigationSplitView Demo 2")
        }
    }
}

struct DemoList: View {

    var body: some View {
        return NavigationSplitView {
            List {
                Section {
                    NavigationLink("Other Windows") { OpenOtherWindows() }
                }
                Section {
                    NavigationLink("Button") { ButtonDemo() }
                    NavigationLink("Link") { LinkDemo() }
                }
                Section {
                    NavigationLink("ForEach") { ForEachDemo() }
                    NavigationLink("List") { ListDemo() }
                    NavigationLink("ListEdit") { ListEditDemo() }
                    NavigationLink("GridView") { GridViewDemo() }
                    NavigationLink("GridViewDivider") { GridViewDividerDemo() }
                    NavigationLink("LazyGridView") { LazyGridViewDemo() }
                    NavigationLink("LazyGridView 2") { LazyGridViewDemo2() }
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
        } detail: {
            OpenOtherWindows()
        }
    }

}
