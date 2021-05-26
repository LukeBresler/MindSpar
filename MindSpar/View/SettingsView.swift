//
//  SettingsView.swift
//  MindSpar
//
//  Created by Luke Bresler on 2020/06/08.
//  Copyright © 2021 Luke Bresler. All rights reserved.
//
import Foundation
import SwiftUI
import Combine

//Storing Daily notifications toggle:
class toggleSettings: ObservableObject {
    @Published var toggleState: Bool {
        didSet {
            UserDefaults.standard.set(toggleState, forKey: "toggleState")
        }
    }
    
    init() {
        self.toggleState = UserDefaults.standard.object(forKey: "toggleState") as? Bool ?? true
        
    }
}

struct SettingsView: View {
  // MARK: - PROPERTIES
    let urlWebsite = URL(string: "http://crabcards.realpixel.co.za")!
    var shareLink: String = ""
   
    @StateObject var userSettings = toggleSettings()
    
    @State private var isEditing = false
    @State var arr = cardsData
    @State private var showingAlert = false
    @State private var notificationsSet = 0.0
    
    @State private var showDisclaimer: Bool = false
    @State private var showAcknowledgements: Bool = false
  @State private var readMore: Bool = false
  @State private var notificationSettings: Bool = false
  @State private var showShareSheet = false
  @State private var showAppInfo: Bool = false
  @State private var showSendFeedback: Bool = false
  @State private var pushNotificationsToggle = false
    
