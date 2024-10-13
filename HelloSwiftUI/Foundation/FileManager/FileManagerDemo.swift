//
//  Files.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/13/24.
//

import Foundation

func makeDownloadURL(fileName: String) -> URL? {
    let fileManager = FileManager.default
    do {
        let downloadsFolder = try fileManager.url(
            for: .downloadsDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true)
        let jsonFile = downloadsFolder.appendingPathComponent(fileName)
        return jsonFile
    } catch {
        print(error)
        return nil
    }
}

