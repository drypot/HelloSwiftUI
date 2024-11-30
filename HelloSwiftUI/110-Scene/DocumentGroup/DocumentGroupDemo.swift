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
// https://developer.apple.com/documentation/swiftui/environmentvalues/newdocument

struct DocumentGroupDemo: View {

    @Environment(\.newDocument) private var newDocument
    @Environment(\.openDocument) private var openDocument

    var body: some View {
        Form {
            Button("New Text Document") {
                let sampleString = "In an age of endless noise and fleeting moments, the rarest treasures are found in the quiet places where we reconnect with ourselves."
                let document = SimpleFileDocument(content: sampleString)
                newDocument(document)
            }
            Button("New Json Document") {
                let sampleString = """
            {
                "fruit": "Apple",
                "size": "Large",
                "color": "Red"
            }
            
            """
                let document = JsonDocument(content: sampleString)
                newDocument({ document })
            }
        }
        .formStyle(.grouped)
    }
    
}

#Preview {
    DocumentGroupDemo()
}
