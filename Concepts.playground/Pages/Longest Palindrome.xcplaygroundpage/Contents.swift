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

        for i in 0..<_s.count {
            let len1 = expandAroundCenter(_s, l: i, r: i)

            let len2 = expandAroundCenter(_s, l: i, r: i + 1)

            let len = max(len1, len2)
            if len > (end - start) {
                start = i - (len - 1) / 2
                end = i + len / 2
            }
        }

        return String(_s[start...end])
    }

    private func expandAroundCenter(_ s: [Character], l: Int, r: Int) -> Int {

        var left = l
        var right = r


        while (left >= 0 && right < s.count) && s[left] == s[right] {
            left  -= 1
            right += 1
        }


        return right - left - 1
    }
}

let s = Solution()
s.longestPalindrome("racecar")

//: [Next](@next)
