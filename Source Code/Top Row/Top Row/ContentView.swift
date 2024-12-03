//
//  ContentView.swift
//  Top Row
//
//  Created by Mark Howard on 11/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State var messageText = ""
    @Environment(\.openWindow) var openWindow
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
            Text("Version - \(Bundle.main.releaseVersionNumber ?? "")")
                .foregroundStyle(.secondary)
            Text("Build - \(Bundle.main.buildVersionNumber ?? "")")
                .foregroundStyle(.secondary)
            Text("© 2024 Mark Howard")
                .foregroundStyle(.secondary)
            Spacer()
            HStack {
                Link("Portfolio", destination: URL(string: "https://markydoodled.com/")!)
                    .buttonStyle(.bordered)
                Link("GitHub Repo", destination: URL(string: "https://github.com/markydoodled/Top-Row")!)
                    .buttonStyle(.bordered)
            }
            Spacer()
            HStack {
                Button("Tip Jar") {
                    openWindow(id: "tip-jar")
                }
                Button("Feedback") {
                    SendEmail.send()
                }
                Button("Quit") {
                    NSApplication.shared.terminate(self)
                }
                .buttonStyle(.borderedProminent)
            }
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

extension Bundle {
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
}

class SendEmail: NSObject {
    static func send() {
        let service = NSSharingService(named: NSSharingService.Name.composeEmail)!
        service.recipients = ["markhoward@markydoodled.com"]
        service.subject = "Top Row Feedback"
        service.perform(withItems: ["Please Fill Out All Relevant Sections:", "Report A Bug - ", "Rate The App - ", "Suggest An Improvement - "])
    }
}

#Preview {
    ContentView()
}
