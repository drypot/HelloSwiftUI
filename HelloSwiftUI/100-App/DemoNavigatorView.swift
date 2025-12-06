//
//  DemoNavigatorView.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 9/17/24.
//

import SwiftUI

struct DemoNavigatorView: View {

    struct DemoSection: Identifiable, Hashable, IDHashable {
        let id = UUID()
        let label: String
        let demos: [Demo]
    }

    struct Demo: Identifiable, Hashable, IDHashable {
        let id = UUID()
        let label: String
        let view: AnyView
    }

    static let demoSections = [
        DemoSection(
            label: "View",
            demos: [
                Demo(label: "View", view: AnyView(ViewDemo())),
                Demo(label: "Color", view: AnyView(ColorDemo())),
                Demo(label: "Background", view: AnyView(BackgroundDemo())),
            ]
        ),
        DemoSection(
            label: "Text",
            demos: [
                Demo(label: "Font", view: AnyView(FontDemo())),
                Demo(label: "FontWeight", view: AnyView(FontWeightDemo())),
                Demo(label: "ForegroundStyle", view: AnyView(ForegroundStyleDemo())),
            ]
        ),
        DemoSection(
            label: "Image",
            demos: [
                Demo(label: "Image", view: AnyView(ImageDemo())),
            ]
        ),
        DemoSection(
            label: "Scene",
            demos: [
                Demo(label: "Window", view: AnyView(WindowDemo())),
                Demo(label: "WindowGroup", view: AnyView(WindowGroupDemo())),
                Demo(label: "DocumentGroup", view: AnyView(DocumentGroupDemo())),
            ]
        ),
        DemoSection(
            label: "State",
            demos: [
                Demo(label: "StateLifecycle", view: AnyView(StateLifecycleDemo())),
                Demo(label: "Observable", view: AnyView(ObservableDemo())),
                Demo(label: "ObservableObject", view: AnyView(ObservableObjectDemo())),
                Demo(label: "SceneObject", view: AnyView(SceneStorageDemo())),
                Demo(label: "ViewID", view: AnyView(ViewIDDemo())),
                Demo(label: "StateAnimation", view: AnyView(StateAnimationDemo())),
            ]
        ),
        DemoSection(
            label: "Form",
            demos: [
                Demo(label: "Form", view: AnyView(FormDemo())),
                Demo(label: "Controls", view: AnyView(ControlsDemo())),
                Demo(label: "Button", view: AnyView(ButtonDemo())),
                Demo(label: "Menu", view: AnyView(MenuDemo())),
            ]
        ),
        DemoSection(
            label: "List",
            demos: [
                Demo(label: "List Simple", view: AnyView(ListSimple())),
                Demo(label: "List Loop", view: AnyView(ListLoop())),
                Demo(label: "List Section", view: AnyView(ListSection())),
                Demo(label: "List Hierarchical", view: AnyView(ListHierarchical())),
                Demo(label: "List Styles", view: AnyView(ListStyles())),
                Demo(label: "List Edit", view: AnyView(ListEditDemo())),
                Demo(label: "ForEach", view: AnyView(ForEachDemo())),
                Demo(label: "LazyVStack", view: AnyView(LazyVStackDemo())),
            ]
        ),
        DemoSection(
            label: "Custom List",
            demos: [
                Demo(label: "Custom List", view: AnyView(CustomListDemo())),
            ]
        ),
        DemoSection(
            label: "Grid",
            demos: [
                Demo(label: "Grid", view: AnyView(GridDemo())),
                Demo(label: "Grid Span", view: AnyView(GridSpanDemo())),
                Demo(label: "Grid Alignment", view: AnyView(GridAlignmentDemo())),
                Demo(label: "Grid Anchor", view: AnyView(GridAnchorDemo())),
                Demo(label: "Grid Divider", view: AnyView(GridDividerDemo())),
                Demo(label: "LazyGrid Icons", view: AnyView(LazyGridIconsDemo())),
                Demo(label: "LazyGrid", view: AnyView(LazyGridDemo())),
                Demo(label: "LazyGrid 2", view: AnyView(LazyGridDemo2())),
            ]
        ),
        DemoSection(
            label: "Table",
            demos: [
                Demo(label: "Table", view: AnyView(TableDemo())),
                Demo(label: "Outline", view: AnyView(OutlineViewDemo())),
                Demo(label: "Outline Col", view: AnyView(OutlineViewWithColumnsDemo()))
            ]
        ),
        DemoSection(
            label: "Grouping",
            demos: [
                Demo(label: "Group", view: AnyView(GroupDemo())),
                Demo(label: "Section", view: AnyView(SectionDemo())),
                Demo(label: "GroupBox", view: AnyView(GroupBoxDemo())),
            ]
        ),
        DemoSection(
            label: "Navigation",
            demos: [
                Demo(label: "NavigationSplitView", view: AnyView(NavigationSplitViewDemoPlaceholder())),
                Demo(label: "TabView", view: AnyView(TabViewDemo())),
            ]
        ),
        DemoSection(
            label: "Modal",
            demos: [
                Demo(label: "ModalDemo", view: AnyView(ModalDemo())),
            ]
        ),
        DemoSection(
            label: "Command",
            demos: [
                Demo(label: "Command", view: AnyView(CommandDemo())),
                Demo(label: "Context Menu", view: AnyView(ContextMenuDemo())),
            ]
        ),
        DemoSection(
            label: "NSViewRepresentable",
            demos: [
                Demo(label: "NSViewRepresentable", view: AnyView(NSViewRepresentableDemo())),
                Demo(label: "NSViewControllerRepresentable", view: AnyView(NSViewControllerRepresentableDemo())),
            ]
        ),
        DemoSection(
            label: "Task",
            demos: [
                Demo(label: "Task", view: AnyView(TaskDemo())),
            ]
        ),
        DemoSection(
            label: "Combine",
            demos: [
                Demo(label: "Combine", view: AnyView(CombineDemo())),
                Demo(label: "SignUpForm", view: AnyView(SignUpForm())),
            ]
        ),
    ]

