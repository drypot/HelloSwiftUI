//
//  Fixture.swift
//  GPXWorkshop
//
//  Created by Kyuhyun Park on 6/7/24.
//

// https://forums.swift.org/t/how-can-i-access-a-file-inside-of-an-xctestcase/53424/3

import Foundation

struct Fixture {

    static func url(basePath: String, relativePath: String) -> URL {
        return URL(fileURLWithPath: basePath)
            .deletingLastPathComponent()
            .appendingPathComponent(relativePath)
    }

    static func data(basePath: String, relativePath: String) throws -> Data {
        let url = Fixture.url(basePath: basePath, relativePath: relativePath)
        return try Data(contentsOf: url)
    }

}
