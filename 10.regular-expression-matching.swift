/*
 * @lc app=leetcode id=10 lang=swift
 *
 * [10] Regular Expression Matching
 *
 * https://leetcode.com/problems/regular-expression-matching/description/
 *
 * algorithms
 * Hard (24.88%)
 * Total Accepted:    287.3K
 * Total Submissions: 1.1M
 * Testcase Example:  '"aa"\n"a"'
 *
 * Given an input string (s) and a pattern (p), implement regular expression
 * matching with support for '.' and '*'.
 * 
 * 
 * '.' Matches any single character.
 * '*' Matches zero or more of the preceding element.
 * 
 * 
 * The matching should cover the entire input string (not partial).
 * 
 * Note:
 * 
 * 
 * s could be empty and contains only lowercase letters a-z.
 * p could be empty and contains only lowercase letters a-z, and characters
 * like . or *.
 * 
 * 
 * Example 1:
 * 
 * 
 * Input:
 * s = "aa"
 * p = "a"
 * Output: false
 * Explanation: "a" does not match the entire string "aa".
 * 
 * 
 * Example 2:
 * 
 * 
 * Input:
 * s = "aa"
 * p = "a*"
 * Output: true
 * Explanation: '*' means zero or more of the precedeng element, 'a'.
 * Therefore, by repeating 'a' once, it becomes "aa".
 * 
 * 
 * Example 3:
 * 
 * 
 * Input:
 * s = "ab"
 * p = ".*"
 * Output: true
 * Explanation: ".*" means "zero or more (*) of any character (.)".
 * 
 * 
 * Example 4:
 * 
 * 
 * Input:
 * s = "aab"
 * p = "c*a*b"
 * Output: true
 * Explanation: c can be repeated 0 times, a can be repeated 1 time. Therefore
 * it matches "aab".
 * 
 * 
 * Example 5:
 * 
 * 
 * Input:
 * s = "mississippi"
 * p = "mis*is*p*."
 * Output: false
 * 
 * 
 */

/*

递归方式实现

✔ Accepted
  ✔ 447/447 cases passed (4108 ms)
  ✔ Your runtime beats 9.37 % of swift submissions
  ✔ Your memory usage beats 16.67 % of swift submissions (19.8 MB)

*/

class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        
        var patternArray = Array(p)
        var stringArray = Array(s)
        
        let patternCount = patternArray.count
        let stringCount = stringArray.count
        
        if patternCount == 0 {
            return stringCount == 0
        }

        let firstMatch = (stringCount != 0 && (patternArray[0] == stringArray[0] || patternArray[0] == "."));

        if patternArray.count >= 2 && patternArray[1] == "*" {
            return (isMatch(s, String(patternArray[2..<patternCount])) || (firstMatch && isMatch(String(stringArray[1..<stringCount]), p)))
        } else {
            return firstMatch && isMatch(String(stringArray[1..<stringCount]), String(patternArray[1..<patternCount]))
        }
    }
}

