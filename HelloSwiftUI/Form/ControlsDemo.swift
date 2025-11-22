//
//  ControlsDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/25/24.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/form
// A container for grouping controls used for data entry, such as in settings or inspectors.

struct ControlsDemo: View {

    enum PickerItems {
        case large
        case medium
        case small
    }

    var body: some View {
        ScrollView {
            VStack {
                TabView {
                    Tab {
                        SampleForm()
                            .formStyle(.grouped)
                    } label: {
                        Text("Grouped")
                    }
                    Tab {
                        SampleForm()
                            .formStyle(CustomFormStyle())
                        Spacer()
                    } label: {
                        Text("Custom")
                    }
                    Tab {
                        SampleForm()
                            .padding()
                        Spacer()
                    } label: {
                        Text("Default")
                    }
                }
            }
            .padding()
        }
    }

    struct SampleForm: View {

        @State var textField = ""
        @State var toggle = true
        @State var picker = PickerItems.large
        @State var slider1: Double = 6
        @State var slider2: Double = 0.5
        @State var datePicker = Date()

        var body: some View {
            Form {
                TextField(text: $textField) {
                    Text("TextField")
                }
                .onSubmit {
                    print("TextField: \(textField)")
                }

                TextField(text: $textField, prompt: Text("Prompt")) {
                    Text("TextField")
                }
                .textFieldStyle(.roundedBorder)

                LabeledContent("Label") {
                    Text("Contents")
                }

                LabeledContent(
                    "Label",
                    value: Measurement<UnitLength>(value: 171, unit: .centimeters),
                    format: .measurement(width: .abbreviated, usage: .personHeight)
                )

                Button("Button") {
                    print("Button clicked")
                }

                Button() {
                    print("Button clicked")
                } label: {
                    Text("Button")
                }

                Button("Button", role: .destructive) {
                    print("Button clicked")
                }

                do {
                    let title = "Open Safari"
                    let url = URL(string: "https://www.apple.com/safari/")!
                    Link(title, destination: url)
                        .onHover { inside in
                            if inside {
                                NSCursor.pointingHand.push()
                            } else {
                                NSCursor.pop()
                            }
                        }
                }
                Button("Open Safari") {
                    guard let url = URL(string: "https://www.apple.com/safari/") else { return }
                    NSWorkspace.shared.open(url)
                }

                Toggle("Toggle", isOn: $toggle)

                Picker("Picker", selection: $picker) {
                    Text("Large").tag(PickerItems.large)
                    Text("Medium").tag(PickerItems.medium)
                    Text("Small").tag(PickerItems.small)
                }

                Picker("Picker", selection: $picker) {
                    Text("Large").tag(PickerItems.large)
                    Text("Medium").tag(PickerItems.medium)
                    Text("Small").tag(PickerItems.small)
                }
                .pickerStyle(.inline)

                Picker("Picker", selection: $picker) {
                    Text("Large").tag(PickerItems.large)
                    Text("Medium").tag(PickerItems.medium)
                    Text("Small").tag(PickerItems.small)
                }
                .pickerStyle(.segmented)

                Slider(value: $slider1, in: 1...10, step: 1.0) {
                    Text("Slider1")
                } minimumValueLabel: {
                    Text("1")
                } maximumValueLabel: {
                    Text("10")
                } onEditingChanged: { isEditing in
                    print("\(slider1), \(isEditing)")
                }

                Slider(value: $slider2, in: 0...1) {
                    Text("Slider2")
                } minimumValueLabel: {
                    Text("Slow")
                } maximumValueLabel: {
                    Text("Fast")
                } onEditingChanged: { isEditing in
                    print("\(slider2), \(isEditing)")
                }

                Text("Selected Date: \(datePicker, style: .date)")

                DatePicker("DatePicker", selection: $datePicker)
                    .datePickerStyle(.stepperField)

                DatePicker("DatePicker", selection: $datePicker, displayedComponents: .date)
                    .datePickerStyle(.stepperField)

                DatePicker("DatePicker", selection: $datePicker, displayedComponents: .hourAndMinute)
                    .datePickerStyle(.stepperField)
            }
        }
    }

    struct CustomFormStyle: FormStyle {
        func makeBody(configuration: Configuration) -> some View {
            VStack(alignment: .leading, spacing: 4) {
                configuration.content
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.quinary)
                    )
                    .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
            }
            .padding()
        }
    }
    
}

#Preview {
    ControlsDemo()
}
