//
//  GroupBoxDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/25/24.
//

import SwiftUI

struct GroupBoxDemo: View {

    var body: some View {
        HStack {
            GroupBox {
                ScrollView(.vertical, showsIndicators: true) {
                    Text(LoremIpsum.paragraphs[0])
                }
            } label: {
                Label("End-User Agreement", systemImage: "building.columns")
            }
            .frame(width: 200, height: 300)

            GroupBox {
                ScrollView(.vertical, showsIndicators: true) {
                    Text(LoremIpsum.paragraphs[0])
                }
            } label: {
                Label("End-User Agreement", systemImage: "building.columns")
            }
            .frame(width: 200, height: 300)
            .groupBoxStyle(CustomGroupBoxStyle())

        }
    }

    struct CustomGroupBoxStyle: GroupBoxStyle {
        func makeBody(configuration: Configuration) -> some View {
            VStack(alignment: .leading, spacing: 8) {
                configuration.label
                    .font(.headline)
                    .foregroundStyle(Color.blue)

                configuration.content
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.quinary)
                    }
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.blue, lineWidth: 2)
            }
        }
    }
}

#Preview {
    GroupBoxDemo()
}
