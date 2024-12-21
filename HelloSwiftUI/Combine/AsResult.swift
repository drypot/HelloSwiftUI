//
//  AsResult.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/16/24.
//

import Foundation
import Combine

extension Publisher {
  func asResult() -> AnyPublisher<Result<Output, Failure>, Never> {
    self
      .map(Result.success)
      .catch { error in
        Just(.failure(error))
      }
      .eraseToAnyPublisher()
  }
}
