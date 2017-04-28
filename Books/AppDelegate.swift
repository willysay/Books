//
//  AppDelegate.swift
//  Books
//
//  Created by SDS-018 on 2017. 4. 27..
//  Copyright © 2017년 SDS-018. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var login: String? = nil
    var books:[Book] = [Book]()
    let fileName = "books"

    
    func saveBooks() {
        let bData: Data = NSKeyedArchiver.archivedData(withRootObject: books)
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
                let path = dir.appendingPathComponent(fileName)
                print(path)
            do{
                try bData.write(to: path)
            }
            catch{}
        }
    }

    
    func loadBooks() {

        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let path = dir.appendingPathComponent(fileName)
            
            do{
                let bData = try Data(contentsOf: path)
                books = NSKeyedUnarchiver.unarchiveObject(with: bData) as! Array<Book>
            }
            catch{}
        }
    }
    
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        loadBooks()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        saveBooks()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        saveBooks()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        saveBooks()
    }


}

