/*
 * @lc app=leetcode id=18 lang=swift
 *
 * [18] 4Sum
 *
 * https://leetcode.com/problems/4sum/description/
 *
 * algorithms
 * Medium (30.02%)
 * Total Accepted:    224.7K
 * Total Submissions: 744.6K
 * Testcase Example:  '[1,0,-1,0,-2,2]\n0'
 *
 * Given an array nums of n integers and an integer target, are there elements
 * a, b, c, and d in nums such that a + b + c + d = target? Find all unique
 * quadruplets in the array which gives the sum of target.
 * 
 * Note:
 * 
 * The solution set must not contain duplicate quadruplets.
 * 
 * Example:
 * 
 * 
 * Given array nums = [1, 0, -1, 0, -2, 2], and target = 0.
 * 
 * A solution set is:
 * [
 * ⁠ [-1,  0, 0, 1],
 * ⁠ [-2, -1, 1, 2],
 * ⁠ [-2,  0, 0, 2]
 * ]
 * 
 * 
 */

 /*

✔ Accepted
  ✔ 282/282 cases passed (164 ms)
  ✔ Your runtime beats 31.69 % of swift submissions
  ✔ Your memory usage beats 10 % of swift submissions (19.5 MB)

 */

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        if nums.count < 4 {
            return []
        }
        
        var result = Array<Array<Int>>()
        var nums = nums.sorted()
        
        for i in 0..<nums.count - 3 {
            if i > 0 && nums[i] == nums[i-1] {
                continue
            }
            for j in (i + 1)..<nums.count - 2 {
                if j > i + 1 && nums[j] == nums[j - 1] {
                    continue
                }
                var left = j + 1
                var right = nums.count - 1
                while left < right {
                    var tempArray = Array<Int>()
                    let sum = nums[i] + nums[j] + nums[left] + nums[right]
                    if sum == target {
                        
                        tempArray.append(contentsOf: [nums[i], nums[j], nums[left], nums[right]])
                        result.append(tempArray)
                        
                        while left < right && nums[left] == nums[left + 1] {
                            left = left + 1
                        }
                        
                        while left < right && nums[right] == nums[right - 1] {
                            right = right - 1
                        }
                        
                        left = left + 1
                        right = right - 1
                        
                    } else if sum < target {
                        left = left + 1
                    } else {
                        right = right - 1
                    }
                }
            }
            
        }
        
        return Array(result)
    }
    
}

