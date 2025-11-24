//
//  ButtonDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/13/24.
//

import SwiftUI

struct ButtonDemo: View {
    var body: some View {
        ScrollView {
            Form {
                Section("Labeled Buttons") {
                    Button("Button") {
                        print("clicked")
                    }

                    Button("SystemImage", systemImage: "2.square.fill") {
                        print("clicked")
                    }

                    Button {
                        print("clicked")
                    } label: {
                        Text("Label")
                    }

                    Button {
                        print("clicked")
                    } label: {
                        Label("Label and SystemImage", systemImage: "2.square.fill")
                    }

                    Button {
                        print("clicked")
                    } label: {
                        HStack {
                            Text("HStack")
                            Image(systemName: "square.and.arrow.down.fill")
                        }
                    }
                }

                Section("Styled Buttons") {
                    Button ("Unstyled") {
                        print("clicked")
                    }

                    Button ("Plain") {
                        print("clicked")
                    }
                    .buttonStyle(.plain)

                    Button ("Automatic") {
                        print("clicked")
                    }
                    .buttonStyle(.automatic)

                    Button ("Bordered") {
                        print("clicked")
                    }
                    .buttonStyle(.bordered)

                    Button ("Borderless") {
                        print("clicked")
                    }
                    .buttonStyle(.borderless)

                    Button ("BorderedProminent") {
                        print("clicked")
                    }
                    .buttonStyle(.borderedProminent)
                }

                Section("Modified Buttons") {
                    Button ("Modified") {
                        print("clicked")
                    }
                    .frame(width: 200, height: 40)
                    .font(.title)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
                    .buttonStyle(.plain)

                    Button("Modified") {
                        print("clicked")
                    }
                    .tint(.green)
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .controlSize(.large)
                }
            }
            .formStyle(.grouped)
        }
    }
}

#Preview {
    ButtonDemo()
}
