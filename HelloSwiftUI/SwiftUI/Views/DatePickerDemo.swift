//
//  DatePickerDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/23/24.
//

import SwiftUI

struct DatePickerDemo: View {

    @State private var selectedDate = Date()

    var body: some View {
        VStack {
            Spacer()

            Text(".graphical")
            DatePicker("", selection: $selectedDate)
                .datePickerStyle(.graphical) // macOS-specific style
            Spacer()

            Text(".graphical date only")
            DatePicker("", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(.graphical) // macOS-specific style
            Spacer()

            Text(".field")
            DatePicker("", selection: $selectedDate)
                .datePickerStyle(.field)
            Spacer()

            Text(".stepperField")
            DatePicker("", selection: $selectedDate)
                .datePickerStyle(.stepperField)
            Spacer()

            Text("Selected Date: \(selectedDate, style: .date)")
            Spacer()
        }
        .padding()
    }
}

#Preview {
    DatePickerDemo()
}
