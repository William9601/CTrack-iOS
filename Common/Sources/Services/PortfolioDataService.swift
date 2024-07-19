//
//  PortfolioDataService.swift
//
//
//  Created by William von Arend on 09/07/2024.
//

import CoreData
import Models

public class PortfolioDataService {
    private let entityName: String = "PortfolioEntity"
    
    @Published public var savedEntities: [PortfolioEntity] = []
    
    public init() {
        container.loadPersistentStores{ (_, error) in
            if let error = error {
                print("Error loading Core Data! \(error)")
            }
            self.getPortfolio()
        }
    }
    
    // MARK: PUBLIC
    
    public func updatePortfolio(coin: CoinModel, amount: Double) {
        if let entity = savedEntities.first(where: { (savedEntity) -> Bool in // Check if coin is already in portfolio
            return savedEntity.coinID == coin.id
        }) {
            if amount > 0 {
                update(entity: entity, amount: amount)
            } else {
                delete(entity: entity)
            }
        } else {
            add(coin: coin, amount: amount)
        }
    }
    
    // MARK: PRIVATE
    
    private func getPortfolio() {
        let request = NSFetchRequest<PortfolioEntity>(entityName: entityName)
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching Portfolio Entities.  \(error)")
        }
    }
    
    private func add(coin: CoinModel, amount: Double) {
        let entity = PortfolioEntity(context: container.viewContext)
        entity.coinID = coin.id
        applyChanges()
    }
    
    private func update(entity: PortfolioEntity, amount: Double) { // If we already have an entity we can update it
        entity.amount = amount
        applyChanges()
    }
    
    private func delete(entity: PortfolioEntity) {
        container.viewContext.delete(entity)
        applyChanges()
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving to Core Data")
        }
    }
    
    private func applyChanges() { // update the savedEntities array to publish the changes to the rest of the app
        save()
        getPortfolio()
    }
}
