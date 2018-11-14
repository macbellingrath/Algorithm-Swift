//: [Previous](@previous)

import Foundation

extension String {
    var adPath_usingCharSet: String? {
        let result = self.trimmingCharacters(in: CharacterSet(charactersIn: "/"))
        
        guard !result.isEmpty else {
            return nil
        }
        
        return result
    }
    
    var adPath_idx: String? {
        var result = self
        
        if result.hasPrefix("/") {
            var start = result.startIndex
            result.formIndex(after: &start)
            result = String(result[start...])
        }
        
        if result.hasSuffix("/") {
            var end = result.endIndex
            result.formIndex(before: &end)
            result = String(result[..<end])
        }
        
        guard !result.isEmpty else {
            return nil
        }
        
        return result
    }
}


func testOne() {
    "/test".adPath_usingCharSet
    "/test/".adPath_usingCharSet
    "test/".adPath_usingCharSet
}

func testTwo () {
    "/test".adPath_idx
    "/test/".adPath_idx
    "test/".adPath_idx
}


compare(left: testOne,
        right: testTwo)

//: [Next](@next)
