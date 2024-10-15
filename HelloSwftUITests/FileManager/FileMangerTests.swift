//
//  FileMangerTests.swift
//  HelloSwftUITests
//
//  Created by Kyuhyun Park on 10/13/24.
//

import Testing

struct FileMangerTests {

    @Test func testMakeDownloadURL() async throws {
        let url = try makeDownloadURL(fileName: "sample.json")

        print("\(url!.absoluteString)")
        #expect(url!.absoluteString.contains("sample.json"))
    }

}
