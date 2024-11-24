//
//  ListHierarchical.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/14/24.
//

import SwiftUI

struct ListHierarchical: View {

    struct FileItem: Hashable, Identifiable, CustomStringConvertible {
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

    let fileHierarchyData: [FileItem] = [
        FileItem(
            name: "users",
            children: [
                FileItem(
                    name: "user1234",
                    children: [
                        FileItem(
                            name: "Photos",
                            children: [
                                FileItem(name: "photo001.jpg"),
                                FileItem(name: "photo002.jpg")
                            ]
                        ),
                        FileItem(
                            name: "Movies",
                            children: [FileItem(name: "movie001.mp4")]
                        ),
                        FileItem(
                            name: "Documents",
                            children: []
                        )
                    ]
                ),
                FileItem(
                    name: "newuser",
                    children: [
                        FileItem(name: "Documents", children: [])
                    ]
                )
            ]
        ),
        FileItem(name: "private", children: nil)
    ]

    // 이런 것은 현업에선 모델로.
    var fileNames: [UUID: String] {
        var fileNames = [UUID: String]()

        func forEach(_ fileItem: FileItem) {
            fileNames[fileItem.id] = fileItem.name
            if let children = fileItem.children {
                for child in children {
                    forEach(child)
                }
            }
        }

        for fileItem in fileHierarchyData {
            forEach(fileItem)
        }

        return fileNames
    }

    @State private var singleSelection: UUID?

    var body: some View {
        List(fileHierarchyData, children: \.children, selection: $singleSelection) { item in
            Text(item.description)
        }

        List {
            if let singleSelection {
                Text(fileNames[singleSelection]!)
            }
        }
    }

}
