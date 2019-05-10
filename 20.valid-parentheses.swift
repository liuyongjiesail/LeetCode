/*
 * @lc app=leetcode id=20 lang=swift
 *
 * [20] Valid Parentheses
 *
 * https://leetcode.com/problems/valid-parentheses/description/
 *
 * algorithms
 * Easy (36.14%)
 * Total Accepted:    575.2K
 * Total Submissions: 1.6M
 * Testcase Example:  '"()"'
 *
 * Given a string containing just the characters '(', ')', '{', '}', '[' and
 * ']', determine if the input string is valid.
 * 
 * An input string is valid if:
 * 
 * 
 * Open brackets must be closed by the same type of brackets.
 * Open brackets must be closed in the correct order.
 * 
 * 
 * Note that an empty string is also considered valid.
 * 
 * Example 1:
 * 
 * 
 * Input: "()"
 * Output: true
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: "()[]{}"
 * Output: true
 * 
 * 
 * Example 3:
 * 
 * 
 * Input: "(]"
 * Output: false
 * 
 * 
 * Example 4:
 * 
 * 
 * Input: "([)]"
 * Output: false
 * 
 * 
 * Example 5:
 * 
 * 
 * Input: "{[]}"
 * Output: true
 * 
 * 
 */

 /*

 思路：
 1. 初始化一个数组，
 2. 遍历字符串，如果目前的字符串是 左边符号，加入数组中
 3. 否则，挨个判断字符是否是 右边符号  ）] } 且 数组的最后一个元素 不是对应的左边符号，就返回false, 否则 数组移除最后一个元素
 4. 到最后如果数组是空了，就是ture, 否则 是 false

✔ Accepted
  ✔ 76/76 cases passed (8 ms)
  ✔ Your runtime beats 99.41 % of swift submissions
  ✔ Your memory usage beats 6.12 % of swift submissions (20.9 MB)

 */
class Solution {
    func isValid(_ s: String) -> Bool {
        
        var tempArray = Array<Character>()
        
        for char in s {
            if char == "(" || char == "[" || char == "{" {
                tempArray.append(char)
            } else {
                if char == ")" && tempArray.last != "(" {
                    return false
                }
                if char == "]" && tempArray.last != "[" {
                    return false
                }
                if char == "}" && tempArray.last != "{" {
                    return false
                }
                tempArray.removeLast()
            }
        }

        return tempArray.count == 0
    }
}

