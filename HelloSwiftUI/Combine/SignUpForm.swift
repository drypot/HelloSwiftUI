//
//  SignUpForm.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/8/24.
//

import SwiftUI
import Combine

// Asynchronous Programming with SwiftUI and Combine-Apress (2023), 8장

private class SignUpFormViewModel: ObservableObject {

    // MARK: Input
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var passwordConfirmation: String = ""

    // MARK: Output
    @Published var usernameMessage: String = ""
    @Published var passwordMessage: String = ""
    @Published var isValid: Bool = false

    // MARK: Username validattion
    private lazy var isUsernameLengthValidPublisher: AnyPublisher<Bool, Never>  = {
        $username
            .map { $0.count >= 3 }
            .eraseToAnyPublisher()
    }()

    // MARK: Password validation
    private lazy var isPasswordEmptyPublisher: AnyPublisher<Bool, Never> = {
        $password
            .map(\.isEmpty)
        // equivalent to
        // .map { $0.isEmpty }
            .eraseToAnyPublisher()
    }()

    private lazy var isPasswordMatchingPublisher: AnyPublisher<Bool, Never> = {
        Publishers.CombineLatest($password, $passwordConfirmation)
            .map(==)
        // equivalent to
        // .map { $0 == $1 }
            .eraseToAnyPublisher()
    }()

    private lazy var isPasswordValidPublisher: AnyPublisher<Bool, Never> = {
        Publishers.CombineLatest(isPasswordEmptyPublisher, isPasswordMatchingPublisher)
            .map { !$0 && $1 }
            .eraseToAnyPublisher()
    }()

    // MARK: Form validation
    private lazy var isFormValidPublisher: AnyPublisher<Bool, Never> = {
        Publishers.CombineLatest(isUsernameLengthValidPublisher, isPasswordValidPublisher)
            .map { $0 && $1 }
            .eraseToAnyPublisher()
    }()

    init() {
        isFormValidPublisher
            .assign(to: &$isValid)

        isUsernameLengthValidPublisher
            .map { $0 ? "" : "Username too short. Needs to be at least 3 characters." }
            .assign(to: &$usernameMessage)

        Publishers.CombineLatest(isPasswordEmptyPublisher, isPasswordMatchingPublisher)
            .map { isPasswordEmpty, isPasswordMatching in
                if isPasswordEmpty {
                    return "Password must not be empty"
                }
                else if !isPasswordMatching {
                    return "Passwords do not match"
                }
                return ""
            }
            .assign(to: &$passwordMessage)
    }
}

// MARK: - View
struct SignUpForm: View {
    @StateObject private var model = SignUpFormViewModel()

    var body: some View {
        Form {
            Section {
                TextField("Username", text: $model.username)
                    .disableAutocorrection(true)
                    .textFieldStyle(.roundedBorder)
            } footer: {
                Text(model.usernameMessage)
                    .foregroundColor(.red)
            }

            Section {
                SecureField("Password", text: $model.password)
                    .textFieldStyle(.roundedBorder)
                SecureField("Repeat password", text: $model.passwordConfirmation)
                    .textFieldStyle(.roundedBorder)
            } footer: {
                Text(model.passwordMessage)
                    .foregroundColor(.red)
            }

            Section {
                Button("Sign up") {
                    print("Signing up as \(model.username)")
                }
                .disabled(!model.isValid)
            }
        }
        .formStyle(.grouped)
    }
}

#Preview {
    SignUpForm()
}
