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

    struct Demo: Identifiable, Hashable, IDHashable {
        let id = UUID()
        let label: String
        let view: AnyView
    }

    struct DemoSection: Identifiable, Hashable, IDHashable {
        let id = UUID()
        let label: String
        let demoList: [Demo]
    }

    static let demoSections = [
        DemoSection(
            label: "Window",
            demoList: [
                Demo(label: "Window", view: AnyView(WindowDemo())),
            ]
        ),
        DemoSection(
            label: "Navigation",
            demoList: [
                Demo(label: "NavigationSplitView", view: AnyView(NavigationSplitViewDemoPlaceholder())),
                Demo(label: "TabView", view: AnyView(TabViewDemo())),
            ]
        ),
        DemoSection(
            label: "DataStorage",
            demoList: [
                Demo(label: "StateObject", view: AnyView(StateObjectDemo())),
                Demo(label: "StateLifeCylce", view: AnyView(StateLifeCylceDemo())),
                Demo(label: "EnvironmentObject", view: AnyView(EnvironmentObjectDemo())),
                Demo(label: "SceneObject", view: AnyView(SceneStorageDemo())),
                Demo(label: "Observable", view: AnyView(ObservableDemo())),
            ]
        ),
        DemoSection(
            label: "View",
            demoList: [
                Demo(label: "Text", view: AnyView(TextDemo())),
                Demo(label: "TextField", view: AnyView(TextFieldDemo())),
                Demo(label: "Button", view: AnyView(ButtonDemo())),
                Demo(label: "Link", view: AnyView(LinkDemo())),
                Demo(label: "Menu", view: AnyView(MenuDemo())),
                Demo(label: "DatePicker", view: AnyView(DatePickerDemo())),
            ]
        ),
        DemoSection(
            label: "Command",
            demoList: [
                Demo(label: "Command", view: AnyView(CommandDemo())),
                Demo(label: "Context Menu", view: AnyView(ContextMenuDemo())),
            ]
        ),
        DemoSection(
            label: "List",
            demoList: [
                Demo(label: "List Simple", view: AnyView(ListSimple())),
                Demo(label: "List Styles", view: AnyView(ListStyles())),
                Demo(label: "List Selection", view: AnyView(ListSelection())),
                Demo(label: "List with Section", view: AnyView(ListWithSection())),
                Demo(label: "List Hierarchical", view: AnyView(ListHierarchical())),
                Demo(label: "List Edit", view: AnyView(ListEditDemo())),
                Demo(label: "ForEach", view: AnyView(ForEachDemo())),
                Demo(label: "LazyVStack", view: AnyView(LazyVStackDemo())),
            ]
        ),
        DemoSection(
            label: "Grid",
            demoList: [
                Demo(label: "GridView", view: AnyView(GridViewDemo())),
                Demo(label: "GridViewDivider", view: AnyView(GridViewDividerDemo())),
                Demo(label: "LazyGridView", view: AnyView(LazyGridViewDemo())),
                Demo(label: "LazyGridView2", view: AnyView(LazyGridViewDemo2())),
            ]
        ),
        DemoSection(
            label: "Table",
            demoList: [
                Demo(label: "Table", view: AnyView(TableDemo())),
            ]
        ),
        DemoSection(
            label: "Grouping",
            demoList: [
                Demo(label: "Group", view: AnyView(GroupDemo())),
            ]
        ),
        DemoSection(
            label: "Task",
            demoList: [
                Demo(label: "Task", view: AnyView(TaskDemo())),
            ]
        ),
    ]

    @State var selectedSection = Self.demoSections[8]
    @State var selectedDemo = Self.demoSections[8].demoList[0]

    @State var searchText = ""

    var body: some View {
        NavigationSplitView {
            List(Self.demoSections, selection: $selectedSection) { section in
                NavigationLink(section.label, value: section)
            }
            .onChange(of: selectedSection) { oldValue, newValue in
                selectedDemo = newValue.demoList[0]
            }
        } content: {
            List(selectedSection.demoList, selection: $selectedDemo) { demo in
                NavigationLink(demo.label, value: demo)
            }
        } detail: {
            selectedDemo.view
        }
        .toolbar {
            CustomToolbar() // ToolbarDemo
        }
        .searchable(text: $searchText)
    }

}
