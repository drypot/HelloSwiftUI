//
//  ButtonDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/13/24.
//

import SwiftUI

struct ButtonDemo: View {
    var body: some View {
        VStack(alignment: .leading) {
            Button("Button") {
                print("clicked")
            }

            Button("Button with SystemImage", systemImage: "2.square.fill") {
                print("clicked")
            }

            Button {
                print("clicked")
            } label: {
                Text("Button with Label")
            }

            Button {
                print("clicked")
            } label: {
                Label("Button with Label and Image", systemImage: "2.circle")
            }

            Button {
                print("clicked")
            } label: {
                HStack {
                    Text("Button HStack")
                    Image(systemName: "square.and.arrow.down.fill")
                }
            }

            Button ("Button Style Automatic") {
                print("clicked")
            }
            .buttonStyle(.automatic)

            Button ("Button Style Plain") {
                print("clicked")
            }
            .buttonStyle(.plain)

            Button ("Button Style Bordered") {
                print("clicked")
            }
            .buttonStyle(.bordered)

            Button ("Button Style BorderedProminent") {
                print("clicked")
            }
            .buttonStyle(.borderedProminent)

            Button ("Button Style Borderless") {
                print("clicked")
            }
            .buttonStyle(.borderless)

            Button ("Button Modified") {
                print("clicked")
            }
            .frame(width: 200, height: 40)
            .font(.title)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
            .buttonStyle(.plain)

            Button("Button Modified") {
                print("clicked")
            }
            .tint(.green)
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
    }
}

#Preview {
    ButtonDemo()
}
