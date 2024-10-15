//
//  OnThisDayView.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/15/24.
//

import SwiftUI

struct OnThisDayView: View {

    typealias EventType = OnThisDay.EventType

    @State private var eventType: EventType? = .events

    var body: some View {
        NavigationView {
            SidebarView(selection: $eventType)
            Text("Fake details")
        }
        .frame(
            minWidth: 700, idealWidth: 1000, maxWidth: .infinity,
            minHeight: 400, idealHeight: 800, maxHeight: .infinity
        )
    }
}

#Preview {
    OnThisDayView()
}
