//
//  SceneStorageDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/23/24.
//

import SwiftUI

struct SceneStorageDemo: View {
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("SceneStorage Demo")
                .font(.title)
            Text("SceneStorage Demo 윈도우들을 띄워 message 가 서로 공유되지 않음을 확인한다")
            Button("Open SceneStorage Demo") {
                openWindow(id: "SceneStorage Demo")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(32)
    }
}

struct SceneStorageDemoContent: View {
    @SceneStorage("sceneMessage") var message: String = ""

    var body: some View {
        Text("Enter Scene Message")
        TextField("", text: $message)
            .frame(maxWidth: 300)
        Text(message)
    }
}

#Preview {
    SceneStorageDemoContent()
}
