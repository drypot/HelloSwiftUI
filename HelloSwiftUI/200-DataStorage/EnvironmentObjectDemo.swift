//
//  EnvironmentObjectDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/17/24.
//

import SwiftUI

struct EnvironmentObjectDemo: View {

    class UserSettings: ObservableObject {
        @Published var counter: Int = 0
    }

    var settings = UserSettings()

    var body: some View {
        VStack {
            SubView()
            SubView2()
        }
    }

    struct SubView: View {
        @EnvironmentObject var settings: UserSettings

        var body: some View {
            Text("Counter: \(settings.counter)")
        }
    }

    struct SubView2: View {
        @EnvironmentObject var settings: UserSettings

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