    enum UserDefaultKeys: String {
        case sectionIndex
        case subSectionIndex
    }

    @State var selectedSection: DemoSection
    @State var selectedDemo: Demo

    @State var searchText = ""

    @State var isExpanded = true

    init() {
        let defaults = UserDefaults.standard
        let sectionIndex = defaults.integer(forKey: UserDefaultKeys.sectionIndex.rawValue)
        let subSectionIndex = defaults.integer(forKey: UserDefaultKeys.subSectionIndex.rawValue)
        let section = Self.demoSections.element(at: sectionIndex, default: Self.demoSections.first!)
        let demo = section.demos.element(at: subSectionIndex, default: section.demos.first!)
        _selectedSection = State(initialValue: section)
        _selectedDemo = State(initialValue: demo)
    }

    var body: some View {
        NavigationSplitView {
            List(selection: $selectedSection) {
                ForEach(Self.demoSections) { section in
                    NavigationLink(section.label, value: section)
                }
                Section {
                    Text("Badge")
                        .badge(36)
                }
                Section("Expandable", isExpanded: $isExpanded) {
                    Text("Item 1")
                    Text("Item 2")
                    Text("Item 3")
                }
            }
            .navigationSplitViewColumnWidth(min: 200, ideal: 200, max: 300)
            .onChange(of: selectedSection) { oldValue, newValue in
                let index = Self.demoSections.firstIndex(of: newValue)!
                UserDefaults.standard.set(index, forKey: UserDefaultKeys.sectionIndex.rawValue)
                selectedDemo = newValue.demos[0]
            }
        } content: {
            List(selectedSection.demos, selection: $selectedDemo) { demo in
                NavigationLink(demo.label, value: demo)
            }
            .navigationSplitViewColumnWidth(min: 200, ideal: 200, max: 300)
            .onChange(of: selectedDemo) { oldValue, newValue in
                let index = selectedSection.demos.firstIndex(of: newValue)!
                UserDefaults.standard.set(index, forKey: UserDefaultKeys.subSectionIndex.rawValue)
            }
        } detail: {
            selectedDemo.view
//                .navigationSplitViewColumnWidth(min: 200, ideal: 250, max: 300)

        }
        .toolbar {
            CustomToolbar() // ToolbarDemo
        }
        .searchable(text: $searchText)
    }

}
