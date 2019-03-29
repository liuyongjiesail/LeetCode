/*
 * @lc app=leetcode id=7 lang=swift
 *
 * [7] Reverse Integer
 *
 * https://leetcode.com/problems/reverse-integer/description/
 *
 * algorithms
 * Easy (25.08%)
 * Total Accepted:    642.1K
 * Total Submissions: 2.5M
 * Testcase Example:  '123'
 *
 * Given a 32-bit signed integer, reverse digits of an integer.
 * 
 * Example 1:
 * 
 * 
 * Input: 123
 * Output: 321
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: -123
 * Output: -321
 * 
 * 
 * Example 3:
 * 
 * 
 * Input: 120
 * Output: 21
 * 
 * 
 * Note:
 * Assume we are dealing with an environment which could only store integers
 * within the 32-bit signed integer range: [−2^31,  2^31 − 1]. For the purpose
 * of this problem, assume that your function returns 0 when the reversed
 * integer overflows.
 * 
 */

/*

倒序处理就行了，有3种情况需处理

1. 判断后面是不是全是0
2. 判断第一位是不是负号
3. 判断结果有没有溢出，溢出则返回0

✔ Accepted
  ✔ 1032/1032 cases passed (16 ms)
  ✔ Your runtime beats 34.5 % of swift submissions
  ✔ Your memory usage beats 5.88 % of swift submissions (19.4 MB)

*/

class Solution {
    func reverse(_ x: Int) -> Int {

        let numStr = "\(x)"
        var intArray = Array(numStr)
        var resultArray = Array<Character>()
        
        for i in intArray.reversed() {
            if i != "-" {
                if i != "0" || resultArray.count > 0 {
                    resultArray.append(i)
                }
            }
        }
        
        if intArray[0] == "-" {
            resultArray.insert("-", at: 0)
        }

        if resultArray.count == 0 {
            return 0
        }
        
        let result = Int(String(resultArray[0..<resultArray.count]))!

        if result > 2147483647 || result < -2147483648 {
            return 0
        }

        return result
    }
}

