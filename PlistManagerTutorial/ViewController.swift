//
//  ViewController.swift
//  PlistManagerTutorial
//
//  Created by Tula Ram Subba on 4/28/17.
//  Copyright © 2017 Tula Ram Subba. All rights reserved.
//

import UIKit
import SwiftyPlistManager

class ViewController: UIViewController {

    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         let dataPlistName = "Data"
         let otherDataPlistName = "OtherData"
         let nonExistentPlistName = "NonExistent"
         let newKey = "newKey"
         let firstKey = "firstKey"
         let secondKey = "secondKey"
         let thirdKey = "thirdKey"
         let fourthKey = "fourthKey"
         let nonExistentKey = "nonExistentKey"
         
         let helloNewValue = "Hello New Value"
         let rebeloperValue = "Rebeloper"
         let intValue = 17
         let boolValue = true
         let anotherIntValue = 28
         let stringValue = "Alex"
         var dict = ["name": "John", "age": 34] as [String : Any]
        
        SwiftyPlistManager.shared.start(plistNames: [dataPlistName], logging: true)
        SwiftyPlistManager.shared.start(plistNames: [dataPlistName, otherDataPlistName, nonExistentPlistName], logging: true)
        SwiftyPlistManager.shared.getValue(for: newKey, fromPlistWithName: dataPlistName) { (result, err) in
            if err == nil {
            print("-------------------> The Value for Key '\(newKey)' actually exists in the '\(dataPlistName).plist' file. It is: '\(result ?? "No Value Fetched")'")
            }
        }
        SwiftyPlistManager.shared.save(helloNewValue, forKey: newKey, toPlistWithName: dataPlistName) { (err) in
            if err == nil {
            print("------------------->  Value '\(helloNewValue)' successfully saved at Key '\(newKey)' into '\(dataPlistName).plist'")
            }
        }
        SwiftyPlistManager.shared.getValue(for: newKey, fromPlistWithName: dataPlistName) { (result, err) in
            if err == nil {
            print("-------------> The Value for Key '\(newKey)' actually exists. It is: '\(result!)'")
            }
        }
        SwiftyPlistManager.shared.getValue(for: newKey, fromPlistWithName: dataPlistName) { (result, err) in
            if err == nil {
            print("-------------> The Value for Key '\(newKey)' actually exists. It is: '\(result ?? "No Value")'")
            }
        }
        SwiftyPlistManager.shared.getValue(for: newKey, fromPlistWithName: dataPlistName) { (result, err) in
            if err == nil {
            guard let result = result else {
            print("-------------> The Value for Key '\(newKey)' does not exists.")
            return
            }
            print("-------------> The Value for Key '\(newKey)' actually exists. It is: '\(result)'")
            }
        }
        SwiftyPlistManager.shared.getValue(for: newKey, fromPlistWithName: dataPlistName) { (result, err) in
            if err == nil {
            
            if let result = result {
            print("-------------> The Value for Key '\(newKey)' actually exists. It is: '\(result)'")
            } else {
            print("-------------> The Value for Key '\(newKey)' does not exists.")
            }
            
            print("-------------> This line will be printed out regardless if the Value for Key '\(newKey)' exists or not.")
            
            }
        }
        guard let fetchedValue = SwiftyPlistManager.shared.fetchValue(for: newKey, fromPlistWithName: dataPlistName) else { return }
        print("-------------> The Fetched Value for Key '\(newKey)' actually exists. It is: '\(fetchedValue)'")
        
        guard let nonExistentValue = SwiftyPlistManager.shared.fetchValue(for: nonExistentKey, fromPlistWithName: dataPlistName) else {
            print("-------------> The Value does not exist so going to return now!")
            return
        }
        print("-------------> This line will never be executed because the Key is: '\(nonExistentKey)' so the Value is '\(nonExistentValue)'")
        
        SwiftyPlistManager.shared.addNew(rebeloperValue, key: firstKey, toPlistWithName: dataPlistName) { (err) in
            if err == nil {
            print("-------------> Value '\(rebeloperValue)' successfully added at Key '\(firstKey)' into '\(dataPlistName).plist'")
            }
        }
        SwiftyPlistManager.shared.addNew(intValue, key: secondKey, toPlistWithName: dataPlistName) { (err) in
            if err == nil {
            print("-------------> Value '\(intValue)' successfully added at Key '\(secondKey)' into '\(dataPlistName).plist'")
            }
        }
        
