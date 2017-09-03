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
        let s = s as NSString

        var start = 0, end = 0

        for i in 0..<s.length {

            let len1 = expandAroundCenters(s, left: i, right: i)
            let len2 = expandAroundCenters(s, left: i, right: i + 1)
            let len = max(len1, len2)

            if len > end - start {
                start = i - (len - 1) / 2
                end = i + len / 2
            }
        }

        return s.substring(with: NSRange(location: start, length: end + 1))
    }

    private func expandAroundCenters(_ s: NSString, left: Int, right: Int) -> Int {
        var l = left, r = right

        while (l >= 0 && r < s.length && s.character(at: l) == s.character(at: r)) {
            l -= 1
            r += 1
        }

        return r - l - 1
    }
}

let s = Solution()
s.longestPalindrome("babad")

//: [Next](@next)
