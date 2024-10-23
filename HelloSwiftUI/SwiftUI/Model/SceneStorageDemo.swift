//
//  SceneStorageDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/23/24.
//

import SwiftUI

struct SceneStorageDemo: View {

    @SceneStorage("sceneMessage") var message: String = ""

    var body: some View {
        Text("Enter Scene Message")
        TextField("", text: $message)
            .frame(maxWidth: 300)
    }
}

#Preview {
    SceneStorageDemo()
}
