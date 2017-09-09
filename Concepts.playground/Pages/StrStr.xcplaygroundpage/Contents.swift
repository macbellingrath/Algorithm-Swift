//: [Previous](@previous)

import Foundation

/*public int strStr(String haystack, String needle) {
    for (int i = 0; ; i++) {
        for (int j = 0; ; j++) {
            if (j == needle.length()) return i;
            if (i + j == haystack.length()) return -1;
            if (needle.charAt(j) != haystack.charAt(i + j)) break;
        }
    }
}*/

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let h = Array(haystack.characters)
        let n = Array(needle.characters)

        // swift range init doesn't form range with  lowerbound > upperbound
        if n.count > h.count { return -1 }

        for i in 0...h.count - n.count {
            if String(h[i..<i+n.count]) == needle { return i }
        }

        return -1
    }
}

let s = Solution()
s.strStr(" as", "s")
//: [Next](@next)
