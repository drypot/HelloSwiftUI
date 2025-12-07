//
//  DismissButtonDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/7/25.
//

import SwiftUI

struct DismissButtonDemo: View {

    @State private var isPresented: Bool = true

    var body: some View {
        VStack {
            DismissButton(isPresented: $isPresented)
                .frame(width: 300, height: 100)
            Spacer()
        }
        .frame(width: 300, height: 300)
        .border(.gray, width: 1)
    }
}

struct DismissButton: View {

    @Binding var isPresented: Bool

    var body: some View {
        HStack {
            Spacer()
            Button {
                isPresented = false
                print("x button clicked")
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.foreground)
                    .imageScale(.large)
                    .frame(width: 30, height: 30)
            }
        }
    }
}
