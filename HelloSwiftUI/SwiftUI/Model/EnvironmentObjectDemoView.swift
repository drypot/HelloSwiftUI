//
//  EnvironmentObjectDemoView.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/17/24.
//

import SwiftUI

struct EnvironmentObjectDemoView: View {

    class UserSettings: ObservableObject {
        @Published var username: String = "Unknown"
    }

    var settings = UserSettings()

    var body: some View {
        SubView()
            .environmentObject(settings)
    }

    struct SubView: View {
        @EnvironmentObject var settings: UserSettings

        var body: some View {
            VStack {
                Text("Username: \(settings.username)")

                Button("Change Username") {
                    settings.username = "Jane Doe"
                }
            }
        }
    }

}

#Preview {
    EnvironmentObjectDemoView()
}
