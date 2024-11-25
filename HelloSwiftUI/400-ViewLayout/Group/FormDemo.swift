//
//  FormDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/25/24.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/form
// A container for grouping controls used for data entry, such as in settings or inspectors.

struct FormDemo: View {

    enum NotifyMeAboutType {
        case directMessages
        case mentions
        case anything
    }

    enum ProfileImageSize {
        case large
        case medium
        case small
    }

    var body: some View {
        VStack {
            TabView {
                Tab {
                    SampleForm()
                        .padding()
                    Spacer()
                } label: {
                    Text("Default")
                }
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
            }
        }
        .padding()
    }

    struct SampleForm: View {

        @State var notifyMeAbout = NotifyMeAboutType.directMessages
        @State var playNotificationSounds = true
        @State var sendReadReceipts = false
        @State var profileImageSize = ProfileImageSize.large

        var body: some View {
            Form {
                Picker("Notify Me About:", selection: $notifyMeAbout) {
                    Text("Direct Messages").tag(NotifyMeAboutType.directMessages)
                    Text("Mentions").tag(NotifyMeAboutType.mentions)
                    Text("Anything").tag(NotifyMeAboutType.anything)
                }
                Toggle("Play notification sounds", isOn: $playNotificationSounds)
                Toggle("Send read receipts", isOn: $sendReadReceipts)


                Picker("Profile Image Size:", selection: $profileImageSize) {
                    Text("Large").tag(ProfileImageSize.large)
                    Text("Medium").tag(ProfileImageSize.medium)
                    Text("Small").tag(ProfileImageSize.small)
                }
                .pickerStyle(.inline)

                LabeledContent("Some Label") {
                    Text("Some Contents")
                }

                LabeledContent(
                    "Size",
                    value: Measurement<UnitLength>(value: 171, unit: .centimeters),
                    format: .measurement(width: .abbreviated, usage: .personHeight)
                )

                Button("Clear Image Cache") {}

            }
        }
    }

    struct CustomFormStyle: FormStyle {
        func makeBody(configuration: Configuration) -> some View {
            VStack(alignment: .leading, spacing: 4) {
                configuration.content
                    .padding()
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
    FormDemo()
}
