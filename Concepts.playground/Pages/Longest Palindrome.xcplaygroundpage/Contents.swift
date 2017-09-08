//: [Previous](@previous)

import Foundation
/*
 public String longestPalindrome(String s) {
 int start = 0, end = 0;
 for (int i = 0; i < s.length(); i++) {
 int len1 = expandAroundCenter(s, i, i);
 int len2 = expandAroundCenter(s, i, i + 1);
 int len = Math.max(len1, len2);
 if (len > end - start) {
 start = i - (len - 1) / 2;
 end = i + len / 2;
 }
 }
 return s.substring(start, end + 1);
 }

 private int expandAroundCenter(String s, int left, int right) {
 int L = left, R = right;
 while (L >= 0 && R < s.length() && s.charAt(L) == s.charAt(R)) {
 L--;
 R++;
 }
 return R - L - 1;
 }
 */

class Solution {
    func longestPalindrome(_ s: String) -> String {
        var start = 0, end = 0
        let _s = Array(s.characters)

        var start = s.startIndex, end = s.startIndex

        for i in s.characters.indices {
            let len1 = expandAroundCenter(s, l: i, r: i)
            let len2 = expandAroundCenter(s, l: i, r: s.index(after: i))

            let len = max(len1, len2)
            let distance = s.distance(from: end, to: start)

            if len > distance {
                start = s.index(i, offsetBy: -(len - 1) / 2)
                end = s.index(i, offsetBy: len / 2)
            }
        }

        return s[start...end]
    }

    private func expandAroundCenter(_ s: String, l: String.CharacterView.Index, r: String.CharacterView.Index) -> String.IndexDistance {
        var left = l
        var right = r

        while l >= s.startIndex && r < s.endIndex && s[left] == s[right] {
            left  = s.index(before: left)
            right = s.index(after: right)
        }

        return s.distance(from: right, to: left)
    }


}

let s = Solution()
s.longestPalindrome("babad")

//: [Next](@next)
