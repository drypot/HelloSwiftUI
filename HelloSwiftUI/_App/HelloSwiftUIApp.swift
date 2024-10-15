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
        WindowGroup("SwiftUI Demo List") {
            DemoListView()
        }

        DemoWindowGroup { ButtonDemoView() }
        DemoWindowGroup { TaskDemoView() }
        DemoWindowGroup { OnThisDayView() }
    }
}
