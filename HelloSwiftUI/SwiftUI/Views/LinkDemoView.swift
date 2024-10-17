//
//  LinkDemoView.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/17/24.
//

import SwiftUI

struct LinkDemoView: View {
    var body: some View {
        VStack {
            Link("Open Safari", destination: URL(string: "https://www.apple.com/safari/")!)
            Link("RaySoda", destination: URL(string: "http://raysoda.com/")!)
        }

    }
}

#Preview {
    LinkDemoView()
}
