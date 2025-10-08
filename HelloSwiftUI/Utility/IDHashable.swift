//
//  IDHashable.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/24/24.
//

import Foundation

nonisolated protocol IDHashable: Identifiable, Hashable {
}

extension IDHashable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
