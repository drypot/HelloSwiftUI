//
//  Files.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/13/24.
//

import Foundation

func makeDownloadURL(fileName: String) throws -> URL? {
    let downloadsURL = try FileManager.default.url(
        for: .downloadsDirectory,
        in: .userDomainMask,
        appropriateFor: nil,
        create: true
    )
    return downloadsURL.appendingPathComponent(fileName)
}

