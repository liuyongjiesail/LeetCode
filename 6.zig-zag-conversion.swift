/*
 * @lc app=leetcode id=6 lang=swift
 *
 * [6] ZigZag Conversion
 *
 * https://leetcode.com/problems/zigzag-conversion/description/
 *
 * algorithms
 * Medium (30.42%)
 * Total Accepted:    297.9K
 * Total Submissions: 958.9K
 * Testcase Example:  '"PAYPALISHIRING"\n3'
 *
 * The string "PAYPALISHIRING" is written in a zigzag pattern on a given number
 * of rows like this: (you may want to display this pattern in a fixed font for
 * better legibility)
 * 
 * 
 * P   A   H   N
 * A P L S I I G
 * Y   I   R
 * 
 * 
 * And then read line by line: "PAHNAPLSIIGYIR"
 * 
 * Write the code that will take a string and make this conversion given a
 * number of rows:
 * 
 * 
 * string convert(string s, int numRows);
 * 
 * Example 1:
 * 
 * 
 * Input: s = "PAYPALISHIRING", numRows = 3
 * Output: "PAHNAPLSIIGYIR"
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: s = "PAYPALISHIRING", numRows = 4
 * Output: "PINALSIGYAHRPI"
 * Explanation:
 * 
 * P     I    N
 * A   L S  I G
 * Y A   H R
 * P     I
 * 
 */

 /*

 思路

 1. 创建一个字典来保存遍历过的值，存储策略是 numRows 个字典， key为 0 ~ numRows - 1 ，value 为存储字符的数组
 2. 得到字典以后，从0 ~ numRows 遍历，把数组拼起来就是结果字符数组

 ✔ Accepted
  ✔ 1158/1158 cases passed (200 ms)
  ✔ Your runtime beats 37.5 % of swift submissions
  ✔ Your memory usage beats 5.26 % of swift submissions (20.2 MB)

 */
class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        
        var charArray = Array(s)
        var dictionary = Dictionary<Int, Array<Character>>()
        var resultCharArray = Array<Character>()
        
        for i in 0..<numRows {
            let array = Array<Character>()
            dictionary[i] = array
        }
        
        var temp = 0
        var tempBool = false
        
        for i in 0..<charArray.count {
            
            dictionary[temp]?.append(charArray[i])
            
            if temp >= numRows - 1 {
                tempBool = true
            }
            
            if tempBool {
                temp = temp - 1
            } else {
                temp = temp + 1
            }
            
            if temp <= 0 {
                temp = 0
                tempBool = false
            }
            
        }
                
        for i in 0..<numRows {
            resultCharArray = resultCharArray + dictionary[i]!
        }
                
        return String(resultCharArray[0..<resultCharArray.count])
        
    }
}

