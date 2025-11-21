//
//  FormDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/21/25.
//

import SwiftUI

struct FormDemo: View {
    var body: some View {
        ScrollView {
            VStack {
                TabView {
                    Tab {
                        SampleForm()
                            .formStyle(.grouped)
                    } label: {
                        Text("Grouped")
                    }
                    Tab {
                        SampleForm()
                            .formStyle(CustomFormStyle())
                        Spacer()
                    } label: {
                        Text("Custom")
                    }
                    Tab {
                        SampleForm()
                            .padding()
                        Spacer()
                    } label: {
                        Text("Default")
                    }
                }
            }
            .padding()
        }
    }

    struct SampleForm: View {
        var body: some View {
            Form {
                Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
                Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
                Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
            }
        }
    }

    struct CustomFormStyle: FormStyle {
        func makeBody(configuration: Configuration) -> some View {
            VStack(alignment: .leading, spacing: 4) {
                configuration.content
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.quinary)
                    )
                    //.shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
            }
            .padding()
        }
    }
}

#Preview {
    FormDemo()
}
