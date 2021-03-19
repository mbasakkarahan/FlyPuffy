//
//  AppDelegate.swift
//  Fly Puffy
//
//  Created by Derin on 17.01.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var notificationAllowControl:Bool = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
        let preferredLanguage = NSLocale.preferredLanguages[0]
        print(preferredLanguage)
        if preferredLanguage.contains("en") {
            
            let icerik = UNMutableNotificationContent()
            icerik.title = "Mojo jojo and Him coming to town!"
            icerik.body = "We need you to keep Townsville safe. You can come back to the game and make the city safer."
            icerik.badge = 1
            icerik.sound = UNNotificationSound.default
            
            let tetikleme = UNTimeIntervalNotificationTrigger(timeInterval: 20, repeats: false) // TODO SÜRE ARTTIRILACAK
            let bildirimİstegi = UNNotificationRequest(identifier: "Fly Puffy", content: icerik, trigger: tetikleme)
            
            UNUserNotificationCenter.current().add(bildirimİstegi, withCompletionHandler: nil)
        } else{
            let icerik = UNMutableNotificationContent()
            icerik.title = "Mojo jojo ve Him şehire geliyor!"
            icerik.body = "Townsville'in güvenli olması için sana ihtiyacımız var. Oyuna tekrar gelerek şehri daha güvenli hale getirebilirsin."
            icerik.badge = 1
            icerik.sound = UNNotificationSound.default
            
            let tetikleme = UNTimeIntervalNotificationTrigger(timeInterval: 20, repeats: false) // TODO SÜRE ARTTIRILACAK
            let bildirimİstegi = UNNotificationRequest(identifier: "Fly Puffy", content: icerik, trigger: tetikleme)
            
            UNUserNotificationCenter.current().add(bildirimİstegi, withCompletionHandler: nil)
        }
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        application.applicationIconBadgeNumber = 0
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {
            (granted,error) in
            self.notificationAllowControl = granted
            if self.notificationAllowControl{
                print("İzin alma işlemi başarılı")
            }else{
                print("İzin alınamadı")
            }
        })
    }
  

}

