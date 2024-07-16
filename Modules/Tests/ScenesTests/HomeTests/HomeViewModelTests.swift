//
//  HomeViewModelTests.swift
//  
//
//  Created by William von Arend on 16/07/2024.
//

import XCTest
@testable import Scenes

// Naming Structure: test_[struct or class]_[variable or function]_[expected result]

final class HomeViewModelTests: XCTestCase {
    
    func test_HomeViewModel_statistics_shouldBeEmpty() {
        let vm = HomeViewModel()
        XCTAssertTrue(vm.statistics.isEmpty)
    }

    // MARK: Function Tests
    
    // MARK: filterCoins
    func test_HomeViewModel_filterCoins_returnsAllCoinsWhenTextIsEmpty() {
        // Given
        let vm = HomeViewModel()
        let coins = HomeViewModelMock.mockCoins
        
        // When
        let searchText = ""
        let filteredCoins = vm.filterCoins(text: searchText, coins: coins)
        
        // Then
        XCTAssertEqual(filteredCoins.count, coins.count)
    }
    
    func test_HomeViewModel_filterCoins_returnsSearchTextWithMatchingName() {
        let vm = HomeViewModel()
        let coins = HomeViewModelMock.mockCoins

        let searchText = "Bitc"
        let filteredCoins = vm.filterCoins(text: searchText, coins: coins)
        
        XCTAssertEqual(filteredCoins.count, 1)
        XCTAssertEqual(filteredCoins.first?.name, "Bitcoin")
    }
    
    func test_HomeViewModel_filterCoins_returnsEmptyArrayWhenNoMatchFound() {
        let vm = HomeViewModel()
        let coins = HomeViewModelMock.mockCoins

        let searchText = "RandomWord"
        let filteredCoins = vm.filterCoins(text: searchText, coins: coins)
        
        XCTAssertTrue(filteredCoins.count == 0)
    }

}
