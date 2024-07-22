//
//  File.swift
//  
//
//  Created by William von Arend on 18/07/2024.
//

import Foundation
import CoreData

//private let containerName: String = "PortfolioContainer"
//public let container: NSPersistentContainer = NSPersistentContainer(name: containerName)


// Ensure this matches the name of your .xcdatamodeld file
let modelName = "PortfolioContainer"

public let container: NSPersistentContainer = {
    
    // Access the module bundle where the .xcdatamodeld file is located
    let frameworkBundle = Bundle.module
    
    // Ensure the modelURL points to your .xcdatamodeld file
    guard let modelURL = frameworkBundle.url(forResource: modelName, withExtension: "momd") else {
        fatalError("Unable to find \(modelName) in the bundle")
    }
    
    // Load the model from the model URL
    guard let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
        fatalError("Unable to load model from \(modelURL)")
    }
    
    // Initialize the container with the model name and managed object model
    let container = NSPersistentContainer(name: modelName, managedObjectModel: managedObjectModel)
    
    // Load the persistent stores. I do this in the PortfolioDataService
//    container.loadPersistentStores { storeDescription, error in
//        if let error = error {
//            fatalError("Unable to load persistent stores: \(error)")
//        }
//    }
    
    return container
}()
