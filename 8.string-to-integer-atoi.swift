/*
 * @lc app=leetcode id=8 lang=swift
 *
 * [8] String to Integer (atoi)
 *
 * https://leetcode.com/problems/string-to-integer-atoi/description/
 *
 * algorithms
 * Medium (14.45%)
 * Total Accepted:    341.3K
 * Total Submissions: 2.3M
 * Testcase Example:  '"42"'
 *
 * Implement atoi which converts a string to an integer.
 * 
 * The function first discards as many whitespace characters as necessary until
 * the first non-whitespace character is found. Then, starting from this
 * character, takes an optional initial plus or minus sign followed by as many
 * numerical digits as possible, and interprets them as a numerical value.
 * 
 * The string can contain additional characters after those that form the
 * integral number, which are ignored and have no effect on the behavior of
 * this function.
 * 
 * If the first sequence of non-whitespace characters in str is not a valid
 * integral number, or if no such sequence exists because either str is empty
 * or it contains only whitespace characters, no conversion is performed.
 * 
 * If no valid conversion could be performed, a zero value is returned.
 * 
 * Note:
 * 
 * 
 * Only the space character ' ' is considered as whitespace character.
 * Assume we are dealing with an environment which could only store integers
 * within the 32-bit signed integer range: [−2^31,  2^31 − 1]. If the numerical
 * value is out of the range of representable values, INT_MAX (2^31 − 1) or
 * INT_MIN (−2^31) is returned.
 * 
 * 
 * Example 1:
 * 
 * 
 * Input: "42"
 * Output: 42
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: "   -42"
 * Output: -42
 * Explanation: The first non-whitespace character is '-', which is the minus
 * sign.
 * Then take as many numerical digits as possible, which gets 42.
 * 
 * 
 * Example 3:
 * 
 * 
 * Input: "4193 with words"
 * Output: 4193
 * Explanation: Conversion stops at digit '3' as the next character is not a
 * numerical digit.
 * 
 * 
 * Example 4:
 * 
 * 
 * Input: "words and 987"
 * Output: 0
 * Explanation: The first non-whitespace character is 'w', which is not a
 * numerical 
 * digit or a +/- sign. Therefore no valid conversion could be performed.
 * 
 * Example 5:
 * 
 * 
 * Input: "-91283472332"
 * Output: -2147483648
 * Explanation: The number "-91283472332" is out of the range of a 32-bit
 * signed integer.
 * Thefore INT_MIN (−2^31) is returned.
 * 
 */

/*

注意临界判断
1. 正负号
2. 前面全是0的要去除
3. 整数溢出
4. 空串
5. 空值
6. 第一位就为字母的

✔ Accepted
  ✔ 1079/1079 cases passed (36 ms)
  ✔ Your runtime beats 17.36 % of swift submissions
  ✔ Your memory usage beats 7.14 % of swift submissions (20.5 MB)

*/

class Solution {
    func myAtoi(_ str: String) -> Int {
        
        var digitArray = Array<Character>()
        var charArray = Array(str)
        var resultArray = Array<Character>()
        var isNegative = false
        
        // 空串处理
        if str.count == 0 {
            return 0
        }
        
        for i in 0..<10 {
            digitArray.append("\(i)".characters.first!)
        }
        
        for i in 0..<charArray.count {
            
            let tempChar = charArray[i]
            
            if tempChar == " " {
                if resultArray.count != 0 {
                    break
                }
                continue
            }
            
            if tempChar == "-" || tempChar == "+" {
                if resultArray.count != 0 {
                    break;
                }
                if i + 1 < charArray.count && !digitArray.contains(charArray[i+1]) {
                    return 0
                }
                if resultArray.count == 0 && i + 1 < charArray.count && digitArray.contains(charArray[i+1]){
                    if tempChar == "-" {
                        isNegative = true
                    } else {
                        isNegative = false
                    }
                }
                continue
            } else {
                if resultArray.count == 0 && !digitArray.contains(tempChar) {
                    return 0
                }
            }
            
            if resultArray.count != 0 && tempChar != "-" && !digitArray.contains(tempChar)  {
                break;
            }
            
            if digitArray.contains(tempChar) {
                if resultArray.count != 0 && Int(String(resultArray.first!)) == 0 {
                    resultArray.remove(at: 0)
                }
                resultArray.append(tempChar)
            }
            
        }
        
        if resultArray.count == 0 {
            return 0
        }
        
        var result = 0
        
        let numberStr = "2147483647"
        let negativeStr = "2147483648"
        
        if resultArray.count > 10  {
            return isNegative ? -2147483648 : 2147483647
        } else if resultArray.count == 10 {
            
            var tempStr = String()
            if isNegative {
                tempStr = negativeStr
            } else {
                tempStr = numberStr
            }
                                    
            if tempStr < String(resultArray[0..<resultArray.count]) {
                return isNegative ? -2147483648 : 2147483647
            } else {
                result = Int((isNegative ? "-" : "") + String(resultArray[0..<resultArray.count]))!
            }
            
        } else {
            result = Int((isNegative ? "-" : "") + String(resultArray[0..<resultArray.count]))!
        }
        
        return result
        
    }
}

