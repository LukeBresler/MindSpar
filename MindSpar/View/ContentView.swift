//
//  ContentView.swift
//  MindSpar
//
//  Created by Luke Bresler on 2021/05/06.
//  Copyright © 2021 Luke Bresler. All rights reserved.
//
import UserNotificationsUI
import SwiftUI

struct NotificationsSettingsView: View {
    var body: some View {
        
    
    VStack {
        Button("Request Permission") {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                if success {
                    print("All set!")
                } else if let error = error {
                    print(error.localizedDescription)
                }
            }        }

        Button("Schedule Notification") {
            let content = UNMutableNotificationContent()
            content.title = "Feed the cat"
            content.subtitle = "It looks hungry"
            content.sound = UNNotificationSound.default

            // show this notification five seconds from now
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

            // choose a random identifier
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

            // add our notification request
            UNUserNotificationCenter.current().add(request)
        }
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro")
            .environment(\.colorScheme, .light)
    }
}
