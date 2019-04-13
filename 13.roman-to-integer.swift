/*
 * @lc app=leetcode id=13 lang=swift
 *
 * [13] Roman to Integer
 *
 * https://leetcode.com/problems/roman-to-integer/description/
 *
 * algorithms
 * Easy (51.86%)
 * Total Accepted:    392.1K
 * Total Submissions: 754.5K
 * Testcase Example:  '"III"'
 *
 * Roman numerals are represented by seven different symbols: I, V, X, L, C, D
 * and M.
 * 
 * 
 * Symbol       Value
 * I             1
 * V             5
 * X             10
 * L             50
 * C             100
 * D             500
 * M             1000
 * 
 * For example, two is written as II in Roman numeral, just two one's added
 * together. Twelve is written as, XII, which is simply X + II. The number
 * twenty seven is written as XXVII, which is XX + V + II.
 * 
 * Roman numerals are usually written largest to smallest from left to right.
 * However, the numeral for four is not IIII. Instead, the number four is
 * written as IV. Because the one is before the five we subtract it making
 * four. The same principle applies to the number nine, which is written as IX.
 * There are six instances where subtraction is used:
 * 
 * 
 * I can be placed before V (5) and X (10) to make 4 and 9. 
 * X can be placed before L (50) and C (100) to make 40 and 90. 
 * C can be placed before D (500) and M (1000) to make 400 and 900.
 * 
 * 
 * Given a roman numeral, convert it to an integer. Input is guaranteed to be
 * within the range from 1 to 3999.
 * 
 * Example 1:
 * 
 * 
 * Input: "III"
 * Output: 3
 * 
 * Example 2:
 * 
 * 
 * Input: "IV"
 * Output: 4
 * 
 * Example 3:
 * 
 * 
 * Input: "IX"
 * Output: 9
 * 
 * Example 4:
 * 
 * 
 * Input: "LVIII"
 * Output: 58
 * Explanation: L = 50, V= 5, III = 3.
 * 
 * 
 * Example 5:
 * 
 * 
 * Input: "MCMXCIV"
 * Output: 1994
 * Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
 * 
 */

 /*

  思路：

  以 "MCMXCIV" 举例

  result = 0
  1.循环这个字符数组，如果i=0，结果就加上这个对应的值 M=1000, result+=1000            result: 1000
  2.i=1 时，因为C，C=100，小于上一个字符 1000，所以也是 result+=100                 result: 1100
  3.i=2 时，因为M, M=1000 大于上一个字符100，所以这两位应该是相减的，但是上面加过了100，所以这里就该减去200  result-=1000-2*100    result:1900
  4.依次类推，XC=100-10=90, result= 1900+90 = 1990, IV=5-1=4, result = 1990+4 = 1994


✔ Accepted
  ✔ 3999/3999 cases passed (44 ms)
  ✔ Your runtime beats 78.93 % of swift submissions
  ✔ Your memory usage beats 6.52 % of swift submissions (20 MB)

 */
class Solution {
    func romanToInt(_ s: String) -> Int {
        
        var result = 0
        let romanDictionary = self.romanDictionary()
        
        let stringArray = Array(s)
        
        for i in 0..<stringArray.count {
            
            let currentString:String = String(stringArray[i])
            var frontString:String = String()
            if i != 0 {
                frontString = String(stringArray[i-1])
            }
            
            if i == 0 || romanDictionary[currentString]! <= romanDictionary[frontString]! {
                result = result + romanDictionary[currentString]!
            } else {
                result = result + romanDictionary[currentString]! - 2 * romanDictionary[frontString]!;
            }
        }
        
        return result;
    }
    
    func romanDictionary() -> Dictionary<String, Int> {
        return ["I" : 1,
                "V" : 5,
                "X" : 10,
                "L" : 50,
                "C" : 100,
                "D" : 500,
                "M" : 1000
        ]
    }
}

