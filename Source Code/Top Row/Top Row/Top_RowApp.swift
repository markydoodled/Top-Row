//
//  Top_RowApp.swift
//  Top Row
//
//  Created by Mark Howard on 11/04/2024.
//

import SwiftUI

@main
struct Top_RowApp: App {
    @AppStorage("barText") public var barText = "Click Me..."
    var body: some Scene {
        MenuBarExtra("\(barText)") {
            ContentView()
        }
        .menuBarExtraStyle(.window)
    }
}
