//
//  SimpleReferenceFileDocument.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/28/24.
//

import SwiftUI
import UniformTypeIdentifiers
import os

// ReferenceFileDocument 은  ObservableObject, Sendable 하다.

final class JsonDocument: ReferenceFileDocument {
    typealias Snapshot = String

    static var readableContentTypes: [UTType] { [.json] }

    nonisolated(unsafe) var content: String
    let snapshotCache: OSAllocatedUnfairLock<String>

    init(content: String = "") {
        self.content = content
        self.snapshotCache = .init(initialState: content)
    }

    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        self.content = string
        self.snapshotCache = .init(initialState: content)
    }

    func updateSnapshotCache() {
        snapshotCache.withLock { $0 = content }
    }

    func snapshot(contentType: UTType) throws -> Snapshot {
        snapshotCache.withLock { $0 }
    }

    func fileWrapper(snapshot: Snapshot, configuration: WriteConfiguration) throws -> FileWrapper {
        let data = snapshot.data(using: .utf8) ?? Data()
        return FileWrapper(regularFileWithContents: data)
    }

}

struct JsonDocumentView: View {

    @ObservedObject var document: JsonDocument

    var body: some View {
        TextEditor(text: $document.content)
            .font(.custom("HelveticaNeue", size: 18))
            .foregroundStyle(Color.pink)
            .lineSpacing(5)
            .scenePadding()
    }
}
