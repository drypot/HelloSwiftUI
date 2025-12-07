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
                Section("Labeled") {
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

                Section("Labeled + Styled") {
                    Button {
                        print("clicked")
                    } label: {
                        Label("Unstyled", systemImage: "2.square.fill")
                    }

                    Button {
                        print("clicked")
                    } label: {
                        Label("Plain", systemImage: "2.square.fill")
                    }
                    .buttonStyle(.plain)

                    Button {
                        print("clicked")
                    } label: {
                        Label("Automatic", systemImage: "2.square.fill")
                    }
                    .buttonStyle(.automatic)

                    Button {
                        print("clicked")
                    } label: {
                        Label("Bordered", systemImage: "2.square.fill")
                    }
                    .buttonStyle(.bordered)

                    Button {
                        print("clicked")
                    } label: {
                        Label("Borderless", systemImage: "2.square.fill")
                    }
                    .buttonStyle(.borderless)

                    Button {
                        print("clicked")
                    } label: {
                        Label("BorderedProminent", systemImage: "2.square.fill")
                    }
                    .buttonStyle(.borderedProminent)
                }

                Section("Modified") {
                    Button ("Modified") {
                        print("clicked")
                    }
                    .frame(width: 200, height: 40)
                    .font(.title)
                    .foregroundColor(.white)
                    .background(.blue)
                    .buttonStyle(.plain)
                    .cornerRadius(10)

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
