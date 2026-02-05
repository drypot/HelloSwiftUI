//
//  AppDelegate.swift
//  HelloSwiftUI
//
//  Created by Kyuhyun Park on 11/18/24.
//

import Foundation
import AppKit

// https://developer.apple.com/documentation/appkit/nsapplicationdelegate
// https://developer.apple.com/documentation/swiftui/nsapplicationdelegateadaptor

class AppDelegate: NSObject, NSApplicationDelegate, ObservableObject {

    func applicationWillFinishLaunching(_ notification: Notification) {
//        print("applicationWillFinishLaunching")
//#if DEV
//        print("Compiler flag DEV defined")
//#else
//        print("Compiler flag DEV not defined")
//#endif
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
//        print("applicationDidFinishLaunching")
    }

    func applicationWillTerminate(_ aNotification: Notification) {
//        print("applicationWillTerminate")
    }

//    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
//        return true
//    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }

}
