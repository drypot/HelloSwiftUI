//
//  SignUpFormViewModel.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/16/24.
//  Created by Peter Friese on 18.01.22.
//

import SwiftUI
import Combine
//import Navajo_Swift

// Asynchronous Programming with SwiftUI and Combine-Apress (2023), 8, 9, 10,

// MARK: - View Model
class SignUpFormViewModel: ObservableObject {
    typealias Available = Result<Bool, Error>

    // MARK: Input
    @Published var username: String = ""

    // MARK: Output
    @Published var usernameMessage: String = ""
    @Published var isValid: Bool = false
    @Published var showUpdateDialog: Bool = false

    private var authenticationService = AuthenticationService()

    private lazy var isUsernameAvailablePublisher: AnyPublisher<Available, Never> = {
        $username
            // 이벤트를 드롭하다가 일정 시간 후 최신 마지막 값을 내려 보낸다.
            .debounce(for: 0.8, scheduler: DispatchQueue.main)
            // 중복 이벤트를 제거한다.
            .removeDuplicates()
            .print("username")
            // element 에서 새로운 publisher 를 파생해야 할 경우 flatMap 을 쓴다.
            .flatMap { username -> AnyPublisher<Available, Never> in
//                self.authenticationService.checkUserNameAvailablePublisher(userName: username)
//                    .asResult()
                Just(true).setFailureType(to: Error.self).asResult()
            }
            // UI 로 값을 전달해야 하는 체인에 끼워 넣는다.
            .receive(on: DispatchQueue.main)
            // 여러 subscriber 가 붙을 경우 upstream 을 공유한다.
            .print("before share")
            .share()
            .print("share")
            .eraseToAnyPublisher()
    }()

    init() {
        isUsernameAvailablePublisher
            .map { result in
                switch result {
                case .failure(let error):
                    if case APIError.transportError(_) = error {
                        return ""
                    }
                    else if case APIError.validationError(let reason) = error {
                        return reason
                    }
                    else if case APIError.serverError(statusCode: _, reason: let reason, retryAfter: _) = error {
                        return reason ?? "Server error"
                    }
                    else {
                        return error.localizedDescription
                    }
                case .success(let isAvailable):
                    return isAvailable ? "" : "This username is not available"
                }
            }
            .assign(to: &$usernameMessage)

        isUsernameAvailablePublisher
            .map { result in
                if case .failure(let error) = result {
                    // 네트웍 에러에도 valid 상태로 해서 사용자가 최종 submit 은 가능하도록 한다.
                    if case APIError.transportError(_) = error {
                        return true
                    }
                    return false
                }
                if case .success(let isAvailable) = result {
                    return isAvailable
                }
                return true
            }
            .assign(to: &$isValid)

        // decoding error: display an error message suggesting to download a newer version
        isUsernameAvailablePublisher
            .map { result in
                if case .failure(let error) = result {
                    if case APIError.decodingError = error {
                        return true
                    }
                }
                return false
            }
            .assign(to: &$showUpdateDialog)
    }
    
}
