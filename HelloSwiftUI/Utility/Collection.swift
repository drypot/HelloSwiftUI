//
//  Collection.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 7/8/25.
//

import Foundation

extension Collection {
    func element(at index: Index, default defaultValue: @autoclosure () -> Element) -> Element {
        return indices.contains(index) ? self[index] : defaultValue()
    }
}