  @Environment(\.colorScheme) var colorScheme
  
  
  var body: some View {
   
    VStack(alignment: .center, spacing: 0) {
      // MARK: - HEADER
      VStack(alignment: .center, spacing: 10) {
        
        Image("S")
        //Image(colorScheme == .dark ? "dmembrace errors" : "embrace errors")
          .resizable()
          .scaledToFit()
          .padding(.top)
          .frame(width: 125, height: 125, alignment: .center)
            .foregroundColor(Color("customControlColor"))
            //.opacity(0.75)
         
        
        Text("Settings + About".uppercased())
            //.font(.system(.title, design: .serif))
            .font(.headline)
          .fontWeight(.bold)
            .foregroundColor(Color("customControlColor"))
      }
      .padding()
      
      Form {
        
        // MARK: - SECTION #1 ABOUT
        Section(header: Text("About the MindSpar app")){
            if readMore {
            HStack{
                Text("""
The tools that got us here may have lost their usefulness.

MindSpar is an app aimed at training your mind to replace some of our negative responses with more useful ones.
""")
            }
            HStack{
                Toggle(isOn: $readMore.animation()) {
                             Text("Read Less")
                                .fontWeight(.light)
                           }
                .toggleStyle(CheckboxStyle())
                
                
            }
            } else {
                HStack{
                    Text("The tools that got us here may have lost their usefulness...")
                }
                HStack{
                    Toggle(isOn: $readMore.animation()) {
                        Text("Read More")
                            .fontWeight(.light)
                    }
                    .toggleStyle(CheckboxStyle())
                }
        }
        }
        
        
        
        // MARK: - SECTION #2 GENERAL
        Section(header: Text("General")) {
          
//          Toggle(isOn: $backgroundRefresh) {
//            Text("Background refresh")
//          }
            
            HStack{
            Button(action: {
                self.showShareSheet = true
            }) {

                Text("Share App")
                    .bold()
                .buttonStyle(DefaultButtonStyle())
                    .foregroundColor(Color("customControlColor"))
                }
            }
           
            
            HStack{
            Text("Rate App")

                Spacer()
                
                Button(action: {AppStoreReviewManager.requestReviewIfAppropriate()}){
                    Image(systemName: "Rate")
                    
                    .buttonStyle(DefaultButtonStyle())
                    
                }
                Image(systemName: "star.fill")
                    
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.lefthalf.fill")
                
            }
           

                    .sheet(isPresented: self.$showShareSheet){
                        Text("\nThank you for the support! 🤗")
                        ShareSheet(activityItems:[NSURL(string: "https://apple.com")!])}
        
            
            HStack{
                Text("Daily Notifications:")
                
                if #available(iOS 14.0, *) {
                    Toggle("", isOn: $pushNotificationsToggle.animation())

                        .onChange(of: pushNotificationsToggle){ value in
                            action: do {
                                UIApplication.shared.unregisterForRemoteNotifications()
                                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                                UNUserNotificationCenter.current().removeAllDeliveredNotifications()
                                 notificationsSet = 0
                                
                            }
                            //(isOn: $userSettings.toggleState)
                            
                        }
                } else {
                    // Fallback on earlier versions
                }
                
                 
                    if pushNotificationsToggle {
                             Text("ON")
                                .fontWeight(.light)
                                .padding(.leading)
                                
                        
                    } else {
 
                        Text("OFF")
                            .fontWeight(.light)
                            .padding(.leading)
                    }

            }
            
         
            
            if pushNotificationsToggle == true {
           
            HStack{
                let title = arr.randomElement()
                VStack (alignment: .center, spacing: 5){
                    Button("Schedule Daily Notification Now")   {
                        let content = UNMutableNotificationContent()
                        content.title = "\(title!.title)"
                        content.subtitle = "Destroy the thought, now!"
                        content.sound = UNNotificationSound.default

                        // show this notification 60 seconds from now
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 86400, repeats: true)

                        // choose a random identifier
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                        // add our notification request
                        UNUserNotificationCenter.current().add(request)
                        showingAlert = true
                         notificationsSet += 1
                    }
                    .foregroundColor(.red)
                    .padding(10)
                    
                    .alert(isPresented: $showingAlert) {
                                Alert(title: Text("A Daily Notification has been set!"), message: Text("You can set multiple notifications.\n Notifications set:  \(Int(notificationsSet)) \n\n You can disable this at any time."), dismissButton: .default(Text("Got it!")))
                            }
                }
                .padding(5)

            }
           
            } 
          
        }
        
        // MARK: - SECTION #3 APP INFO
        Section(header: Text("App Info")) {
          if showAppInfo {
            HStack {
              Text("Product").foregroundColor(Color.gray)
              Spacer()
              Text("Mind Spar")
            }
            HStack {
              Text("Compatibility").foregroundColor(Color.gray)
              Spacer()
              Text("iPhone & iPad")
            }
            HStack {
              Text("Developer").foregroundColor(Color.gray)
              Spacer()
              Text("Luke Bresler")
            }
            HStack {
              Text("Framework").foregroundColor(Color.gray)
              Spacer()
              Text("SwiftUI")
            }
            HStack {
              Text("Website").foregroundColor(Color.gray)
              Spacer()
                Button(action: { UIApplication.shared.open(self.urlWebsite) }) {
                Text("mindspar.realpixel.co.za")
                }
            }
            HStack {
              Text("Email").foregroundColor(Color.gray)
              Spacer()
              Text("luke@realpixel.co.za")
            }
            HStack {
              Text("Version").foregroundColor(Color.gray)
              Spacer()
              Text("1.6.2")
            }
            HStack{
                Toggle(isOn: $showAppInfo.animation()) {
                             Text("Close Extended App Info")
                            .fontWeight(.light)
                                
                           }
                .toggleStyle(CheckboxStyle())
            }
          } else {
            HStack {
              Text("Version").foregroundColor(Color.gray)
              Spacer()
              Text("1.6.2")
            }
            HStack {
              Text("Developer").foregroundColor(Color.gray)
              Spacer()
              Text("Luke Bresler")
            }
            HStack{
                Toggle(isOn: $showAppInfo.animation()) {
                             Text("Show Extended App Info")
                                .fontWeight(.light)
                           }
                .toggleStyle(CheckboxStyle())
            }

          }
        }
      
    
    
    
    // MARK: - SECTION #4 ACKNOWLEDGEMENTS
    Section(header: Text("Acknowldgements")) {
      if showAcknowledgements {
        
        HStack {
          Text("Person 2")
          Spacer()
          Text("Psychology consultation")
            .foregroundColor(Color.gray)
        }

        HStack {
          Text("Person 3")
          Spacer()
          Text("Psychology consultation")
            .foregroundColor(Color.gray)
        }

        HStack {
          Text("Person 4")
          Spacer()
          Text("Psychology consultation")
            .foregroundColor(Color.gray)
        }
        HStack{
            Toggle(isOn: $showAcknowledgements.animation()) {
                         Text("Close Acknowledgements")
                        .fontWeight(.light)
                            
                       }
            .toggleStyle(CheckboxStyle())
        }
      } else {
        Toggle(isOn: $showAcknowledgements.animation()) {
            Text("Show Wonderful People")
                .fontWeight(.light)
        }
        .toggleStyle(CheckboxStyle())
      }
    }
        // MARK: - SECTION #5 DISCLAIMER
        Section(header: Text("Disclaimer")) {
          if showDisclaimer {
            HStack {
              Text("""
DISCLAIMER:

MindSpar is not intended to be a substitute for professional medical advice.

Always seek the guidance of your doctor or other qualified health professional with any questions you may have regarding your health or a medical condition.
""")
              
            }
        

         

            
            HStack{
                Toggle(isOn: $showDisclaimer.animation()) {
                             Text("Close Disclaimer")
                            .fontWeight(.light)
                                
                           }
                .toggleStyle(CheckboxStyle())
            }
          } else {
            Toggle(isOn: $showDisclaimer.animation()) {
                Text("View Disclaimer")
                    .fontWeight(.light)
            }
            .toggleStyle(CheckboxStyle())
          }
        }

        
        
      }
        
    }
    
    .background(colorScheme == .dark ? Color.black : Color.white)
    
    .frame(maxWidth: 640)
    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
  }
}

struct CheckboxStyle: ToggleStyle {
 
    func makeBody(configuration: Self.Configuration) -> some View {
 
        return HStack {
 
            configuration.label
 
            Spacer()
 
            Image(systemName: configuration.isOn ? "chevron.up.circle" : "chevron.down.circle")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(Color("customControlColor"))
                .font(.system(size: 20, weight: .light, design: .default))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
 
    }
}


struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
    //.environment(\.colorScheme, .light)
    .environment(\.colorScheme, .dark)
  }
}




//MARK: New File
struct ShareSheet: UIViewControllerRepresentable {
    typealias Callback = (_ activityType: UIActivity.ActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ error: Error?) -> Void
    
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil
    let excludedActivityTypes: [UIActivity.ActivityType]? = nil
    let callback: Callback? = nil
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: applicationActivities)
        controller.excludedActivityTypes = excludedActivityTypes
        controller.completionWithItemsHandler = callback
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // nothing to do here
    }
}

