//
//  UserDefaultsTests.swift
//  UserDefaultsTests
//
//  Created by Cameron Rivera on 1/13/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import XCTest
@testable import UserDefaults

class UserDefaultsTests: XCTestCase {

    func testGetHoroscope(){
        // Arrange
        let endpointURL = "http://sandipbgt.com/theastrologer/api/horoscope/aries/today"
        let expectedSunsign = "Aries"
        let exp = expectation(description: "Get a sunsign of Aries")
        
        // Act
        HoroscopeAPI.getHoroscope(from: endpointURL) { result in
            switch result{
            case .failure(let netError):
                XCTFail("\(netError)")
            case .success(let horror):
                exp.fulfill()
                // Assert
                XCTAssertEqual(horror.sunsign, expectedSunsign, "\(horror.sunsign) is not equal to \(expectedSunsign)")
            }
        }
        wait(for: [exp], timeout: 3.0)
    }
}
