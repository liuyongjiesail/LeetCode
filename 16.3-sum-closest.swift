/*
 * @lc app=leetcode id=16 lang=swift
 *
 * [16] 3Sum Closest
 *
 * https://leetcode.com/problems/3sum-closest/description/
 *
 * algorithms
 * Medium (42.12%)
 * Total Accepted:    321.9K
 * Total Submissions: 734.7K
 * Testcase Example:  '[-1,2,1,-4]\n1'
 *
 * Given an array nums of n integers and an integer target, find three integers
 * in nums such that the sum is closest to target. Return the sum of the three
 * integers. You may assume that each input would have exactly one solution.
 * 
 * Example:
 * 
 * 
 * Given array nums = [-1, 2, 1, -4], and target = 1.
 * 
 * The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
 * 
 * 
 */

/*

  与3Sum 思路基本一致

  排序、半圈加下来与target比较，有接近的就赋值给全局closetSum

✔ Accepted
  ✔ 125/125 cases passed (44 ms)
  ✔ Your runtime beats 55.5 % of swift submissions
  ✔ Your memory usage beats 33.33 % of swift submissions (19.1 MB)

*/

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        
        var nums = nums.sorted()
        var closestSum = 0
        var diff:Int = Int(Int64.max)
        
        for (index, _) in nums.enumerated() {
            if index > 0 && nums[index] == nums[index - 1] {
                continue
            }
            var left = index + 1
            var right = nums.count - 1
            while left < right {
                
                let tempSum = nums[index] + nums[left] + nums[right]
                let tempDiff = abs(tempSum - target)
                
                if tempDiff < diff {
                    diff = tempDiff
                    closestSum = tempSum
                }
                
                if tempSum < target {
                    left = left + 1
                } else if tempSum > target {
                    right = right - 1
                } else {
                    return tempSum
                }
                
            }
        }
        
        return closestSum
    }
}

