//
//  DocumentDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/26/24.
//

import SwiftUI
import UniformTypeIdentifiers

// https://developer.apple.com/documentation/swiftui/documents
// https://developer.apple.com/documentation/swiftui/documentgroup
// https://developer.apple.com/documentation/swiftui/environmentvalues/opendocument

struct DocumentGroupDemo: View {

    @Environment(\.openDocument) private var openDocument

    var body: some View {
        Button("Open FileDocument") {
            Task {
                guard let url = Bundle.main.url(forResource: "Sample", withExtension: "txt") else {
                    fatalError()
                }
                do {
                    try await openDocument(at: url)
                } catch {
                    fatalError()
                }
            }
        }
    }
}

#Preview {
    DocumentGroupDemo()
}
