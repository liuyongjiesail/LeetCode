/*
 * @lc app=leetcode id=9 lang=swift
 *
 * [9] Palindrome Number
 *
 * https://leetcode.com/problems/palindrome-number/description/
 *
 * algorithms
 * Easy (41.63%)
 * Total Accepted:    539.8K
 * Total Submissions: 1.3M
 * Testcase Example:  '121'
 *
 * Determine whether an integer is a palindrome. An integer is a palindrome
 * when it reads the same backward as forward.
 * 
 * Example 1:
 * 
 * 
 * Input: 121
 * Output: true
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: -121
 * Output: false
 * Explanation: From left to right, it reads -121. From right to left, it
 * becomes 121-. Therefore it is not a palindrome.
 * 
 * 
 * Example 3:
 * 
 * 
 * Input: 10
 * Output: false
 * Explanation: Reads 01 from right to left. Therefore it is not a
 * palindrome.
 * 
 * 
 * Follow up:
 * 
 * Coud you solve it without converting the integer to a string?
 * 
 */

 /*

  思路：

  判断是否是回文数字
  1. 如果是负数，直接返回false
  2. 把数字反转，反转后的数字等于原数字返回true，否则返回false
  
 ✔ Accepted
  ✔ 11509/11509 cases passed (48 ms)
  ✔ Your runtime beats 95.95 % of swift submissions
  ✔ Your memory usage beats 76.19 % of swift submissions (18.8 MB)
 */
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        
        if x < 0 {
            return false
        }
        
        var reverse = 0
        var mx = x
        
        while mx != 0 {
            let pop = mx % 10
            mx /= 10
            if reverse > Int32.max {
                return false
            }
            reverse = reverse * 10 + pop
        }
        
        return x == reverse ? true : false
        
    }
}

