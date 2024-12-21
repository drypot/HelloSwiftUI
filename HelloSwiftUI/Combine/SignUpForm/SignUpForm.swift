//
//  SignUpForm.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/8/24.
//  Created by Peter Friese on 27.12.21.
//

import SwiftUI
import Combine

// Asynchronous Programming with SwiftUI and Combine-Apress (2023), 8, 9, 10,

// MARK: - View
struct SignUpForm: View {
    @StateObject private var viewModel = SignUpFormViewModel()

    var body: some View {
        Form {
            Section {
                TextField("Username", text: $viewModel.username)
                    .disableAutocorrection(true)
                    .textFieldStyle(.roundedBorder)
            } footer: {
                Text(viewModel.usernameMessage)
                    .foregroundColor(.red)
            }

            Section {
                Button("Sign up") {
                    print("Signing up as \(viewModel.username)")
                }
                .disabled(!viewModel.isValid)
            }
        }
        .formStyle(.grouped)
        // show update dialog
        .alert("Please update", isPresented: $viewModel.showUpdateDialog, actions: {
            Button("Upgrade") {
                // open App Store listing page for the app
            }
            Button("Not now", role: .cancel) { }
        }, message: {
            Text("It looks like you're using an older version of this app. Please update your app.")
        })
    }
}

#Preview {
    SignUpForm()
}
