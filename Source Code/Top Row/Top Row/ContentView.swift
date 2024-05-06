//
//  ContentView.swift
//  Top Row
//
//  Created by Mark Howard on 11/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State var messageText = ""
    var body: some View {
        VStack {
            Spacer()
            Text("Top Row")
                .bold()
                .font(.largeTitle)
                .padding(.bottom)
            Text("Show Text In The Menu Bar")
                .font(.title3)
            Spacer()
            TextField("Message", text: $messageText, prompt: Text("Enter Your Message Here..."))
            Spacer()
            Text("Version - 1.1")
                .foregroundStyle(.secondary)
            Text("Build - 1")
                .foregroundStyle(.secondary)
            Text("© 2024 Mark Howard")
                .foregroundStyle(.secondary)
            Spacer()
            Button(action: {NSApplication.shared.terminate(self)}) {
                Text("Quit")
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding()
        .onChange(of: messageText) {
            if messageText == "" {
                Top_RowApp().barText = "Click Me..."
            } else {
                Top_RowApp().barText = messageText
            }
        }
    }
}

#Preview {
    ContentView()
}
