//
//  SidebarView.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/16/24.
//

import SwiftUI

struct SidebarView: View {

    typealias EventType = OnThisDay.EventType

    @Binding var selection: EventType?

    var body: some View {
        List(selection: $selection) {
            Section("TODAY") {
                ForEach(EventType.allCases, id: \.self) { type in
                    Text(type.rawValue)
                }
            }
        }
        .listStyle(.sidebar) // .sidebar makes it slightly translucent.
    }
}

#Preview {
    Group {
        SidebarView(selection: .constant(nil))
            .preferredColorScheme(.light)
            .frame(width: 200)
        SidebarView(selection: .constant(nil))
            .preferredColorScheme(.dark)
            .frame(width: 200)
    }
}

