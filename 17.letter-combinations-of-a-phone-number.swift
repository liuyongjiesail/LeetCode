/*
 * @lc app=leetcode id=17 lang=swift
 *
 * [17] Letter Combinations of a Phone Number
 *
 * https://leetcode.com/problems/letter-combinations-of-a-phone-number/description/
 *
 * algorithms
 * Medium (40.85%)
 * Total Accepted:    372.1K
 * Total Submissions: 905.4K
 * Testcase Example:  '"23"'
 *
 * Given a string containing digits from 2-9 inclusive, return all possible
 * letter combinations that the number could represent.
 * 
 * A mapping of digit to letters (just like on the telephone buttons) is given
 * below. Note that 1 does not map to any letters.
 * 
 * 
 * 
 * Example:
 * 
 * 
 * Input: "23"
 * Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 * 
 * 
 * Note:
 * 
 * Although the above answer is in lexicographical order, your answer could be
 * in any order you want.
 * 
 */

 /*

  思路

✔ Accepted
  ✔ 25/25 cases passed (8 ms)
  ✔ Your runtime beats 100 % of swift submissions
  ✔ Your memory usage beats 10 % of swift submissions (20.2 MB)

 */
class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        
        if digits.count == 0 {
            return []
        }
        
        var result = [""]
        let phoneLetter = ["", "", "abc", "edf", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
        
        for (_, char) in digits.enumerated() {
            var tempArray = Array<String>()
            let string = phoneLetter[Int(String(char))!]
            for (_ , letterChar) in string.enumerated() {
                for (_, resultChar) in result.enumerated() {
                    tempArray.append(String(resultChar) + String(letterChar))
                }
            }
            result = tempArray
        }
        
        return result
    }
}

