//
//  _ModelData.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 12/1/24.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/model-data

// 애플 문서에서는 Data Model 의 인스턴스를 Model data 라고 부르고 있다.
// Model data 파트는 데이터 모델링이 아닌 모델 인스턴스를 관리하는 방법을 설명하고 있다고 보면 되겠다.

// Property Wrappers
// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties/#Property-Wrappers

// Managing user interface state
// https://developer.apple.com/documentation/swiftui/managing-user-interface-state


// State
// https://developer.apple.com/documentation/swiftui/state

// Use state as the single source of truth.
// Create a state value in an App, Scene, or View by applying the @State attribute to a property.
// Declare state as private to prevent setting it in a memberwise initializer.

// @State property 는 persistent storage 로 사용하면 안 된다.
// 뷰의 라이프 사이클이 끝나면 @State 도 날아간다.
// UI 파트에만 영향을 미치는 임시적인 데이터에만 사용한다.

// 서브 뷰에서 read-only 로 사용하려면 서브 뷰에 일반 Swift properties 를 만들어 넣어주고,
// 서브 뷰에서 read-write 가능하게 하려면 서브 뷰에 @Bingding 을 만들어 넣어준다,

// Observable
// https://developer.apple.com/documentation/observation

// A Swift-specific implementation of the observer design pattern.

// Observable() 매크로로 만든 클래스 오브젝트는 @StateObject 가 아니라 @State 로 관리한다.
// 서브 뷰에 read-only 로 넘길 때는 일반 property 를 쓴다.
// 서브 뷰에 read-write 로 넘길 때도 일반 property 를 쓴다.
// 단, 서브 뷰에서 바인딩을 만들어야 하면 @Bindable property 를 쓴다.
// 단, 서브 뷰에서 프로퍼티가 아니라 State 에 담긴 오브젝트 자체를 nil 로 날려야 할 때는 @Binding 을 붙인다.

// ObservableObject
// https://developer.apple.com/documentation/combine/observableobject

// ObservableObject synthesizes an objectWillChange publisher
// that emits the changed value before any of its @Published properties changes.

// ObservableObject 오브젝트는 @State 가 아니라 @StateObject 로 관리한다.
// 서브 뷰에 read-only 로 넘길 때도 @ObservedObject 프로퍼티를 만들어야 한다.
// 서브 뷰에 read-write 로 넘길 때도 @ObservedObject 프로퍼티를 만들어야 한다.

// Managing model data in your app
// https://developer.apple.com/documentation/swiftui/managing-model-data-in-your-app

// SwiftUI 는 Observable() 매크로로 만든 클래스의 오브젝트가 사용될 때 디펜던시를 만든다.
// 오브젝트 프로퍼티가 변경되면 뷰를 업데이트한다.

// SwiftUI 가 관리하지 않는 Observable 오브젝트의 경우에도 디펜던시가 동작한다.
// 예로 글로벌 Observable 오브젝트를 사용했을 때 이 글로벌 오브젝트가 변경되면 뷰가 업데이트된다.

// Observation 은 computed properties 들도 트래킹한다.

// Observation tracks changes that appears in the execution scope of a view’s body property.

// 요컨데 Model data 만들려면
// @Observable class 만들고, View 나 App 등에서 @State 잡아서 쓰면 무난하다.

/*

@Observable class Book: Identifiable {
    var title = "Sample Book Title"
    var author = Author()
    var isAvailable = true
}

@Observable class Library {
    var books: [Book] = [Book(), Book(), Book()]

    var availableBooksCount: Int {
        books.filter(\.isAvailable).count
    }
}

struct BookView: View {
    @State private var book = Book()

    var body: some View {
        Text(book.title)
    }
}

@main
struct BookReaderApp: App {
    @State private var library = Library()

    var body: some Scene {
        WindowGroup {
            LibraryView()
                .environment(library)
        }
    }
}

*/

// Share model data throughout a view hierarchy

// https://developer.apple.com/documentation/swiftui/view/environment(_:)

// To share model data throughout a view hierarchy, use environment(_:).

// Migrating from the Observable Object protocol to the Observable macro
// https://developer.apple.com/documentation/swiftui/migrating-from-the-observable-object-protocol-to-the-observable-macro

// Observation,
// a Swift-specific implementation of the observer design pattern,
// Tracking optionals and collections of objects 가 가능,


