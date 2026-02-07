//
//  ListHierarchical.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/14/24.
//

import SwiftUI

struct ListHierarchical: View {

    struct FileItem: Identifiable, Hashable, CustomStringConvertible {
        var id = UUID()
        var name: String
        var children: [FileItem]? = nil
        var description: String {
            switch children {
            case nil:
                return "📄 \(name)"
            case .some(let children):
                return children.isEmpty ? "📂 \(name)" : "📁 \(name)"
            }
        }
    }

    static let fileTree: [FileItem] = [
        FileItem(name: "users", children: [
            FileItem(name: "user1234", children: [
                FileItem(name: "Photos", children: [
                    FileItem(name: "photo001.jpg"),
                    FileItem(name: "photo002.jpg")
                ]),
                FileItem( name: "Movies", children: [
                    FileItem(name: "movie001.mp4")
                ]),
                FileItem(name: "Documents", children: [])
            ]),
            FileItem(name: "newuser", children: [
                FileItem(name: "Documents", children: [])
            ])
        ]),
        FileItem(name: "private", children: nil)
    ]

    static var fileNames = {
        var fileNames = [FileItem.ID: String]()

        func forEach(_ file: FileItem) {
            fileNames[file.id] = file.name
            if let children = file.children {
                for child in children {
                    forEach(child)
                }
            }
        }

        for file in fileTree {
            forEach(file)
        }

        return fileNames
    }()

    @State private var selectedFile: FileItem.ID?

    var body: some View {
        HStack {
            List(Self.fileTree, children: \.children, selection: $selectedFile) { file in
                Text(file.description)
            }

            List {
                if let selectedFile {
                    Text(Self.fileNames[selectedFile]!)
                }
            }
        }
    }

}
