//
//  HomeViewModelTests.swift
//  
//
//  Created by William von Arend on 16/07/2024.
//

import XCTest
import Models
@testable import Scenes

// Naming Structure: test_[struct or class]_[variable or function]_[expected result]

final class HomeViewModelTests: XCTestCase {
    
    private var sut: HomeViewModel!
    private var marketDataServiceMock: MarketDataServiceMock!
    
    override func setUp() {
        marketDataServiceMock = .init()
        sut = HomeViewModel(marketDataService: marketDataServiceMock)
    }
    
    func test_HomeViewModel_statistics_shouldBeEmpty() {
        XCTAssertTrue(sut.statistics.isEmpty)
    }

    // MARK: Function Tests
    
    // MARK: filterCoins
    func test_HomeViewModel_filterCoins_returnsAllCoinsWhenTextIsEmpty() {
        // Given
        let coins = HomeViewModelMock.mockCoins
        
        // When
        let searchText = ""
        let filteredCoins = sut.filterCoins(text: searchText, coins: coins)
        
        // Then
        XCTAssertEqual(filteredCoins.count, coins.count)
    }
    
    func test_HomeViewModel_filterCoins_returnsSearchTextWithMatchingName() {
        let coins = HomeViewModelMock.mockCoins

        let searchText = "Bitc"
        let filteredCoins = sut.filterCoins(text: searchText, coins: coins)
        
        XCTAssertEqual(filteredCoins.count, 1)
        XCTAssertEqual(filteredCoins.first?.name, "Bitcoin")
    }
    
    func test_HomeViewModel_filterCoins_returnsEmptyArrayWhenNoMatchFound() {
        let coins = HomeViewModelMock.mockCoins

        let searchText = "RandomWord"
        let filteredCoins = sut.filterCoins(text: searchText, coins: coins)
        
        XCTAssertTrue(filteredCoins.count == 0)
    }
    
    // MARK: mapGlobalMarketData
    func test_HomeViewModel_mapGlobalMarketData_statisticsArrayIsEmptyWhenMarketDataModelIsNil() {
        marketDataServiceMock.marketData.value = nil
        XCTAssertTrue(sut.statistics.isEmpty, "Expected the result to be an empty array when marketDataModel is nil")
    }
    
    func test_HomeViewModel_mapGlobalMarketData_statisticsArrayContainsMarkedData() {
        let marketDataModel = HomeViewModelMock.stats
        marketDataServiceMock.marketData.value = marketDataModel
        
        XCTAssertEqual(sut.statistics.count, 4)
//        XCTAssertEqual(result[0], StatisticsModel(title: "Market Cap", value: "43945962.151456155", percentageChange: 0.5446264306552537), "Expected statistics model to match \(result)")
    }

}
