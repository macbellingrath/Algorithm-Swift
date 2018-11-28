//: [Previous](@previous)

import Foundation
func ~= (l: String, r: String) -> Bool {
    let p1 = l
    let p2 = r
    
    var i = p1.startIndex
    var j = p2.startIndex
    
    while i < p1.endIndex && j < p2.endIndex {
        if p1[i] == "/" {
            p1.formIndex(after: &i)
        } else if p2[j] == "/" {
            p2.formIndex(after: &j)
        } else if p1[i] != p2[j] {
            return false
        } else {
            p1.formIndex(after: &i)
            p2.formIndex(after: &j)
        }
    }
    
    while i < p1.endIndex {
        if p1[i] == "/" {
            p1.formIndex(after: &i)
        } else {
            return false
        }
    }
    
    while j < p2.endIndex {
        if p2[j] == "/" {
            p2.formIndex(after: &j)
        } else {
            return false
        }
    }
    
    return true
}
"//" ~= "///"
"//" ~= "//"
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
    
    var other: String? {
        let res = split(separator: "/").joined(separator: "/")
        if res.isEmpty { return nil }
        return res
    }
    
    /// Gets you the adPath (which is the identifier without it's leading and trailing slash "/" suffix)
    var adPath: String? {
        // let result = identifier.trimmingCharacters(in: CharacterSet(charactersIn: "/"))
        
        var result = self
        let slash = "/"
        
        if result.hasPrefix(slash) {
            result = String(result[slash.endIndex...])
        }
        
        if result.hasSuffix(slash) {
            result = String(result[result.startIndex..<result.index(result.endIndex, offsetBy: -slash.count)])
        }
        
        guard !result.isEmpty else {
            return nil
        }
        
        return result
    }
    
    func adKey() -> String {
        if hasPrefix("/") {
            return String(self["/".endIndex..<endIndex])
        }
        return self
    }
    
    var trimmed: String {
        let i = last == "/" ? index(startIndex, offsetBy: 1) : startIndex
        let j = first == "/" ? index(endIndex, offsetBy: -1): endIndex
        return String(self[i..<j])
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
func trimmed() {
    "/test".trimmed
    "/test/".trimmed
    "test/".trimmed
}
func other() {
    "/test".adKey()
    "/test/".adKey()
    "test/".adKey()
}

func test(_ str: String) -> Bool  {
    return str.adPath_usingCharSet == str.adPath_idx
}


for example in ["/test",
                "/test/",
                "",
                "test/",
                "/a/",
                "/test/two",
                "test/two/",
                "some/test",
                "/on/two/",
                "±oneTwo/test"] {
            print(example.trimmed)
}

compare(left: testOne, right: testTwo)
compare(left: testOne, right: trimmed)
compare(left: testTwo, right: testOne)

//compare(left: testOne,
//        right: testTwo)
compare(left: testOne, right: other)
compare(left: testTwo, right: other)



//: [Next](@next)


// Test cases
"/±/".trimmingCharacters(in: CharacterSet(charactersIn: "/")) ==  "/±".trimmingCharacters(in: CharacterSet(charactersIn: "/"))
"±/±".trimmingCharacters(in: CharacterSet(charactersIn: "/"))
public extension String {
    
    /// Provides a copy of the current string with a trailing slash, if one does not already exist.
    public var withTrailingSlash: String {
        return hasSuffix("/") ? self : appending("/")
    }
    
}

public struct SectionPathCompare {
    
    /// Two section paths compare equal regardless of leading and trailing slashes.
    ///
    /// - Parameters:
    ///   - l: a path
    ///   - r: a path
    /// - Returns: true if the substrings from each first non-`/` index to each strings last non-`/` index is equal
    public static func equal(_ l: String, _ r: String) -> Bool {
        return l.withTrailingSlash == r.withTrailingSlash
    }
    
    private static let chars = CharacterSet(charactersIn: "/")
}

SectionPathCompare.equal("/±/", "/±")
SectionPathCompare.equal("/", "")
