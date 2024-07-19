//
//  File.swift
//  
//
//  Created by William von Arend on 18/07/2024.
//

import Foundation
import CoreData

public let container: NSPersistentContainer = NSPersistentContainer(name: containerName)
private let containerName: String = "Model"
//
//let modelName = "Model"
//public let container: NSPersistentContainer = {
//        
//    let frameworkBundle = Bundle.module
//            let modelURL = frameworkBundle.url(forResource: "Model", withExtension: "xcdatamodel")!
//            let managedObjectModel =  NSManagedObjectModel(contentsOf: modelURL)
//            
//            let container = NSPersistentContainer(name: modelName, managedObjectModel: managedObjectModel!)
//            container.loadPersistentStores { storeDescription, error in
//                
//                if let error = error {
//                    fatalError("Unable to load persistent stores: \(error)")
//                }
//            }
//            
//            return container
//        }()
