//
//  CommandDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/22/24.
//

import SwiftUI

struct CustomCommands: Commands {

    @AppStorage("showTotals") var showTotals = true

    var body: some Commands {

        SidebarCommands()
        ToolbarCommands()

        // 새로운 최상단 메뉴 항목을 만들 때
        CommandMenu("Custom") {
            Button("Do Action 1") {
                print("Action 1 triggered")
            }
            .keyboardShortcut("1", modifiers: [.command])

            Button("Do Action 2") {
                print("Action 2 triggered")
            }
            .keyboardShortcut("2", modifiers: [.command, .shift])

            Divider()

            Toggle(isOn: $showTotals) {
                Text("Show Totals")
            }
            .keyboardShortcut("t", modifiers: .command)

            Divider()

            DisplayModePicker()
        }

        // 기본 메뉴 틀에서 적당한 곳에 나만의 메뉴 항목을 삽입할 때.
        CommandGroup(before: .help) {
            Button("Do Action 3") {
                print("Action 3 triggered")
            }
            .keyboardShortcut("/", modifiers: [.command])
        }

        //EmptyCommands()

    }
}

