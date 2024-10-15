//
//  DemoListView.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/15/24.
//

import SwiftUI

struct DemoListView: View {
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(DemoWindowGroupList.typeNames.indices, id: \.self) { index in
                let typeName = DemoWindowGroupList.typeNames[index]
                Button(typeName) {
                    openWindow(id: typeName)
                }
            }
        }
        .frame(minWidth: 200, alignment: .top)
        .padding()
    }
}