         SwiftyPlistManager.shared.addNew(boolValue, key: thirdKey, toPlistWithName: dataPlistName) { (err) in
         if err == nil {
         print("-------------> Value '\(boolValue)' successfully added at Key '\(thirdKey)' into '\(dataPlistName).plist'")
            }
         }
        
        SwiftyPlistManager.shared.save(anotherIntValue, forKey: secondKey, toPlistWithName: dataPlistName) { (err) in
            if err == nil {
            print("-------------> Value '\(anotherIntValue)' successfully saved at Key '\(secondKey)' into '\(dataPlistName).plist'")
            }
        }
        
         SwiftyPlistManager.shared.save(stringValue, forKey: thirdKey, toPlistWithName: dataPlistName) { (err) in
         if err == nil {
         print("-------------> Value '\(stringValue)' successfully saved at Key '\(thirdKey)' into '\(dataPlistName).plist'")
           }
         }
        
         SwiftyPlistManager.shared.save(boolValue, forKey: thirdKey, toPlistWithName: dataPlistName) { (err) in
         if err == nil {
         print("-------------> Value '\(boolValue)' successfully saved at Key '\(thirdKey)' into '\(dataPlistName).plist'")
         }
        }
        
         SwiftyPlistManager.shared.addNew(dict, key: fourthKey, toPlistWithName: dataPlistName) { (err) in
         if err == nil {
         print("-------------> Value '\(dict)' successfully saved at Key '\(fourthKey)' into '\(dataPlistName).plist'")
           }
         }

         dict["age"] = 56
         SwiftyPlistManager.shared.save(dict, forKey: fourthKey, toPlistWithName: dataPlistName) { (err) in
         if err == nil {
         print("-------------> Value '\(dict)' successfully saved at Key '\(fourthKey)' into '\(dataPlistName).plist'")
           }
         }
        
         SwiftyPlistManager.shared.removeValueKeyPair(for: thirdKey, fromPlistWithName: dataPlistName) { (err) in
         if err == nil {
         print("-------------> Key-Value pair successfully removed at Key '\(thirdKey)' from '\(dataPlistName).plist'")
           }
         }
        
         SwiftyPlistManager.shared.removeAllKeyValuePairs(fromPlistWithName: dataPlistName) { (err) in
         if err == nil {
         print("-------------> Successfully removed all Key-Value pairs from '\(dataPlistName).plist'")
           }
         }
        
         func logSwiftyPlistManager(_ error: SwiftyPlistManagerError?) {
         guard let err = error else {
         return
         }
         print("-------------> SwiftyPlistManager error: '\(err)'")
         }

         SwiftyPlistManager.shared.addNew(helloNewValue, key: newKey, toPlistWithName: nonExistentPlistName) { (err) in
         if err != nil {
         logSwiftyPlistManager(err)
           }
         }
        
         SwiftyPlistManager.shared.removeAllKeyValuePairs(fromPlistWithName: dataPlistName) { (err) in
         if err != nil {
         logSwiftyPlistManager(err)
           }
         }
        
         SwiftyPlistManager.shared.addNew(rebeloperValue, key: firstKey, toPlistWithName: dataPlistName) { (err) in
         if err != nil {
         logSwiftyPlistManager(err)
         } else {
         print("-------------> Value '\(rebeloperValue)' successfully added at Key '\(firstKey)' into '\(dataPlistName).plist'")
           }
         }
         
         SwiftyPlistManager.shared.addNew(rebeloperValue, key: firstKey, toPlistWithName: dataPlistName) { (err) in
         if err != nil {
         logSwiftyPlistManager(err)
           }
         }
        
         SwiftyPlistManager.shared.getValue(for: nonExistentKey, fromPlistWithName: dataPlistName) { (result, err) in
         if err != nil {
         logSwiftyPlistManager(err)
         }
         }
        }
   }

