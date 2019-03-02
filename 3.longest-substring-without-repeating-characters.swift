/*
 * @lc app=leetcode id=3 lang=swift
 *
 * [3] Longest Substring Without Repeating Characters
 *
 * https://leetcode.com/problems/longest-substring-without-repeating-characters/description/
 *
 * algorithms
 * Medium (26.11%)
 * Total Accepted:    760.4K
 * Total Submissions: 2.9M
 * Testcase Example:  '"abcabcbb"'
 *
 * Given a string, find the length of the longest substring without repeating
 * characters.
 * 
 * 
 * Example 1:
 * 
 * 
 * Input: "abcabcbb"
 * Output: 3 
 * Explanation: The answer is "abc", with the length of 3. 
 * 
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: "bbbbb"
 * Output: 1
 * Explanation: The answer is "b", with the length of 1.
 * 
 * 
 * 
 * Example 3:
 * 
 * 
 * Input: "pwwkew"
 * Output: 3
 * Explanation: The answer is "wke", with the length of 3. 
 * ⁠            Note that the answer must be a substring, "pwke" is a
 * subsequence and not a substring.
 * 
 * 
 * 
 * 
 * 
 */

 /*

 100ms

 解法思路：
 1. 初始化空的字符串 tempString，和长度为0的longest
 2. 遍历目标字符串，tempString拼接每个字符，判断tempString的长度是否大于longest，大于则把该长度赋值给longest
 3. 拼接之前判断tempString中是否包含目前遍历到的字符，如果包含，找到该字符在tempString的位置，截取tempString后的字符串作赋值为tempString

 */
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {

        var tempString = ""
        var longest = 0
        
        for char in s.characters {
            if tempString.contains(char) {
                var sameIndex = tempString.index(of: char);
                sameIndex = tempString.index(sameIndex!, offsetBy: 1);
                tempString = String(tempString.suffix(from: sameIndex!));
            }
            tempString = tempString + String(char);
            if tempString.count > longest {
                longest = tempString.count;
            }
        }
        return longest;
    }
}
