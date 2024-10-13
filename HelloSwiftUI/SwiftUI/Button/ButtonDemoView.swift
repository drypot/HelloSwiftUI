//
//  ButtonDemoView.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/13/24.
//

import SwiftUI

struct ButtonDemoView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Button("Button") {
                print("clicked")
            }

            Button ("Button automatic") {
                print("clicked")
            }
            .buttonStyle(.automatic)

            Button ("Button plain") {
                print("clicked")
            }
            .buttonStyle(.plain)

            Button ("Button bordered") {
                print("clicked")
            }
            .buttonStyle(.bordered)

            Button ("Button borderedProminent") {
                print("clicked")
            }
            .buttonStyle(.borderedProminent)

            Button ("Button borderless") {
                print("clicked")
            }
            .buttonStyle(.borderless)

            Button {
                print("clicked")
            } label: {
                HStack {
                    Text("Button Customized")
                    Image(systemName: "square.and.arrow.down.fill")
                }
            }

            Button ("Button modified") {
                print("clicked")
            }
            .frame(width: 200, height: 40)
            .font(.title)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    ButtonDemoView()
}
