//
//  OnThisDayView.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/15/24.
//

import SwiftUI

struct OnThisDayView: View {
    var body: some View {
        NavigationView {
            Text("Fake sidebar")
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
