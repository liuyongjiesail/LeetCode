/*
 * @lc app=leetcode id=28 lang=swift
 *
 * [28] Implement strStr()
 */

 /*
✔ Accepted
  ✔ 74/74 cases passed (12 ms)
  ✔ Your runtime beats 83.06 % of swift submissions
  ✔ Your memory usage beats 5.66 % of swift submissions (20.9 MB)
 */

 /*

思路：0 ~ 4 字符串比较 1~5 字符串比较，直到 end > haystack 的count 停止
也就是一段一段字符串比较
 
 */

 class Solution {
    
    func strStr(_ haystack: String, _ needle: String) -> Int {
        
        if haystack.count == 0 {
            if needle.count == 0 {
                return 0
            }
            return -1
        }
        
        if needle.count == 0 {
            return 0
        }
        
        let needCount:Int = needle.count
        var start = 0
        var end = needCount - 1
        
        while end < haystack.count {
            let startIndex = haystack.index(haystack.startIndex, offsetBy: start)
            let endIndex = haystack.index(haystack.startIndex, offsetBy: end)
            let substring = haystack[startIndex...endIndex]
            if substring == needle {
                return start
            }
            start += 1
            end += 1
        }
        
        return -1
    }
 }

 /*

思路：双循环比较

✘ Time Limit Exceeded
  ✘ 73/74 cases passed (N/A)
  ✘ answer: 
  ✘ expected_answer: 
  ✘ stdout:

 */
 /*
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        
        if haystack.count == 0 {
            if needle.count == 0 {
                return 0
            }
            return -1
        }
        
        if needle.count == 0 {
            return 0
        }

        let needCount:Int = needle.count
        let charArray = Array<Character>(haystack)
        
        for (index, i) in haystack.enumerated() {
            if i == needle.first {
                var temp:Int = 0
                var tempIndex = index
                for j in needle {
                    if tempIndex > haystack.count - 1 {
                        return -1
                    }
                    if j == charArray[tempIndex] {
                        temp = temp + 1
                        tempIndex = tempIndex + 1
                    }
                }
                if temp == needCount {
                    return index
                }
            }
        }
        
        return -1
    }
}
*/
