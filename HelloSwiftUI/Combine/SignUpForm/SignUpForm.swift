//
//  SignUpForm.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/8/24.
//  Created by Peter Friese on 27.12.21.
//

import SwiftUI
import Combine

// Asynchronous Programming with SwiftUI and Combine-Apress (2023), 8장

// MARK: - View
struct SignUpForm: View {
    @StateObject private var viewModel = SignUpFormViewModel()

    var body: some View {
        Form {
            Section {
                TextField("Username", text: $viewModel.username)
                    .disableAutocorrection(true)
                    .textFieldStyle(.roundedBorder)

                // Check if username is availabel using closure.
                // This can later be removed, it's just here for demonstation purposes.
                Button("Check if username is available") {
                    viewModel.isUsernameAvailable(username: viewModel.username)
                }
            } footer: {
                Text(viewModel.usernameMessage)
                    .foregroundColor(.red)
            }

            Section {
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(.roundedBorder)
                SecureField("Repeat password", text: $viewModel.passwordConfirmation)
                    .textFieldStyle(.roundedBorder)
            } footer: {
                VStack(alignment: .leading) {
                    ProgressView(value: viewModel.passwordStrengthValue, total: 1)
                        .tint(viewModel.passwordStrengthColor)
                        .progressViewStyle(.linear)
                    Text(viewModel.passwordMessage)
                        .foregroundColor(.red)
                }
            }

            Section {
                Button("Sign up") {
                    print("Signing up as \(viewModel.username)")
                }
                .disabled(!viewModel.isValid)
            }
        }
        .formStyle(.grouped)
    }
}

#Preview {
    SignUpForm()
}
