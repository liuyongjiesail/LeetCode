/*
 * @lc app=leetcode id=15 lang=swift
 *
 * [15] 3Sum
 *
 * https://leetcode.com/problems/3sum/description/
 *
 * algorithms
 * Medium (23.66%)
 * Total Accepted:    522K
 * Total Submissions: 2.2M
 * Testcase Example:  '[-1,0,1,2,-1,-4]'
 *
 * Given an array nums of n integers, are there elements a, b, c in nums such
 * that a + b + c = 0? Find all unique triplets in the array which gives the
 * sum of zero.
 * 
 * Note:
 * 
 * The solution set must not contain duplicate triplets.
 * 
 * Example:
 * 
 * 
 * Given array nums = [-1, 0, 1, 2, -1, -4],
 * 
 * A solution set is:
 * [
 * ⁠ [-1, 0, 1],
 * ⁠ [-1, -1, 2]
 * ]
 * 
 * 
 */

 /*

  ✘ Time Limit Exceeded
  ✘ 311/313 cases passed (N/A)
  
 */
class Solution {
    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        
        var resultArray = Array<Array<Int>>()
        
        for (index, number) in nums.enumerated() {
            let tempArray = self.twoSum(nums, -number, index)
            resultArray.append(contentsOf: tempArray)
            resultArray = Array(Set(resultArray))
        }
        
        return resultArray
    }
    
    func twoSum(_ nums: [Int], _ target: Int, _ skipIndex: Int) -> [[Int]] {
        var result = Array<Array<Int>>() //初始化结果数组
        var tempDictionary = [Int: Int]() //初始化临时字典
        // 循环目标数组
        for (index, number) in nums.enumerated() {
            if index != skipIndex {
                var tempArray = Array<Int>()
                let temp = target - number  // 计算差值
                if tempDictionary[temp] != nil { // 如果字典中已存储过，说明找到了
                    tempArray.append(temp)
                    tempArray.append(number)
                    tempArray.append(-target)
                    result.append(tempArray.sorted())
                }
                // 以值为key, index 为value 存储元素
                tempDictionary[nums[index]] = index
            }
        }
        return result
    }
}

