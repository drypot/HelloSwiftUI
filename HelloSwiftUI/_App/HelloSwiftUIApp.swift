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
    }
}


struct DemoList: View {

    var body: some View {
        NavigationSplitView {
            List() {
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
                    //NavigationLink("NavigationView") { NavigationViewDemo() }
                    NavigationLink("Window") { WindowDemo() }
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
            Text("Choose anything from the sidebar")
        }
    }

}
