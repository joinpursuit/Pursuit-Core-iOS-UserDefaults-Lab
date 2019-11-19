//
//  userDefaultslabTests.swift
//  userDefaultslabTests
//
//  Created by Ahad Islam on 11/19/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import XCTest
@testable import userDefaultslab

class userDefaultslabTests: XCTestCase {

    func testURL() {
        let urlString = "http://sandipbgt.com/theastrologer/api/horoscope/gemini/today"
        guard let url = URL(string: urlString) else {
            print("Bad url")
            return
        }
        guard let data = try? Data(contentsOf: url) else {
            print("Data doesn't work.")
            return
        }
        print(data)
        XCTAssert(data != nil, "Data should exist")
    }

}
