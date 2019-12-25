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
    
    func testURLAGAIN() {
        let urlString = "http://sandipbgt.com/theastrologer/api/horoscope/gemini/today/"
        var horoscope = Horoscope(sunsign: "w", credit: "w", date: "w", horoscope: "w", meta: Meta(mood: "w", keywords: "w", intensity: "w"))
        let exp = XCTestExpectation(description: "Succesfully decoded object")
        
        GenericCoderAPI.manager.getJSON(objectType: Horoscope.self, with: urlString) { (result) in
            switch result {
            case .failure(let error):
                XCTFail("\(error)")
            case .success(let horoscopeFromAPI):
                horoscope = horoscopeFromAPI
                exp.fulfill()
                
            }
        }
        
        wait(for: [exp], timeout: 5)
    }
    
    func testDateFormatter() {
        let dateformat = DateFormatter()
        dateformat.dateFormat = "LLdd"
        let number = Int(dateformat.string(from: UserDefaultsWrapper.helper.getBirthDate()!)) ?? -1
        print(dateformat.string(from: UserDefaultsWrapper.helper.getBirthDate()!))
    }

}
