//
//  Color+hex.swift
//  
//
//  Created by Patrick Hackh on 15.11.22.
//

import XCTest
import SwiftUI
import SwiftAdditions

@available(macOS 13, iOS 16, *)
final class Color_hex: XCTestCase {

    func testHex() throws {
		XCTAssertEqual(Color(hex: "0xFFFFFF"), Color.white)
		XCTAssertEqual(Color(hex: "FFFFFF"), Color.white)
		XCTAssertEqual(Color(hex: "000000"), Color.black)
		XCTAssertEqual(Color(hex: "0xFF0000"), Color(red: 1.0, green: 0.0, blue: 0.0))
		XCTAssertEqual(Color(hex: "0x00FF00"), Color(red: 0.0, green: 1.0, blue: 0.0))
		XCTAssertEqual(Color(hex: "0x0000FF"), Color(red: 0.0, green: 0.0, blue: 1.0))
    }
}
