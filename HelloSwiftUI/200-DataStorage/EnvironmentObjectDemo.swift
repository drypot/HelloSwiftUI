//
//  EnvironmentObjectDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/17/24.
//

import SwiftUI

struct EnvironmentObjectDemo: View {

    @Observable class UserSettings {
        var counter: Int = 0
    }

    @State var settings = UserSettings()

    var body: some View {
        VStack {
            SubView()
            SubView2()
        }
        .environment(settings)
    }

    struct SubView: View {
        @Environment(UserSettings.self) var settings

        var body: some View {
            Text("Counter: \(settings.counter)")
        }
    }

    struct SubView2: View {
        @Environment(UserSettings.self) var settings

        var body: some View {
            Button("Increment") {
                settings.counter += 1
            }
        }
    }

}

#Preview {
    EnvironmentObjectDemo()
}
