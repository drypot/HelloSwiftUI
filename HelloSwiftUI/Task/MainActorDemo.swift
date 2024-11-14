//
//  MainActorDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/14/24.
//

import Foundation

// async 없는 @MainActor 평션이 있을 때

@MainActor
fileprivate func assertMainActor() { }

struct AssertMainActorChecker {

    // sync 펑션에서 @MainActor 펑션 부르려면 컴파일 에러.

    func syncNoMainActor() {
        //assertMainActor()
    }

    // sync 펑션에서 @MainActor 펑션 부르려면 자기도 @MainActor.

    @MainActor func syncWithMainActor() {
        assertMainActor()
    }

    // async 펑션에서 @MainActor 펑션 부르려면 await.

    func asyncNoMainActor() async {
        await assertMainActor()
    }

    // @MainActor async 펑션에서 @MainActor 펑션 부르려면 await 빼야.

    @MainActor
    func asyncWithMainActor() async {
        assertMainActor()
    }
}
