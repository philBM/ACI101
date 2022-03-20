//
//  MinutesTests.swift
//  MinutesTests
//
//  Created by BiomedicalMac on 17/03/2022.
//  Copyright © 2022 Microsoft. All rights reserved.
//

import XCTest
@testable import Minutes

class MinutesTests: XCTestCase {

    var entryUnderTest: Entry!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        entryUnderTest = Entry("Title", "Content")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        entryUnderTest = nil
        super.tearDown()
    }

    func testSerialization() {
            let serializedData = FileEntryStore.serialize(entryUnderTest)
            let entry = FileEntryStore.deserialize(serializedData!)
            
            XCTAssertEqual(entry?.title, "Title", "Title does not match")
            XCTAssertEqual(entry?.content, "Content", "Content does not match")
        }

}
