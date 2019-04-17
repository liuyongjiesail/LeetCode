/*
 * @lc app=leetcode id=14 lang=swift
 *
 * [14] Longest Common Prefix
 *
 * https://leetcode.com/problems/longest-common-prefix/description/
 *
 * algorithms
 * Easy (33.17%)
 * Total Accepted:    439.3K
 * Total Submissions: 1.3M
 * Testcase Example:  '["flower","flow","flight"]'
 *
 * Write a function to find the longest common prefix string amongst an array
 * of strings.
 * 
 * If there is no common prefix, return an empty string "".
 * 
 * Example 1:
 * 
 * 
 * Input: ["flower","flow","flight"]
 * Output: "fl"
 * 
 * 
 * Example 2:
 * 
 * 
 * Input: ["dog","racecar","car"]
 * Output: ""
 * Explanation: There is no common prefix among the input strings.
 * 
 * 
 * Note:
 * 
 * All given inputs are in lowercase letters a-z.
 * 
 */
/*

  二分查找 Binary search （logn）

  思路：
  1. 找出最短的字符串长度
  2. 初始low = 1, high = 最短长度；长度一分为二，判断低位 0~middle 
  3. 拿第一个字符串的低位与后面的字符串低位一一比较，包含则让低位+1，否则让高位-1，直到 low>high停止比较
  4. String(Array(strs[0])[0..<(low + high)/2]) 拿结果
  
  ✔ Accepted
  ✔ 118/118 cases passed (20 ms)
  ✔ Your runtime beats 89.58 % of swift submissions
  ✔ Your memory usage beats 31.11 % of swift submissions (19.7 MB)

*/
 class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        if strs.count == 0 {
            return ""
        }
        
        var minLen:Int = Int(INT32_MAX)
        for string in strs {
            minLen = min(minLen, string.count)
        }
        
        var low:Int = 1
        var high:Int = minLen
        while low <= high {
            let middle = (low + high)/2
            if self.isCommonPrefix(strs, middle) {
                low = middle + 1
            } else {
                high = middle - 1
            }
        }
        return String(Array(strs[0])[0..<(low + high)/2])
    }
    
    func isCommonPrefix(_ strs: [String], _ len:Int) -> Bool {
        
        let str1 = String(Array(strs[0])[0..<len])
        for i in 1..<strs.count {
            if !strs[i].hasPrefix(str1) {
                return false
            }
        }
        return true
    }
    
}

 /*

   分而治之，分治法，一分为二判断

   O(m)

   两两比较得结果
   
   ✔ Accepted
  ✔ 118/118 cases passed (28 ms)
  ✔ Your runtime beats 64.07 % of swift submissions
  ✔ Your memory usage beats 8.89 % of swift submissions (20.2 MB)

 */
/*
 class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0 {
            return ""
        }
        return self.longestCommonPrefix(strs, 0, strs.count - 1)
    }
    
    func longestCommonPrefix(_ strs:[String], _ i:Int, _ j:Int) -> String {
        
        if i == j {
            return strs[i]
        } else {
            let mid = (i+j)/2;
            let left = self.longestCommonPrefix(strs, i, mid)
            let right = self.longestCommonPrefix(strs, mid + 1, j)
            return commonPrefix(left, right)
        }
    }
    
    func commonPrefix(_ left:String, _ right:String) -> String {
        
        var leftArray = Array(left)
        var rightArray = Array(right)
        
        let minNumber = min(leftArray.count, rightArray.count)
        
        for i in 0..<minNumber {
            if leftArray[i] != rightArray[i] {
                return String(leftArray[0..<i])
            }
        }
        
        return String(leftArray[0..<minNumber])
    }
    
}
*/
 /*

   两个for循环
   O(n^2)

   遇到不相等的就返回，一直相等的话一直拼接
   
✔ Accepted
  ✔ 118/118 cases passed (72 ms)
  ✔ Your runtime beats 19.12 % of swift submissions
  ✔ Your memory usage beats 8.89 % of swift submissions (20.2 MB)

 */
 /*
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        var commonPrefix = String()
        
        if strs.count == 0 {
            return commonPrefix
        }
        
        let firstStringArray = Array(strs.first!)
        
        for i in 0..<firstStringArray.count {
            for j in 0..<strs.count {
                let stringArray = Array(strs[j])
                if i >= stringArray.count || firstStringArray[i] != stringArray[i] {
                    return commonPrefix
                }
            }
            commonPrefix.append(firstStringArray[i])
        }
        
        return commonPrefix
        
    }
}
*/
