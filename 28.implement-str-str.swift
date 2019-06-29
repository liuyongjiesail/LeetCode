/*
 * @lc app=leetcode id=28 lang=swift
 *
 * [28] Implement strStr()
 */

 /*

思路：双循环比较

✘ Time Limit Exceeded
  ✘ 73/74 cases passed (N/A)
  ✘ answer: 
  ✘ expected_answer: 
  ✘ stdout:

 */
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        
        if (haystack.count == 0 && needle.count == 0) ||
            needle.count == 0 {
            return 0
        }

        if haystack.count < needle.count {
            return -1
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

