//
//  _ModelData.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/1/24.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/model-data

// 애플 문서에서는 Data Model 의 인스턴스를 Model data 라고 부르고 있다.
// Model data 파트는 데이터 모델링이 아닌 모델 인스턴스를 관리하는 방법을 설명하고 있다고 보면 되겠다.

// Property Wrappers
// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties/#Property-Wrappers

// Managing user interface state
// https://developer.apple.com/documentation/swiftui/managing-user-interface-state

// @State,
// single source of truth 를 구축하고 싶은 데이터가 있다면 View 에 @State 로 저장한다.
// 서브 뷰에서 read only 데이터가 필요하면 일반 property 로 전달하고,
// two-way connection 이 필요하면 @Binding 으로 전달한다.
// SwiftUI 는 데이터 변화를 모니터링해서 데이터 변화의 영향을 맏는 뷰들을 업데이트한다.

// @State property 는 persistent storage 로 사용하면 안 된다.
// 뷰의 라이프 사이클이 끝나면 @State 도 날아간다.
// UI 파트에만 영향을 미치는 임시적인 데이터에만 사용한다.
