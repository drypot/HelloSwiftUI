//
//  HelloSwftUITests.swift
//  HelloSwftUITests
//
//  Created by Kyuhyun Park on 10/13/24.
//

import Testing

struct FileMangerTests {

    @Test func makeDownloadURLTest() async throws {
        let url = makeDownloadURL(fileName: "sample.json")
        print("\(url!.absoluteString)")
        #expect(url!.absoluteString.contains("sample.json"))
    }

}
