//
//  ModalDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/30/24.
//

import SwiftUI

// https://developer.apple.com/design/human-interface-guidelines/modality
// https://developer.apple.com/documentation/swiftui/modal-presentations

struct ModalDemo: View {

    var body: some View {
        Form {
            SheetDemo()
            SheetItemDemo()
            PopoverDemo()
            PopoverItemDemo()
            AlertDemo()
            ConfirmationDialogDemo()
        }
        .formStyle(.grouped)
    }

    struct SheetDemo: View {
        @State private var isPresented = false

        var body: some View {
            Button("Show Sheet") {
                isPresented.toggle()
            }
            .sheet(isPresented: $isPresented, onDismiss: dismiss) {
                VStack {
                    Text("License Agreement")
                        .font(.title)
                        .padding(50)
                    Text("Terms and conditions go here.")
                        .padding(20)
                    Button("OK") {
                        isPresented.toggle()
                    }
                    .padding(30)
                }
                .presentationDetents([.medium, .large])
            }
        }

        func dismiss() {
        }
    }

    struct SheetItemDemo: View {
        struct InventoryItem: Identifiable {
            var id: String
            let partNumber: String
            let quantity: Int
            let name: String
        }

        @State private var sheetDetail: InventoryItem?

        var body: some View {
            Button("Show Sheet Item") {
                sheetDetail = InventoryItem(
                    id: "0123456789",
                    partNumber: "Z-1234A",
                    quantity: 100,
                    name: "Widget"
                )
            }
            .sheet(item: $sheetDetail, onDismiss: dismiss) { detail in
                VStack(alignment: .leading, spacing: 30) {
                    Text("Part Number: \(detail.partNumber)")
                    Text("Name: \(detail.name)")
                    Text("Quantity On-Hand: \(detail.quantity)")
                    Button("OK") {
                        sheetDetail = nil
                    }
                }
                .padding(30)
            }
        }

        func dismiss() {
        }
    }

    struct PopoverDemo: View {
        @State private var isPresented = false

        var body: some View {
            Button("Show Popover") {
                isPresented = true
            }
            .popover(isPresented: $isPresented) {
                Text("Popover Content")
                    .padding()
            }
        }
    }

    struct PopoverItemDemo: View {
        struct PopoverModel: Identifiable {
            var id: String { message }
            let message: String
        }

        @State private var popover: PopoverModel?

        var body: some View {
            Button("Show Popover Item") {
                popover = PopoverModel(message: "Popover Item")
            }
            .popover(item: $popover) { detail in
                Text("\(detail.message)")
                    .padding()
            }
        }
    }

    struct AlertDemo: View {
        struct AlertError: LocalizedError {
            var errorDescription: String? { "errorDescription" }
            var failureReason: String?  { "failureReason" }
            var helpAnchor: String?  { "helpAnchor" }
            var recoverySuggestion: String?  { "recoverySuggestion" }
        }

        @State private var error = AlertError()
        @State private var showAlert = false

        var body: some View {
            Button("Show Alert") {
                showAlert = true
            }
            .alert(isPresented: $showAlert, error: error) {
                Button("OK") {
                }
            }
        }
    }

    struct ConfirmationDialogDemo: View {
        @State private var isPresented = false

        var body: some View {
            Button("Show ConfirmationDialog") {
                isPresented = true
            }
            .confirmationDialog(
                "Permanently erase the items in the trash?",
                isPresented: $isPresented
            ) {
                Button("Empty Trash", role: .destructive) {
                }
            }
        }
    }



}

#Preview {
    ModalDemo()
}
