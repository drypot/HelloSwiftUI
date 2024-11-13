//
//  ListDemo.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 10/17/24.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/lists
// List displays a one-dimensional vertical collection of views.

// ForEach 는 루프 하나로 끝나지만,
// List 안에는 ForEach 여러 개를 넣을 수도 있고 비 루프 콤포넌트도 넣을 수 있어서 서로 다르다.

struct ListDemo: View {

    let demoList = [
        "List Simple",
        "List Styles",
        "List with Loop",
        "List with Selection",
        "List Multidimensional",
        "List Hierarchical",
    ]

    @State var currentDemo = "List Simple"

    var body: some View {
        HStack {
            List(demoList, id:\.self, selection: $currentDemo) { demo in
                Text(demo)
            }
            .frame(maxWidth: 250)

            switch currentDemo {
            case "List Simple": ListSimple()
            case "List Styles": ListStyles()
            case "List with Loop": ListWithLoop()
            case "List with Selection": ListWithSelection()
            case "List Multidimensional": ListMultidimensional()
            case "List Hierarchical": ListHierarchical()
            default: Text("Invalid Selection")
            }
        }
    }

}

#Preview {
    ListDemo()
}

